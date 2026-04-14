CLASS zcl_40_29_meth_aufrufen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_29_meth_aufrufen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.


    DATA connection TYPE REF TO lcl_connection.

    DATA connections TYPE TABLE OF REF TO lcl_connection.

    connection = NEW #(  ).

    connection->set_attributes(
      i_carrier_id    = 'LH'
      i_connection_id = 0117
    ).

    APPEND connection TO connections.

    connection = NEW #(  ).

    connection->set_attributes(
       i_carrier_id    = 'AA'
       i_connection_id = 001
    ).

    APPEND connection TO connections.

    connection = NEW #(  ).

    connection->set_attributes(
      i_carrier_id    = 'SQ'
      i_connection_id = 0021
    ).

    APPEND connection TO connections.

    LOOP AT connections INTO connection.
      connection->get_attributes(
        IMPORTING
          e_carrier_id    = carrier_id
          e_connection_id = connection_id
      ).

      out->write( |Flugvebindung: { carrier_id } { connection_id }| ).

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
