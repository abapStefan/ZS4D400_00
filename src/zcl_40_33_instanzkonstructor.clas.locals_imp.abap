*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_hotel DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.

*      DATA pools TYPE i.
*      DATA name  TYPE string READ-ONLY.   " READ-ONLY Zusatz
*      DATA beds  TYPE i.

    CLASS-METHODS class_constructor.

    CLASS-DATA table TYPE TABLE of string .

    CLASS-DATA n_o_hotels TYPE i.

    METHODS CONSTRUCTOR
      IMPORTING
        i_name  TYPE string
        i_beds  TYPE i
        i_pools TYPE i
      RAISING
        cx_abap_invalid_value.

    METHODS get_attributes
      EXPORTING
        e_name  TYPE string
        e_beds  TYPE i
        e_pools TYPE i.


    CLASS-METHODS get_n_o_hotels RETURNING VALUE(r_count) TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA pools TYPE i.
    DATA name  TYPE string.
    DATA beds  TYPE i.

ENDCLASS.

CLASS lcl_hotel IMPLEMENTATION.

  METHOD class_constructor.

  DATA: text TYPE string VALUE 'Huhu ich bin der Classconstructor'.
  APPEND text to table.

  ENDMETHOD.

  METHOD constructor.

  IF i_name is INITIAL or i_beds is INITIAL.
       RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.


    me->name = i_name.
    me->beds = i_beds.
    me->pools = i_pools.
    n_o_hotels = n_o_hotels + 1.

  ENDMETHOD.

  METHOD get_attributes.

    e_name = name.
    e_beds = beds.
    e_pools = pools.

  ENDMETHOD.

  METHOD get_n_o_hotels.

    APPEND |-----------------------------------------------| TO r_count.
    APPEND |Gesamtanzahl der Hotels: { n_o_hotels }        | TO r_count.

  ENDMETHOD.

ENDCLASS.
