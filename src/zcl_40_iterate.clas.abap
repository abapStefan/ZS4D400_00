CLASS zcl_40_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   DATA output TYPE TABLE OF string.       " Aufgabe 2

   CONSTANTS max_count TYPE i VALUE 20.

   DATA numbers TYPE TABLE of i.

   DO max_count TIMES.

   CASE sy-index.

     WHEN 1.
        APPEND 0 TO numbers.
     WHEN 2.
        APPEND 1 TO numbers.

     WHEN OTHERS.            " Die ersten Beiden zahlen sind gesetzt, jetzt kommt die Berrechnung

        APPEND numbers[ sy-index - 2 ] + numbers[ sy-index - 1 ] TO numbers.

   ENDCASE.


     ENDDO.

     DATA(counter) = 0.    " Aufgabe 2.3
     LOOP AT numbers INTO DATA(number).       " Tabelle mit Inline Deklaration

*     counter = counter + 1.               " möglichkeiten
     counter += 1.

     APPEND |{ counter width = 4 } : { number width = 10 ALIGN = RIGHT }| TO output.

     ENDLOOP.

     out->write(  data = output name = |Dier ersten { max_count } Fibonacci Zahlen| ).


  ENDMETHOD.
ENDCLASS.
