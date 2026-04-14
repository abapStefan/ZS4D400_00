CLASS zcl_40_45_lok_struk_fuell DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_45_lok_struk_fuell IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

Types: BEGIN OF st_connection,                         " Lokale Struktur deklariert
           airport_from_id TYPE /dmo/airport_from_id,
           airport_to_id   TYPE /dmo/airport_to_id,
           carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

     DATA connection TYPE st_connection.

     connection-airport_from_id = 'HAJ'.
     connection-airport_to_id   = 'BKK'.
     connection-carrier_name = 'Breidenbach Fly'.

     out->write( '-------------------------------------------' ).
     out->write( connection ).


  ENDMETHOD.
ENDCLASS.
