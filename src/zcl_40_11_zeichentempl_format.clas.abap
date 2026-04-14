CLASS zcl_40_11_zeichentempl_format DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_11_zeichentempl_format IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Formatoption DATA

  DATA gv_date TYPE d VALUE '20260304'.

        out->write( |{ gv_date }| ).     " => "202660304", interne Format

        out->write( |{ gv_date DATE = ISO }| ).   " => 2026-03-04 Ausgabe im ISO Format

        out->write( |{ gv_date DATE = USER }| ).  " => 04/03/2026,  04.03.2026


* Formatoption für Zahlen

  DATA gv_number TYPE p LENGTH 3 DECIMALS 2 VALUE '-113.15'.

         out->write( |{ gv_number }| ).

         out->write( |{ gv_number NUMBER = USER }| ).  " => -113.15 oder -113,15

         out->write( |{ gv_number SIGN = RIGHT }| ).   " => 113.15-

         out->write( |{ gv_number STYLE = SCIENTIFIC }| ).  " -1.1315E+02



  ENDMETHOD.

ENDCLASS.
