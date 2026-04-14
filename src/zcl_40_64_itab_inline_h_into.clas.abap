CLASS zcl_40_64_itab_inline_h_into DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_64_itab_inline_h_into IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Inline Deklaration hinter INTO Table


    SELECT
          FROM /dmo/i_airport
          FIELDS AirportID, Name AS Airportname  " Feld Aliasnamen wird dann als Spaltennamen verwendet
        WHERE city = 'London'
        INTO TABLE @DATA(airport).       " Hier immer eine Standardtabelle ohne Schlüssel

    out->write( airport ).



  ENDMETHOD.
ENDCLASS.
