CLASS zcl_40_06_typkonvertierung DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_06_typkonvertierung IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: my_int    TYPE i,
          my_result TYPE p LENGTH 8 DECIMALS 2,
          my_char11   TYPE c LENGTH 11 VALUE 'Breidenbach',
          my_char4  TYPE c LENGTH 4 VALUE 'HOME',
          my_string TYPE string.


* Implizite Typkonvertierung

         my_int = '12345'.                   " c -> i
         my_result = '-2315.15'.             " c -> p
*         my_int = my_char11.                 " c -> i  Potzenzieller Laufzeitfehler
         my_char4 = my_char11.               " c -> c  Potenziellen Informationsverlust, hier Ausgabe Brei
         my_string = 'Hallo             '.   " c -> string Der String ignoriert schliessende Leerzeichen

         out->write( my_char4 && | | && my_string && | | && my_int ).





  ENDMETHOD.
ENDCLASS.
