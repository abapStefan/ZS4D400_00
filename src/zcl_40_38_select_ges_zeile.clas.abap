CLASS zcl_40_38_select_ges_zeile DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_38_select_ges_zeile IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connect TYPE /dmo/connection.

    SELECT SINGLE *
      FROM /dmo/connection
*    FIELDS connection_id, airport_from_id, airport_to_id
     WHERE carrier_id = 'LH'
       AND connection_id = 0400
      INTO @connect.

    IF sy-subrc <> 0.
    out->write( 'Diesen Datensatz gibt es nicht' ).
    ELSE.
    out->write( connect ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
