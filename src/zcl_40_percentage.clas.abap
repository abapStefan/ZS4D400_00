CLASS zcl_40_percentage DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_percentage IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: gv_number1 TYPE i,
        gv_number2 TYPE i,
        gv_result TYPE p.

        gv_number1 = 14.
        gv_number2 = 200.

    CALL METHOD lcl_klasse=>get_percentage
       EXPORTING
        iv_act        = gv_number1
        iv_max        = gv_number2
       IMPORTING
        ev_percentage = gv_result.


    out->write( |Ergebnis: | && gv_result && |%| ).


  ENDMETHOD.
ENDCLASS.
