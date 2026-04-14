CLASS zcl_40_02_variablen_dekl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_02_variablen_dekl IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA nachname TYPE c LENGTH 11.


  nachname = 'Breidenbach'.

  DATA my_var1 TYPE i.
  DATA my_var2 TYPE string.
  DATA my_var3 TYPE string VALUE 'Hello Rita'.


  out->write( nachname && | | && my_var3 && |         | && 'Hallo' ).
" Zwischen den PIPES bestimmt Leerzeichen

  ENDMETHOD.

ENDCLASS.
