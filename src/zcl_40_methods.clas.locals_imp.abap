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
     i_connection_id TYPE /dmo/connection_id
     RAISING
     cx_abap_invalid_value.

     METHODS get_output RETURNING VALUE(r_output) TYPE string_table.

     METHODS get_attributes
     EXPORTING
     e_carrier_id TYPE /dmo/carrier_id
     e_connection_id TYPE /dmo/connection_id.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD set_attributes.

  if i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
  RAISE EXCEPTION TYPE cx_abap_invalid_value.
  ENDIF.

  me->carrier_id = i_carrier_id.
  me->connection_id = i_connection_id.

  ENDMETHOD.

  METHOD get_attributes.

  e_carrier_id = carrier_id.
  e_connection_id = connection_id.

  ENDMETHOD.

  METHOD get_output.

  APPEND |---------------------------------------------| to r_output.
  APPEND | Carrier:    { carrier_id }                  | to r_output.
  APPEND | Connection: { connection_id }               | to r_output.

  ENDMETHOD.

ENDCLASS.
