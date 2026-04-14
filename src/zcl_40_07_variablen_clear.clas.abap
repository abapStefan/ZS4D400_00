CLASS zcl_40_07_variablen_clear DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_07_variablen_clear IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA my_var1 TYPE i.
    DATA my_var2 TYPE i VALUE 12345.
    DATA my_var3 TYPE string.

    my_var1 = my_var2.
    my_var3 = 'Hello World'.


    out->write( my_var1 && | | && my_var2 && | | && my_var3 ).
    " Zwischen den PIPES bestimmt Leerzeichen

    CLEAR: my_var1,      " Wert auf Null zurückgesetzt
           my_var2,      " Wert auf Null zurückgesetzt
           my_var3.       " String hat jetzt leerzeichen

    out->write( my_var1 && | | && my_var2 && | | && my_var3 ).

  ENDMETHOD.

ENDCLASS.
