CLASS zcl_40_62_itab_sql_into_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_62_itab_sql_into_table IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Hier ein Array Fetch / Ist keine Select Schleife

    DATA airport_full TYPE STANDARD TABLE OF /dmo/i_airport
                      WITH NON-UNIQUE KEY AirportID.

    SELECT
          FROM /dmo/i_airport
          FIELDS AirportID, Name, City, CountryCode
        WHERE city = 'London'
        INTO TABLE @airport_full.

    out->write( airport_full ).



  ENDMETHOD.
ENDCLASS.
