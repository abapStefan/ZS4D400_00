CLASS zcl_40_03_lokale_globale_typen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_03_lokale_globale_typen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Lokale Datentypen mit TYPES nur Lokal im Programm

  TYPES c_type TYPE c LENGTH 25.
  TYPES p_type TYPE p LENGTH 3 DECIMALS 2.


  DATA nachname TYPE c_type.
  DATA vorname TYPE c_type.

* Globaler Type, von jedem zu erreichen

  DATA flughafen TYPE /dmo/airport_id.

  nachname = 'Breidenbach'.
  vorname = 'Stefan'.
  flughafen = 'LH'.


  out->write( vorname && | | && nachname && | | && flughafen ).


  ENDMETHOD.

ENDCLASS.
