CLASS zcl_40_10_zeichenkettentempl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_10_zeichenkettentempl IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    DATA : gv_zahl1 TYPE i VALUE 5,
           gv_zahl2 TYPE i VALUE 6,
           gv_gesamt   TYPE p LENGTH 5 DECIMALS 2,
           curr_code  TYPE c LENGTH 3 VALUE 'USD'.

    DATA gv_text TYPE string.
    gv_text = |Hallo Stefan|.      " Nur Literaler Text


    out->write( gv_text ).

    out->write( |{ gv_zahl1 + gv_zahl2 }| ).    " 1 Eigebetteter Ausdruck

    out->write( |Gesamt: { gv_zahl1 + gv_zahl2 } EUR| ).     " Text und 1 Ausdruck

    out->write( |Gesamt: { gv_zahl1 * gv_zahl2 } { curr_code } | ).   " Text und 2 Ausdrücke

  ENDMETHOD.

ENDCLASS.
