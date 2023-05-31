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
/*Inizio funzioni per query*/

void UtentiAzienda(PGconn *conn, PGresult *res) // query 1
{
    res = PQexec(conn, "SELECT count(*) as num, u.nome, u.azienda, u.pIva FROM Utente as u \
                   WHERE pIva IS NOT NULL GROUP BY u.nome, u.azienda, u.pIva");
    checkResults(res, conn);
    int tuple = PQntuples(res);
    int campi = PQnfields(res);
    printIntestazione(campi, res);
    printValue(tuple, campi, res);
}

void PagamentoUtente(PGconn *conn, PGresult *r) // query 2
{
    // trovare tutti i pagamenti di un utente dato il suo id
    string query = "SELECT p.id, p.metodo FROM pagamento as p, utente as u, carrello as c WHERE \
                    u.id = c.id and c.id = p.id and u.nome = $1::VRCHAR GROUP BY p.id, p.metodo";
    PGresult *stmt = PQprepare(conn, "query_pagamento", query.c_str(), 1, NULL);
    string utente;
    cin >> utente;

    const char *par = utente.c_str();
    r = PQexecPrepared(conn, "query_pagamento", 1, &par, NULL, 0, 0);
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
    string query = "SELECT u.nome, p.nome, p.prezzo FROM utente as u, prodotto as p, carrello as c WHERE\
                    u.id = c.id and c.id = p.SKU and u.id = $1::varchar GROUP BY u.nome, p.nome, p.prezzo ORDER BY p.prezzo ASC";
    PGresult *stmt = PQprepare(conn, "query_carrello", query.c_str(), 1, NULL);
    string utente;
    cin >> utente;

    const char *par = utente.c_str();
    r = PQexecPrepared(conn, "query_carrello", 1, &par, NULL, 0, 0);
}

void ProdottiMagazzino(PGconn *conn, PGresult *r) // query 5
{
    // restituire la lista dei prodotti all'interno di un magazzino dato il suo id
    string query = "SELECT p.nome, p.quantita FROM prodotti as p, magazzino as m WHERE m.id = p.SKU and m.id = $1::VARCHAR";
    PGresult *stmt = PQprepare(conn, "query_carrello", query.c_str(), 1, NULL);
    string magazzino;
    cin >> magazzino;

    const char *par = magazzino.c_str();
    r = PQexecPrepared(conn, "query_carrello", 1, &par, NULL, 0, 0);
}

void OrdiniUtente(PGconn *conn, PGresult *r) // query 6
{
}

void PagamentoUtente(PGconn *conn, PGresult *r) // query 7
{
}

void SpedizioniVersoUtente(PGconn *conn, PGresult *r) // query 8
{
}

void TracciamentoSpedizione(PGconn *conn, PGresult *r) // query 9
{
}

void UtentiIvaCF(PGconn *conn, PGresult *r) // query 10
{
}