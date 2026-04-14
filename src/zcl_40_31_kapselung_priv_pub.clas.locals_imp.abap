*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

class lcl_hotel definition create public.

  public section.

*      DATA pools TYPE i.
*      DATA name  TYPE string READ-ONLY.   " READ-ONLY Zusatz
*      DATA beds  TYPE i.

      class-data n_o_hotels TYPE i.

      METHODS set_attributes
            IMPORTING
             i_name TYPE string
             i_beds TYPE i
             i_pools TYPE i
             RAISING
             cx_abap_invalid_value.

      METHODS get_attributes
            EXPORTING
             e_name TYPE string
             e_beds TYPE i
             e_pools TYPE i.

      CLASS-METHODS get_n_o_hotels RETURNING VALUE(r_count) TYPE string_table.

  protected section.
  private section.

        DATA pools TYPE i.
      DATA name  TYPE string.
      DATA beds  TYPE i.

endclass.

class lcl_hotel implementation.

  method set_attributes.

     me->name = i_name.
     me->beds = i_beds.
     me->pools = i_pools.
     n_o_hotels = n_o_hotels + 1.

  endmethod.

  method get_attributes.

     e_name = name.
     e_beds = beds.
     e_pools = pools.

  endmethod.

  method get_n_o_hotels.

    APPEND |-----------------------------------------------| to r_count.
    APPEND |Gesamtanzahl der Hotels: { n_o_hotels }        | to r_count.

  endmethod.

endclass.
