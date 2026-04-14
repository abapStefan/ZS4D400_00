CLASS zcl_40_65_select_union DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_65_select_union IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    SELECT FROM /dmo/i_carrier
        FIELDS 'Airline' AS TYPE, AirlineID AS ID, Name
        WHERE currencyCode = 'GBP'

UNION ALL

    SELECT FROM /dmo/i_airport
          FIELDS 'Airport' AS TYPE, AirportID AS ID, Name
        WHERE city = 'London'

        INTO TABLE @DATA(namen).

    out->write( namen ).



  ENDMETHOD.
ENDCLASS.
