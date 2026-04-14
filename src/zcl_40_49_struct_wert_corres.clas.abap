CLASS zcl_40_49_struct_wert_corres DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_49_struct_wert_corres IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF st_connection,                         " Lokale Struktur deklariert
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    TYPES: BEGIN OF st_connection_nested,                         " Lokale Struktur deklariert
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             message         TYPE symsg,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection_nested.

    DATA connection TYPE st_connection.

    DATA connection_nested TYPE st_connection_nested.

    connection = VALUE #( airport_from_id = 'FRK'
                          airport_to_id   = 'JFK'
                          carrier_name    = 'Airforce One' ).

* Zweite Value überschreibt den ersten Value

    connection = VALUE #( airport_from_id = 'HAJ'
                          airport_to_id   = 'BKK'
                          carrier_name    = 'Breidenbach Fly' ).

*     connection = VALUE #(  ).     " Struktur wird aufgebaut aber nur mit initial werten

*    connection_nested = connection.    " Hier wird das Ergebnis falsch angezeigt

     connection_nested = CORRESPONDING #( connection ).  " Hier alles gut, weil namensgleiche Felder

* Nicht angegebene Typen werden mit Initial Werten gefüllt
    out->write( '-------------------------------------------' ).
    out->write(  `Beispiel: Lokale Nested Struktur Typ füllen ` ).
    out->write( connection_nested ).   " wechseln mit connection


  ENDMETHOD.
ENDCLASS.
