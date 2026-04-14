CLASS zcl_40_21_debugger DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_21_debugger IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS qf TYPE c LENGTH 3 VALUE 'QF'.

    DATA: carrid1 TYPE c LENGTH 3,
          carrid2 TYPE c LENGTH 3 VALUE 'LH',
          count   TYPE i.

    carrid1 = qf.
    carrid2 = carrid1.

    count += 1.

    count = count + 1.

    CLEAR: carrid1,
           carrid2,
           count.

    out->write( ' ' ).

  ENDMETHOD.
ENDCLASS.
