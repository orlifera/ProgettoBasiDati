#include <iostream>
#include <fstream>
#include <cstdio>
#include "pass.h"
#include "dependencies/include/libpq-fe.h"

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

void grafica(int i)
{
    switch (i)
    {
    case 0:
        cout << "\n-----Inizio Query-----\n";
        break;
    case 1:
        cout << "Query 1. Trovare gli utenti che sono azienda.\n";
        break;
    case 2:
        cout << "Query 2. Trovare tutti i pagamenti di un certo utente.\n";
        break;
    case 3:
        cout << "Query 3. Trovare tutti i pagamenti con un certo metodo.\n";
        break;

    case 4:
        cout << "Query 4. Trovare tutti i prodotti del carrello degli utenti.\n";
        break;

    case 5:
        cout << "Query 5. Trovare che prodotti sono in un certo magazzino dato il suo codice\
                 identificativo.\n";
        break;

    case 6:
        cout << "Query 6. Trovare il numero di ordini di un utente.\n";
        break;

    case 7:
        cout << "Query 7. Trovare il numero di aziende dentro il database.\n";
        break;

    case 8:
        cout << "Query 8. Trovare tutte le spedizioni verso un utente.\n";
        break;

    case 9:
        cout << "Query 9. Tracciamento spedizione.\n";
        break;

    case 10:
        cout << "Query 10. Utenti con p.iva e codice fiscale (deve restituire NULL).\n";
        break;

    default:
        break;
    }
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
}

void PagamentoMetodoUtente(PGconn *conn, PGresult *r) // query 3
{
}

void CarrelloUtenti(PGconn *conn, PGresult *r) // query 4
{
}

void ProdottiMagazzino(PGconn *conn, PGresult *r) // query 5
{
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