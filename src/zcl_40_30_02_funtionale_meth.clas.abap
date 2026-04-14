CLASS zcl_40_30_02_funtionale_meth DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_30_02_funtionale_meth IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: kreis  TYPE f,
          area   TYPE f,
          radius TYPE f,
          durch  TYPE f.


    radius = 15.

    kreis = lcl_kreisberechnung=>umfang( radius ).
    area = lcl_kreisberechnung=>flaeche( radius ).
    durch = lcl_kreisberechnung=>durch( radius ).

    out->write( |Radius: { radius } | && |Durchmesser: { durch } | && | Umfang: { kreis } | && |Flächeninhalt: { area }| ).

  ENDMETHOD.
ENDCLASS.
