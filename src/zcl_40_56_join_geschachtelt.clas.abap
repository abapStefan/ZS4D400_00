CLASS zcl_40_56_join_geschachtelt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_56_join_geschachtelt IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



     DATA connection TYPE /dmo/connection.

     SELECT SINGLE
     FROM ( /dmo/connection AS c
     LEFT OUTER JOIN /DMO/airport AS f
               ON c~airport_from_id = f~airport_id )    " Erster Join mit Alias f für Fluhafen FROM

     LEFT OUTER JOIN /DMO/airport AS t
               ON c~airport_to_id = t~airport_id       " Zweiter Join mit Alias t für Flughafen TO

     FIELDS c~carrier_id, c~connection_id, c~airport_from_id, c~airport_to_id,

            f~name AS airport_from_name, t~name AS airport_to_name

     WHERE c~carrier_id = 'LH'
     AND c~connection_id = 400

     INTO @DATA(connection_join).

     out->write( connection_join ).


  ENDMETHOD.
ENDCLASS.
