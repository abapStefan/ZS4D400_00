CLASS zcl_40_23_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_23_local_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA connection TYPE REF TO lcl_connection.

  DATA connection2 TYPE REF TO lcl_connection.

  connection = NEW #(  ).

  connection->carrier_id = 'LH'.
  connection->connection_id = 0440.

  connection2 = connection.

  ENDMETHOD.

ENDCLASS.
