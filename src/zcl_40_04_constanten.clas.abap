CLASS zcl_40_04_constanten DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_04_constanten IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS my_const1 TYPE i VALUE 987654.
    CONSTANTS my_const2 TYPE string VALUE 'Hallo Stefan'.
    CONSTANTS my_const3 TYPE n LENGTH 5 VALUE IS INITIAL.

    DATA my_var1 TYPE c LENGTH 15.

    my_var1 = 'Breidenbach'.


    my_var1 = 'Tolles Wetter'.

*  my_const2 = 'Breidenbach'.    " Hier wird ein Fehler angezeigt werden, da eine Constante nicht geändert werden kann


    out->write( my_const3 ).


  ENDMETHOD.

ENDCLASS.
