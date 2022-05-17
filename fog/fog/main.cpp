#include <iostream>
#include <string>
#include <vector>
#include <cstring>

#include "dependencies/include/libpq-fe.h"

using std::cout;
using std::cin;
using std::string;
using std::vector;

#define PG_HOST "127.0.0.1"
#define PG_USER "postgres"
#define PG_PASSWORD "root"
#define PG_PORT 5432
#define PG_DB "fogfestival"

PGresult* doQuery(PGconn* conn, string query){

    PGresult* res;
    res = PQexec(conn,query.c_str());

    if(query.find("SELECT") != string::npos){
        //Do query
        if(PQresultStatus(res) != PGRES_TUPLES_OK){
            cout<<"Errore di esecuzione query "<<query<<" "<<PQerrorMessage(conn);
            return res;
        }
    }else{
        //Do command
        if(PQresultStatus(res)!=PGRES_COMMAND_OK){
            cout<<"Errore esecuzione "<<PQerrorMessage(conn);

        }
    }

    //No error so return
    return res;

}

void printTable(PGresult* res){

    const int ncol = PQnfields(res);
    const int nrows = PQntuples(res);

    vector<int> maxLengths;

    //Set lenghts to column title
    for(int c=0; c<ncol; c++){
        char* name = PQfname(res,c);
        maxLengths.push_back(strlen(name));
    }
 
    //Set lenght to max value length
    for(int r=0; r<nrows; r++){
        for(int c=0; c<ncol; c++){
            const char* val = PQgetvalue(res,r,c);
            int len = strlen(val);
            if(len>maxLengths[c])
                maxLengths[c] = len;
        }
    }


    //Display Columns
    for(int c=0; c<ncol; c++){
        char* name = PQfname(res,c);
        int spaces = maxLengths[c]-strlen(name);
        if(spaces<0)
            spaces *= -1;

        cout<<"| "<<name;
        for(int s=0; s<spaces; s++){
            cout<<" ";
        }
        if(c<ncol-1)
            cout<<" ";
        else
            cout<<" |";
    }

    cout<<"\n";

    for(int c=0; c<ncol; c++){

        cout<<"+";
        int spaces = maxLengths[c]+1;
        for(int s=0; s<spaces; s++){
            cout<<"-";
        }
        if(c<ncol-1)
            cout<<"-";
        else
            cout<<"-+";
    }

    cout<<"\n";

    //Diplay values
    for(int r=0; r<nrows; r++){
        for(int c=0; c<ncol; c++){
            const char* val = PQgetvalue(res,r,c);
            int spaces = maxLengths[c]-strlen(val); 
            if(spaces<0)
                spaces *= -1;   

            cout<<"| "<<val;
            for(int s=0; s<spaces; s++){
                cout<<" ";
            }
            if(c<ncol-1)
                cout<<" ";
            else
                cout<<" |";
                
        }
        cout<<"\n";
    }

}

int main(int argc, char **argv){

    //parse argv for connection arguments

    
    //do connection and test
    char connParams[120];
    sprintf(connParams,"user=%s password=%s dbname=%s port=%d",PG_USER,PG_PASSWORD,PG_DB,PG_PORT);
    PGconn *conn;
    conn = PQconnectdb(connParams);

    if(PQstatus(conn)!= CONNECTION_OK){
        cout<<"Errore di connessione: "<<PQerrorMessage(conn);
    }

    //print welcome + menu

    PGresult* res = doQuery(conn, "SELECT * FROM festival'");

    printTable(res); 


    PQclear(res);

    PQfinish(conn);

    return 1;

}




