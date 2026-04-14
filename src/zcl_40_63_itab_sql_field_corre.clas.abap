CLASS zcl_40_63_itab_sql_field_corre DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_63_itab_sql_field_corre IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF st_carrier,
             AirportID TYPE /dmo/airport_id,
             Name      TYPE /dmo/carrier_name,
           END OF st_carrier.

* Hier mit Corresponding

    DATA airport TYPE STANDARD TABLE OF st_carrier
                      WITH NON-UNIQUE KEY AirportID.

    SELECT
          FROM /dmo/i_airport
          FIELDS *
        WHERE city = 'London'
        INTO CORRESPONDING FIELDS OF TABLE @airport.       " Ohne corresponding nicht kompatibel

    out->write( airport ).



  ENDMETHOD.
ENDCLASS.
