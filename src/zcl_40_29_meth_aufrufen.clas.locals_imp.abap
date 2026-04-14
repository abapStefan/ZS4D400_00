*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declaration

CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    CLASS-DATA conn_counter TYPE i.

    METHODS set_attributes
          IMPORTING
        i_carrier_id TYPE /dmo/carrier_id OPTIONAL
        i_connection_id TYPE /dmo/connection_id.

    METHODS get_attributes
          EXPORTING
        e_carrier_id TYPE /dmo/carrier_id
        e_connection_id TYPE /dmo/connection_id.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD set_attributes.

       carrier_id = i_carrier_id.
       connection_id = i_connection_id.
       conn_counter += 1.

  ENDMETHOD.

  METHOD get_attributes.

        e_carrier_id = carrier_id.
        e_connection_id = connection_id.

  ENDMETHOD.

ENDCLASS.
