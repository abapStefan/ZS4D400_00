CLASS zcl_40_13_if_case_verzweigung DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_13_if_case_verzweigung IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: number1 TYPE i,
          number2 TYPE i.
    DATA  result TYPE i.

    number1 = 7.
    number2 = 7.

  IF number1 > number2.
     out->write( |Zahl 1 ist größer| ).
  ELSEIF number1 < number2.
     out->write( |Zahl 2 ist größer| ).
  ELSE.
     out->write( |Beide Zahlen sind gleich| ).
  ENDIF.

  result = number1 + number2.

  CASE result.

  WHEN 13.
      out->write( |Boh richtige Glückszahlen von Stefan erwischt| ).
  WHEN 20.
      out->write( |Boh richtige 20 erwischt| ).
  WHEN 30.
      out->write( |Boh richtige 30 erwischt| ).
  WHEN OTHERS.
      out->write( |Das war leider nichts| ).

 ENDCASE.


*    out->write( output ).

  ENDMETHOD.
ENDCLASS.
