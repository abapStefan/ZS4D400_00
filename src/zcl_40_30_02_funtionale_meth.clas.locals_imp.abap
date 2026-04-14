*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

class lcl_kreisberechnung definition create private.

  public section.

  CONSTANTS pi TYPE f VALUE '3.14159265358979324'.

  CLASS-METHODS: umfang IMPORTING radius TYPE f RETURNING VALUE(u) TYPE f.

  CLASS-METHODS: flaeche IMPORTING radius TYPE f RETURNING VALUE(f) TYPE f.

  CLASS-METHODS: durch IMPORTING radius TYPE f RETURNING VALUE(d) TYPE f.


  protected section.
  private section.

endclass.

class lcl_kreisberechnung implementation.

  method umfang.

  u = 2 * pi * radius.

  endmethod.

  method flaeche.

  f = pi * radius ** 2.

  endmethod.

  method durch.

  d = 2 * radius.

  endmethod.

endclass.
