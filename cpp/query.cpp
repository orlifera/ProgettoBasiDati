#include "header.h"

int main()
{
    char conninfo[255];
    int i;

    PGconn *con = connection(conninfo);
    PGresult *r;

    cout << "Scegliere quale query effettuare tra le seguenti, 0 per interrompere il programma:" << endl;
    lista(); // output delle query eseguibili
    cin >> i;
    while (i != 0)
    {
        switch (i)
        {
        case 1:
            cout << "\nQuery 1.\n";
            UtentiAzienda(con, r);
            break;
        case 2:
            cout << "\nQuery 2.\n";
            listaUtenti(con, r);
            PagamentoUtente(con, r);

            break;
        case 3:
            cout << "\nQuery 3.\n";
            OrdiniUtenteHaving(con, r);
            break;

        case 4:
            cout << "\nQuery 4.\n";
            listaUtenti(con, r);
            CarrelloUtenti(con, r);
            break;

        case 5:
            cout << "\nQuery 5.\n";
            listaMagazzino(con, r);
            ProdottiMagazzino(con, r);
            break;

        case 6:
            cout << "\nQuery 6.\n";
            OrdiniUtente(con, r);
            break;

        case 7:
            cout << "\nQuery 7.\n";
            listaCarrelli(con, r);
            TotaleCarrello(con, r);
            break;

        case 8:
            cout << "\nQuery 8.\n";
            listaUtenti(con, r);
            SpedizioniVersoUtente(con, r);
            break;

        case 9:
            cout << "\nQuery 9.\n";
            listaSpedizioni(con, r);
            TracciamentoSpedizione(con, r);
            break;

        case 10:
            cout << "\nQuery 10.\n";
            UtentiIvaCF(con, r);
            break;

        default:
            break;
        }

        cout << "\nScegli la prossima query: " << endl;
        lista();
        cin >> i;
    }
}