CLASS zcl_40_14_ausnahmeausloesung_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_14_ausnahmeausloesung_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Erste Ausnahme

*    DATA: zaehler TYPE i VALUE 5,
*          nenner TYPE i VALUE 0.
*    DATA  result TYPE p.
*
*    result = zaehler / nenner.         " Ausnahme wird aufgerufen Teilen durch null
*
*    out->write( result ).


** Zweite Ausnahme
*
*    DATA: ziel TYPE i,
*          quelle TYPE string VALUE 'Banane'.
*
*     ziel = quelle.
*
*    out->write( '' ).


* Dritte Ausnahme

    DATA: nummer TYPE i,
          zahlen TYPE TABLE OF i.

     CLEAR zahlen.

     nummer = zahlen[ 1 ].

    out->write( nummer ).



  ENDMETHOD.
ENDCLASS.
