CLASS zcl_40_08_inline_deklaration DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_08_inline_deklaration IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Explizite Deklaration mit der DATA Anweisung

    DATA my_var1 TYPE string.
    DATA my_var2 TYPE i.
    DATA my_var3 TYPE i.
    DATA my_var4 TYPE i.

    my_var1 = 'Hello World'.
    my_var2 = '17'.
    my_var3 = my_var2.
    my_var4 = my_var2 + my_var3.


    out->write( my_var1 && | | && my_var2 && | | && my_var3 && | | && my_var4 ).

* Implizite Deklaration mit DATA Anweisung

    DATA(my_var5) = `Hallo Stefan`.
    DATA(my_var6) = 19.
    DATA(my_var7) = my_var3.
    DATA(my_var8) = my_var6 + my_var7.

    out->write( my_var5 && | | && my_var6 && | | && my_var7 && | | && my_var8 ).


  ENDMETHOD.

ENDCLASS.
