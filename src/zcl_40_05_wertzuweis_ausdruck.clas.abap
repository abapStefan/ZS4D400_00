CLASS zcl_40_05_wertzuweis_ausdruck DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_05_wertzuweis_ausdruck IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  TYPES tv_percentage TYPE p LENGTH 3 DECIMALS 2.   " Lokalen Datentyp erstellt Deklariert

  DATA: gv_percentage TYPE tv_percentage,           " auf lokalen Typen definiert

        gv_number1 TYPE i VALUE 17,                 " mit Value 17 zugewiesen

        gv_number2 LIKE gv_number1,                 " nuer der Typ I zugewiesen nicht der Wert

        gv_City TYPE c LENGTH 15 VALUE 'Hannover',  " lokal erstellter Typ mit Namen Hannover

        gv_carrid TYPE /DMO/airport_id,              " auf globalen im Dictonary erstelltes Datenelement

        gv_number3 TYPE i VALUE 3.

* Zuordungsoperator

       gv_percentage = gv_number1 * gv_number3.       " Berechnung zweier Variablen

       out->write( 'Ergebnis: ' && | | && gv_percentage ).

  ENDMETHOD.

ENDCLASS.
