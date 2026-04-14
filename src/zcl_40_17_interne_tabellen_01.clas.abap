CLASS zcl_40_17_interne_tabellen_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_17_interne_tabellen_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA my_var TYPE i VALUE 12345.
    DATA tabelle TYPE TABLE OF i.

    APPEND 23456 TO tabelle.
    APPEND 56789 TO tabelle.
    APPEND 67834 TO tabelle.
    APPEND 93478 TO tabelle.




    out->write( tabelle ).

  ENDMETHOD.
ENDCLASS.
