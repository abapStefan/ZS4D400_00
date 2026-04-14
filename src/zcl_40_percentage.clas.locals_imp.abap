*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

class lcl_klasse definition.

  public section.


CLASS-METHODS: get_percentage
      IMPORTING
         iv_act   TYPE i
         iv_max   TYPE i
      EXPORTING
         ev_percentage TYPE p.



  protected section.
  private section.


endclass.

class lcl_klasse implementation.


  method get_percentage.

  ev_percentage = iv_act / iv_max * 100.

  endmethod.

endclass.
