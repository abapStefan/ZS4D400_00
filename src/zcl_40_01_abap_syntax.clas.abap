CLASS zcl_40_01_abap_syntax DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.






CLASS zcl_40_01_abap_syntax IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Beispiel für ABAP Anweisungen

  DATA: name TYPE c LENGTH 10.
  DATA: text TYPE string.

  CONCATENATE 'HALLO STEFAN' name INTO text.

  out->write( text ).

  DATA: lv_text TYPE string.
  DATA: lv_text2 TYPE string.

  lv_text = 'HALLO'.
  lv_text2 = 'STEFAN'.

  CONCATENATE lv_text lv_text2 INTO lv_text SEPARATED BY space..

  out->write( lv_text ).

* Beispiel für Ausdrücke

 text = 'Hallo'.
 text = name.

 text = replace(  val = 'Hello World'
                  sub = 'Welt'                " mit World würde der Wert weggenommen werden
                  with = name ).

 out->write( text ).

 text = cond #( WHEN text = 'Hello World'  THEN 'Hallo Rita' && name ELSE text ).
" Hello World wird durch Hallo Rita ersetzt
 out->write( text ).



  ENDMETHOD.
ENDCLASS.
