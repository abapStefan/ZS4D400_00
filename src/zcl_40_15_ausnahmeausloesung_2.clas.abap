CLASS zcl_40_15_ausnahmeausloesung_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_15_ausnahmeausloesung_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: gv_num1 TYPE i,
        gv_num2 TYPE i,
        gv_result TYPE p.

*  DATA: pa_num1 TYPE c LENGTH 10 VALUE 'abc',
*        pa_num2 TYPE c LENGTH 10 VALUE '9999999999'.

*  DATA: pa_num1 TYPE c LENGTH 10 VALUE '1',
*        pa_num2 TYPE c LENGTH 10 VALUE '9999999999'.

  DATA: pa_num1 TYPE c LENGTH 10 VALUE '1',
        pa_num2 TYPE c LENGTH 10 VALUE '0'.


  TRY.

   gv_num1 = pa_num1.
   gv_num2 = pa_num2.

   gv_result = gv_num1 / gv_num2.
   out->write( |Ergebnis:| && gv_result ).

   CATCH cx_sy_conversion_no_number.
      out->write( |Nummer ist kein Integer| ).

   CATCH CX_SY_CONVERSION_OVERFLOW.
      out->write( |Nummer ist viel zu lang| ).

   CATCH CX_SY_ZERODIVIDE.
     out->write( |Teilen durch null nicht erlaubt| ).

  ENDTRY.




  ENDMETHOD.
ENDCLASS.
