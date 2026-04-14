CLASS zcl_40_57_komplexe_itab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_57_komplexe_itab IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connections_1 TYPE TABLE OF /dmo/connection.  " DEFAULT Standard Tabelle mit Zeilentyp auf Datenbanktabelle mit nicht eindeutigem Schlüssel

    DATA connnections_2 TYPE STANDARD TABLE OF /dmo/connection
                        WITH NON-UNIQUE DEFAULT KEY.    " Standard Tabelle mit nicht eindeutigem Schlüssel

    DATA connnections_3 TYPE SORTED TABLE OF  /dmo/connection
                        WITH NON-UNIQUE KEY airport_from_id airport_to_id.    " Sortierte Tabelle mit nicht eindeutigem Schlüssel

    DATA connections_4 TYPE HASHED TABLE OF /dmo/connection          " Hash Tabelle mit eindeutigem Schlüssel
                        WITH UNIQUE KEY carrier_id connection_id.

    DATA connections_5 TYPE /dmo/t_flight.


    TYPES: BEGIN OF st_connection,                             " Lokale Struktur deklarieren
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    TYPES tt_connection TYPE SORTED TABLE OF st_connection     " Lokalen Tabellentyp mit Zeilentyp der lokalen Struktur
                        WITH UNIQUE KEY carrier_id connection_id.

    DATA connections_6 TYPE tt_connection.     " Interne Tabelle auf lokal erstellter Tabelle

    out->write( connections_1 ).

  ENDMETHOD.
ENDCLASS.
