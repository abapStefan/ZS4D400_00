CLASS zcl_40_18_itab_global_lokal DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_18_itab_global_lokal IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Lokalen Tabellentyp deklariert

  TYPES tytab TYPE TABLE OF i.

  DATA tabelle TYPE tytab.      " Das ist eine Interne Tabelle definiert auf den lokalen Tabellentypen

* Globaler Tabelletyp auf Interne Tabelle

  DATA fluege TYPE /dmo/t_flight.

* Oder Tabelle erstellen auf DB Tabellenstruktur mit TYPE TABLE OF


  DATA flug   TYPE TABLE OF /dmo/flight.
    out->write( tabelle ).

  ENDMETHOD.
ENDCLASS.
