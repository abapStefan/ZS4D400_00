CLASS zcl_40_16_schleifenkonstrukte DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_16_schleifenkonstrukte IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* DO Schleife mit angegebener Zahl von Iterationen

*  DO 5 Times.
*
*     out->write( sy-index ).
*
*  ENDDO.

* DO Schleife mit Abruch einer logischen Bedingung
*
*  DO.
*
*  IF sy-index = 10.
*  EXIT.
*  ENDIF.
*  out->write( sy-index ).
*  ENDDO.

* WHILE Schleife

  DATA: sek TYPE i.

    sek = 10.

  WHILE sek < 20.
  out->write( sek ).
  sek += 1 .                       "oder sek = sek - 1.
  ENDWHILE.

  ENDMETHOD.
ENDCLASS.
