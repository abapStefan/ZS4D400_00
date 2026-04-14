CLASS zcl_40_37_select_sy_subrc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_37_select_sy_subrc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.

    SELECT SINGLE
      FROM /dmo/connection
    FIELDS airport_from_id, airport_to_id
     WHERE carrier_id = 'LH'
       AND connection_id = 0400
      INTO ( @airport_from_id, @airport_to_id ).

    IF sy-subrc <> 0.
    out->write( 'Diesen Datensatz gibt es nicht' ).
    ELSE.
    out->write( airport_from_id && | | && airport_to_id ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
