CLASS zcl_40_61_itab_sql DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_61_itab_sql IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Erinnerung SELECT SINGLE

DATA airport_full TYPE /dmo/i_airport.

   SELECT SINGLE
         FROM /dmo/i_airport
         FIELDS AirportID, Name, City,CountryCode
       WHERE CITY = 'Zurich'
       INTO @airport_full.

       out->write( airport_full ).



  ENDMETHOD.
ENDCLASS.
