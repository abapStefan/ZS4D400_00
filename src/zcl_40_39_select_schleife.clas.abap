CLASS zcl_40_39_select_schleife DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_39_select_schleife IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connect TYPE /dmo/connection.

    SELECT *
      FROM /dmo/connection
     WHERE carrier_id = 'LH'                                " Wenn keine WHERE Klausel, dann gesamte Tablle
      INTO @connect.

       out->write( connect ).        " Muss in der Schlleife vor dem Endselect

     ENDSELECT.                      " Schleife mit Endselect

    IF sy-subrc <> 0.
    out->write( 'Diesen Datensatz gibt es nicht' ).

    ENDIF.


  ENDMETHOD.
ENDCLASS.
