CLASS zcl_40_52_into_corres_fields DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_52_into_corres_fields IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

     Types: BEGIN OF st_connection,                         " Lokale Struktur deklariert
           airport_from_id TYPE /dmo/airport_from_id,
           airport_to_id   TYPE /dmo/airport_to_id,
           carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

     DATA connection_short TYPE st_connection.

     DATA connection TYPE /dmo/connection.

     SELECT SINGLE
     FROM /dmo/connection
     FIELDS *
     WHERE carrier_id = 'LH'
     INTO CORRESPONDING FIELDS OF @connection_short.


     out->write( connection_short ).


  ENDMETHOD.
ENDCLASS.
