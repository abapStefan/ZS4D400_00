CLASS zcl_40_60_itab_modify_anwe DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_60_itab_modify_anwe IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_connection,                             " Lokale Struktur deklarieren
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
             currency_code   TYPE /dmo/currency_code,
           END OF st_connection.


    DATA carriers TYPE STANDARD TABLE OF st_connection     " Interne Tabelle mit Zeilentyp der lokalen Struktur
                        WITH NON-UNIQUE KEY carrier_id.

    DATA carrier LIKE LINE OF carriers .     " Arbeitsbereich auf Interne erstellter Tabelle

    carrier = VALUE #( carrier_id = 'AA'
                      connection_id = 0017
                      airport_from_id = 'JFK'
                      airport_to_id = 'PSG'
                      carrier_name = 'American Airline'
                      currency_code = 'EUR' ).

    APPEND carrier TO carriers.

    carrier = VALUE #( carrier_id = 'LH'
                      connection_id = 0400
                      airport_from_id = 'HAJ'
                      airport_to_id = 'BKK'
                      carrier_name = 'Lufthana AG'
                      currency_code = 'EUR' ).

     APPEND carrier TO carriers.

* 1 MODIFY TABLE ANWEISUNG

    carrier = carriers[ carrier_id = 'AA' ].

    carrier-currency_code = 'USD'.

    MODIFY TABLE carriers FROM carrier.


* 2 Modify Anweisung ohne TABLE Anweisung mit INDEX

*    carrier-carrier_id = 'BB'.
*    carrier-currency_code = 'MON'.
*
*    MODIFY carriers FROM carrier INDEX 2.     " Hier wird der 2 Index 'LH' mit den Werten 'BB' überschrieben
*

* 3 MODIFY ohne INDEX

*   LOOP AT carriers INTO carrier WHERE currency_code IS NOT INITIAL.
*
*         carrier-currency_code = 'BLA'.
*
*         MODIFY carriers FROM carrier.
*
*   ENDLOOP.

       out->write( carriers ).

  ENDMETHOD.
ENDCLASS.
