CLASS zcl_40_55_join_syntax_abap_sql DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_55_join_syntax_abap_sql IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



     DATA connection TYPE /dmo/connection.

     SELECT SINGLE
     FROM /dmo/connection AS c
     LEFT OUTER JOIN /DMO/airport AS f
               ON c~airport_from_id = f~airport_id     " Hier mit alias
     FIELDS c~carrier_id, c~connection_id, c~airport_from_id, c~airport_to_id,
            f~name AS airport_from_name
     WHERE carrier_id = 'LH'
     INTO @DATA(connection_join).

     out->write( connection_join ).


  ENDMETHOD.
ENDCLASS.
