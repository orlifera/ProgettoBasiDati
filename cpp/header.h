#include <iostream>
#include <fstream>
#include <cstdio>
#include "pass.h"
#include "dependencies/include/libpq-fe.h"
#include <unistd.h>

#define PG_HOST "127.0.0.1" // oppure " localhost " o " postgresql "
#define PG_USER "postgres"  // il vostro nome utente
#define PG_DB "Progetto"    // il nome del database
#define PG_PASS pass        // la vostra password
#define PG_PORT 5432

using namespace std;

PGconn *connection(char *conninfo)
{

    sprintf(conninfo, " user =%s password =%s dbname =%s hostaddr =%s port =%d", PG_USER, PG_PASS, PG_DB, PG_HOST, PG_PORT);

    PGconn *conn = PQconnectdb(conninfo);

    if (PQstatus(conn) != CONNECTION_OK)
    {
        cout << " Errore di connessione \n"
             << PQerrorMessage(conn);
        PQfinish(conn);
        exit(1);
    }

    cout << " Connessione avvenuta correttamente " << endl;

    return conn;
}

void printIntestazione(int campi, PGresult *res)
{
    for (int i = 0; i < campi; ++i)
    {
        cout << PQfname(res, i) << "\t\t";
    }
}

void printValue(int tuple, int campi, PGresult *res)
{
    for (int i = 0; i < tuple; ++i)
    {
        for (int j = 0; j < campi; ++j)
        {

            cout << PQgetvalue(res, i, j) << "\t\t";
        }
        cout << endl;
    }
}

void checkResults(PGresult *res, const PGconn *conn)
{
    if (PQresultStatus(res) != PGRES_TUPLES_OK)
    {
        cout << " Risultati inconsistenti " << PQerrorMessage(conn);
        PQclear(res);
        exit(1);
    }
}

void printFile(int tuple, int campi, PGresult *res, ofstream myfile)
{
    for (int i = 0; i < campi; ++i)
    {
        myfile << PQfname(res, i) << ",";
    }
}

void printValueFile(int tuple, int campi, PGresult *res, ofstream myfile)
{
    for (int i = 0; i < tuple; ++i)
    {
        for (int j = 0; j < campi; ++j)
        {
            myfile << PQgetvalue(res, i, j) << ",";
        }
        myfile << endl;
    }
}

void lista()
{
    cout << "1. Trovare tutti gli utenti che sono registrati come azienda nel Database.\n2. trovare tutti i pagamenti di un utente dato il suo codice\n3. da ripensare.\n4. Trovare tutti i prodotti che ogni utente ha nel proprio carrello.\n5. Trovare che prodotti sono in un certo magazzino dato il suo codice identificativo.\n6. Trovare il numero di ordini di un utente.\n7. Prezzo totale di ogni carrello.\n8. Tutte le spedizioni verso un utente.\n9. Tracciamento spedizione(Ritorna consegnato se il dataconsegna <= current_timetsamp o la data di consegna altrimenti).\n10. Utenti con pIva e CF (deve restituire NULL)\n";
}

void listaUtenti(PGconn *conn, PGresult *res)
{
    cout << "Scegliere uno dei seguenti utenti: " << endl;
    res = PQexec(conn, "SELECT u.id FROM utente as u");
    int tuple = PQntuples(res);
    int campi = PQnfields(res);
    printValue(tuple, campi, res);
}

void listaMagazzino(PGconn *conn, PGresult *res)
{
    cout << "Scegliere uno dei seguenti magazzini: " << endl;
    res = PQexec(conn, "SELECT m.id FROM magazzino as m");
    int tuple = PQntuples(res);
    int campi = PQnfields(res);
    printValue(tuple, campi, res);
}

void listaCarrelli(PGconn *conn, PGresult *r)
{
    cout << "Scegliere uno dei carrelli elencati: " << endl;
    r = PQexec(conn, "SELECT c.id FROM carrello as c");
    int tuple = PQntuples(r);
    int campi = PQnfields(r);
    printValue(tuple, campi, r);
}

void listaSpedizioni(PGconn *conn, PGresult *r)
{
    cout << "Scegliere un tracking id: " << endl;
    r = PQexec(conn, "SELECT s.id FROM spedizione as s");
    int tuple = PQntuples(r);
    int campi = PQnfields(r);
    printValue(tuple, campi, r);
}

/*Inizio funzioni per query*/

void UtentiAzienda(PGconn *conn, PGresult *res) // query 1
{
    res = PQexec(conn, "SELECT u.nome, u.azienda, u.pIva FROM Utente as u WHERE pIva IS NOT NULL AND u.pIva <> '' GROUP BY u.nome, u.azienda, u.pIva");
    checkResults(res, conn);
    int tuple = PQntuples(res);
    int campi = PQnfields(res);
    printIntestazione(campi, res);
    printValue(tuple, campi, res);
}

void PagamentoUtente(PGconn *conn, PGresult *r) // query 2
{
    // trovare tutti i pagamenti di un utente dato il suo id
    string query = "SELECT * FROM Pagamento WHERE Carrello IN(SELECT Id FROM Carrello WHERE Utente = $1::varchar)";
    PGresult *stmt = PQprepare(conn, "query_pagamento", query.c_str(), 1, NULL);
    string utente;
    cin >> utente;

    const char *par = utente.c_str();
    r = PQexecPrepared(conn, "query_pagamento", 1, &par, NULL, 0, 0);
    checkResults(r, conn);
    int tuple = PQntuples(r);
    int campi = PQnfields(r);
    printIntestazione(campi, r);
    printValue(tuple, campi, r);
}

void PagamentoMetodoUtente(PGconn *conn, PGresult *r) // query 3
{
    // string query = "";
    // PGresult *stmt = PQprepare(conn, "query_metodo", query.c_str(), 1, NULL);
    // string metodo;
    // cin >> metodo;

    // const char *par = metodo.c_str();
    // r = PQexecPrepared(conn, "query_pagamento", 1, &par, NULL, 0, 0);
}

void CarrelloUtenti(PGconn *conn, PGresult *r) // query 4
{
    // Trovare tutti i prodotti che ogni utente ha nel proprio carrello.
    string query = "SELECT u.nome AS Utente, c.id AS Carrello, p.nome AS Prodotto FROM Utente as u, prodotto as p, carrello as c, contenuto as con WHERE u.Id = c.Utente and c.id = con.carrello and con.prodotto = p.sku  and u.id = $1::varchar ORDER BY Utente, Carrello";
    PGresult *stmt = PQprepare(conn, "query_carrello", query.c_str(), 1, NULL);
    string utente;
    cin >> utente;

    const char *par = utente.c_str();
    r = PQexecPrepared(conn, "query_carrello", 1, &par, NULL, 0, 0);
    checkResults(r, conn);
    int tuple = PQntuples(r);
    int campi = PQnfields(r);
    printIntestazione(campi, r);
    printValue(tuple, campi, r);
}

void ProdottiMagazzino(PGconn *conn, PGresult *r) // query 5
{
    // restituire la lista dei prodotti all'interno di un magazzino dato il suo id
    string query = "SELECT p.nome as prodotto, m.id as magazzino FROM prodotto as p, magazzino as m WHERE(m.id = p.magazzino and m.id = $1::VARCHAR) GROUP BY p.nome, m.id ORDER BY m.id ";
    PGresult *stmt = PQprepare(conn, "query_carrello", query.c_str(), 1, NULL);
    string magazzino;
    cin >> magazzino;

    const char *par = magazzino.c_str();
    r = PQexecPrepared(conn, "query_carrello", 1, &par, NULL, 0, 0);

    checkResults(r, conn);
    int tuple = PQntuples(r);
    int campi = PQnfields(r);
    printIntestazione(campi, r);
    printValue(tuple, campi, r);
}

void OrdiniUtente(PGconn *conn, PGresult *r) // query 6
{
    // tutti gli ordini di un utente, il contenuto di ogni ordine e il prezzo totale
    PQexec(conn, "SELECT u.nome, o.id, STRING_AGG(p.nome, ', ') as Prodotti, sum(p.prezzo) as Totale FROM Utente as u, prodotto as p, ordine as o GROUP BY u.nome, o.id ORDER BY Totale ASC");

    checkResults(r, conn);
    int tuple = PQntuples(r);
    int campi = PQnfields(r);
    printIntestazione(campi, r);
    printValue(tuple, campi, r);
}

void TotaleCarrello(PGconn *conn, PGresult *r) // query 7
{
    string query = "SELECT c.id, sum(p.prezzo) as totale, count(con.prodotto) as NumeroProdotti FROM carrello as c, prodotto as p, contenuto as con WHERE c.id = con.carrello and con.prodotto = p.SKU and c.id = $1::varchar GROUP BY c.id";

    PGresult *stmt = PQprepare(conn, "query_carrello_totale", query.c_str(), 1, NULL);

    string carrello;
    cin >> carrello;

    const char *par = carrello.c_str();

    r = PQexecPrepared(conn, "query_carrello_totale", 1, &par, NULL, 0, 0);
    checkResults(r, conn);
    int tuple = PQntuples(r);
    int campi = PQnfields(r);
    printIntestazione(campi, r);
    printValue(tuple, campi, r);
}

void SpedizioniVersoUtente(PGconn *conn, PGresult *r) // query 8
{
}

void TracciamentoSpedizione(PGconn *conn, PGresult *r) // query 9
{
    string query = "SELECT CASE WHEN s.DataConsegna <= CURRENT_TIMESTAMP THEN 'consegnato' ELSE to_char(    s.DataConsegna, 'YYYY-MM-DD HH24:MI:SS') END AS StatoConsegna, s.id FROM Spedizione as s WHERE s.id = $1::varchar GROUP BY s.id";

    PGresult *stmt = PQprepare(conn, "query_carrello_totale", query.c_str(), 1, NULL);

    string track;
    cin >> track;

    const char *par = track.c_str();

    r = PQexecPrepared(conn, "query_carrello_totale", 1, &par, NULL, 0, 0);
    checkResults(r, conn);
    int tuple = PQntuples(r);
    int campi = PQnfields(r);
    printIntestazione(campi, r);
    printValue(tuple, campi, r);
}

void UtentiIvaCF(PGconn *conn, PGresult *r) // query 10
{
    string query = "";
}