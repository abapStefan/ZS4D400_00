CLASS zcl_40_09_arithm_ausdruecke DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_09_arithm_ausdruecke IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    DATA : gv_zahl1 TYPE i,
           gv_zahl2 TYPE i,
           gv_erg   TYPE p LENGTH 16 DECIMALS 14,
           gv_erg2  TYPE p LENGTH 16 DECIMALS 1.

    gv_zahl1 = 5.
    gv_zahl2 = 6.

    gv_erg = gv_zahl1 + gv_zahl2.           " + Addition - Subtraktion * Multiplikation

    out->write( gv_erg ).

    gv_erg = (  gv_zahl1 + gv_zahl2 ) / 3.  " / mit Division

    out->write( gv_erg ).

    gv_erg = ( 2 * gv_zahl1 + 3 * gv_zahl2 ) / 5.  " Durchschnitt berechnet

    out->write( gv_erg ).

    gv_erg2 = (  gv_zahl1 + gv_zahl2 ) / 3.  " z.B. mit Rundung auf 1 Nachkommastelle

    out->write( gv_erg2 ).


  ENDMETHOD.

ENDCLASS.
