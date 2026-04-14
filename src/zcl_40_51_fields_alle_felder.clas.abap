CLASS zcl_40_51_fields_alle_felder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_51_fields_alle_felder IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



     DATA connection TYPE /dmo/i_connection.

     SELECT SINGLE
     FROM /dmo/i_connection
     FIELDS *
     WHERE AirlineID = 'LH'
     INTO @connection.


     out->write( connection ).


  ENDMETHOD.
ENDCLASS.
