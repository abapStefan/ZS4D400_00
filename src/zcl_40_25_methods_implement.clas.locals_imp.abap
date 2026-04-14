*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

class lcl_hotel definition create public.

  public section.

      DATA pools TYPE i.
      DATA name  TYPE string.
      DATA beds  TYPE i.

      class-data n_o_counter TYPE i.

      METHODS set_attributes
            IMPORTING
             i_name TYPE string
             i_beds TYPE i
             i_pools TYPE i.

      METHODS get_attributes
            EXPORTING
             e_name TYPE string
             e_beds TYPE i
             e_pools TYPE i.

  protected section.
  private section.

endclass.

class lcl_hotel implementation.

  method set_attributes.

     me->name = i_name.
     me->beds = i_beds.
     me->pools = i_pools.
     n_o_counter = n_o_counter + 1.

  endmethod.

  method get_attributes.

     e_name = name.
     e_beds = beds.
     e_pools = pools.

  endmethod.

endclass.
