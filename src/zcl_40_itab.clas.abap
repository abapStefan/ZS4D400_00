CLASS zcl_40_itab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_itab IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    DATA connection TYPE REF TO lcl_connection.

    DATA connections TYPE TABLE OF REF TO lcl_connection.

    TRY.
        connection = NEW #( i_carrier_id = 'LH'
                            i_connection_id = 0400 ).
      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).
    ENDTRY.

    APPEND connection TO connections.

    TRY.
        connection = NEW #( i_carrier_id = 'AA'
                            i_connection_id = 0017 ).
      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).
    ENDTRY.

    APPEND connection TO connections.

    TRY.
        connection = NEW #( i_carrier_id = 'SQ'
                            i_connection_id = 0001 ).
      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).
    ENDTRY.

    APPEND connection TO connections.

    LOOP AT connections INTO connection.
      out->write( connection->get_output(  ) ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
