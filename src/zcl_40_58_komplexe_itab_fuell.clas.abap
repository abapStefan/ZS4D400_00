CLASS zcl_40_58_komplexe_itab_fuell DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_58_komplexe_itab_fuell IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_connection,                             " Lokale Struktur deklarieren
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

* Append funktioniert nur mit Standard Tabellen (normalerweise)

    TYPES tt_connection TYPE STANDARD TABLE OF st_connection     " Lokalen Tabellentyp mit Zeilentyp der lokalen Struktur
                        WITH NON-UNIQUE KEY carrier_id connection_id.

    DATA connections TYPE tt_connection.     " Interne Tabelle auf lokal erstellter Tabelle

*    DATA connection TYPE st_connection.      " Arbeitsbereich Struktur auf lokaler Struktur st_connection

    DATA connection LIKE LINE OF connections.  " Arbeitsbereich auf Zeilentyp der Internen Tabelle connections

* Befüllen des Arbeitsbereichs entweder Struktur mit -  / Struktur immer mit Kopmponentenselektor

    connection-carrier_id = 'LH'.
    connection-connection_id = 0400.
    connection-airport_from_id = 'HAJ'.
    connection-airport_to_id = 'BKK'.
    connection-carrier_name = 'Breidenbach Fly'.

    APPEND connection TO connections.        " Zeile der internen Tabelle hinzufügen
*   INSERT connection INTO TABLE connections.   " Bei Sorted Tables

* oder die Struktur mit VALUE und den einzelnen Komponenten

    connection = VALUE #( carrier_id = 'AA'
                          connection_id = 0017
                          airport_from_id = 'JFK'
                          airport_to_id = 'PSG'
                          carrier_name = 'Stefan Fly' ).

    APPEND connection TO connections.     " Zeile der internen Tabelle hinzufügen

*    INSERT connection INTO TABLE connections.

* oder mit VALUE Ausdruck Direkt in der APPEND Anweisung / dann brauche ich keine WA

    APPEND VALUE #( carrier_id = 'QF'
                             connection_id = 0815
                             airport_from_id = 'BER'
                             airport_to_id = 'FRK'
                             carrier_name = 'Meine Fluggesellschaft' )
             TO connections.

*    INSERT VALUE #( carrier_id = 'QF'
*                             connection_id = 0815
*                             airport_from_id = 'BER'
*                             airport_to_id = 'FRK'
*                             carrier_name = 'Meine Fluggesellschaft' )
*          INTO TABLE connections.

*  DELETE connections WHERE carrier_id = 'AA'.
*   CLEAR connections.                 " Alles löschen

    IF connections IS INITIAL.
      out->write( 'Tabelle ist leer' ).
    ENDIF.

*   APPEND connection TO connections.

*   connection = connections[ 2 ].          " Indexzugriff 2 Zeile
*   connection = connections[ airport_from_id = 'BER' airport_to_id = 'FRK' ].  " Schlüsselzugriff

*    SORT connections ASCENDING by carrier_id.    " Sortierung mach carrier_id
*
    LOOP AT connections INTO connection.   " Alle Zeilen
*
    out->write( connection ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
