CLASS zcl_40_35_select_einzelsatz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_35_select_einzelsatz IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA airport_from_id TYPE /dmo/airport_from_id.

    SELECT SINGLE
      FROM /dmo/connection
    FIELDS airport_from_id
     WHERE carrier_id = 'LH'
       AND connection_id = 0400
      INTO @airport_from_id.

    out->write( airport_from_id ).


  ENDMETHOD.
ENDCLASS.
