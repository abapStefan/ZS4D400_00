CLASS zcl_40_12_zeichenoperator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_12_zeichenoperator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA: result TYPE string,
          teil1 TYPE string VALUE 'Hallo',
          teil2 TYPE string VALUE 'Welt'.


     out->write( teil1 && teil2 ).       " Hier ohne Leerzeichen

     out->write( teil1 && | | && teil2 ).  " Hier mit Leerzeichen

  ENDMETHOD.

ENDCLASS.
