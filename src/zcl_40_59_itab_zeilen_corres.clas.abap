CLASS zcl_40_59_itab_zeilen_corres DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_59_itab_zeilen_corres IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_connection,                             " Lokale Struktur deklarieren
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
             price                 type /dmo/flight_price,
           END OF st_connection.

* Append funktioniert nur mit Standard Tabellen (normalerweise)

    TYPES tt_connection TYPE STANDARD TABLE OF st_connection     " Lokalen Tabellentyp mit Zeilentyp der lokalen Struktur
                        WITH NON-UNIQUE KEY carrier_id connection_id.

    DATA carriers TYPE tt_connection.     " Interne Tabelle auf lokal erstellter Tabelle

    DATA carrier TYPE /DMO/t_flight.      " Zweite Tabelle erstellt

        carriers = VALUE #( ( carrier_id = 'LH' carrier_name = 'Lufthansa AG' )
                            ( carrier_id = 'JL' carrier_name = 'Japan Airline' )
                            ( carrier_id = 'AA' carrier_name = 'American Airline' ) ).

        carrier =  CORRESPONDING #( carriers ) .



    out->write( carrier ).



  ENDMETHOD.
ENDCLASS.
