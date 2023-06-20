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

PGconn *connection(char *conninfo);

void printIntestazione(int campi, PGresult *res);

void printValue(int tuple, int campi, PGresult *res);

void checkResults(PGresult *res, const PGconn *conn);

void printFile(int tuple, int campi, PGresult *res, ofstream myfile);

void printValueFile(int tuple, int campi, PGresult *res, ofstream myfile);

void lista();

void listaUtenti(PGconn *conn, PGresult *res);

void listaMagazzino(PGconn *conn, PGresult *res);

void listaCarrelli(PGconn *conn, PGresult *r);

void listaSpedizioni(PGconn *conn, PGresult *r);

/*Inizio funzioni per query*/

void UtentiAzienda(PGconn *conn, PGresult *res); // query 1

void PagamentoUtente(PGconn *conn, PGresult *r); // query 2

void OrdiniUtenteHaving(PGconn *conn, PGresult *r); // query 3

void CarrelloUtenti(PGconn *conn, PGresult *r); // query 4

void ProdottiMagazzino(PGconn *conn, PGresult *r); // query 5

void OrdiniUtente(PGconn *conn, PGresult *r); // query 6

void TotaleCarrello(PGconn *conn, PGresult *r); // query 7

void SpedizioniVersoUtente(PGconn *conn, PGresult *r); // query 8

void TracciamentoSpedizione(PGconn *conn, PGresult *r); // query 9

void UtentiIvaCF(PGconn *conn, PGresult *r); // query 10