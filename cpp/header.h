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