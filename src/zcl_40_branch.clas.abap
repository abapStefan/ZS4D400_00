CLASS zcl_40_branch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_branch IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: number1 TYPE i,
          number2 TYPE i,
          op      TYPE c LENGTH 1.

    DATA: output TYPE string.

    DATA result TYPE p LENGTH 8 DECIMALS 2.

* Eingabewerte

    number1 =  8.
    number2 =  69.
    op      = '%'.

* Berechnung

    CASE op.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.

        TRY.
            result = number1 / number2 .
          CATCH cx_sy_zerodivide INTO DATA(lo_error).
            output = |Fehler: { lo_error->get_longtext(  ) }|.
        ENDTRY.

      WHEN '%'.

         CALL METHOD zcl_00_compute=>get_percentage
            EXPORTING
            iv_act    = number1
            iv_max    = number2
            importing
            ev_percentage = result.

      WHEN OTHERS.
        output = |'{ op } ' Ist kein gültiger Operator|.
    ENDCASE.


    IF output IS INITIAL.    " Bisher kein Fehler
      output = |{ number1 } { op } { number2 } = { result }|.
    ENDIF.

* Ausgabe

    out->write( output ).

  ENDMETHOD.
ENDCLASS.
