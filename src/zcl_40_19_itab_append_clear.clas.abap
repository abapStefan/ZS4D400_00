CLASS zcl_40_19_itab_append_clear DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_19_itab_append_clear IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Lokaler Tabellentyp

    TYPES tytab TYPE STANDARD TABLE OF i WITH NON-UNIQUE DEFAULT KEY.
*    TYPES tytab TYPE SORTED TABLE OF i WITH NON-UNIQUE DEFAULT KEY.   " Laufzeitfehler sortierung passt nicht

    DATA tabelle TYPE tytab.      " Das ist eine Interne Tabelle vom lokalen Tabellentypen

* Tabelletypen auf global
    DATA tt_fluege TYPE TABLE OF /dmo/flight.   " Interne Tabelle auf Datenbanktabelle als Zeilentyp lokal
    DATA tt_flueg TYPE /DMO/t_flight.           " Interne Tabelle auf Globalem Tabellentyp

    DATA zahl TYPE i.    " Variable


    zahl = 63456.
*    APPEND zahl TO tabelle.              " Nur bei Standard Tabellen
    INSERT zahl INTO table tabelle.       " Bei Sortierten Tabellen
    zahl = 56789.
*    APPEND zahl TO tabelle.              " Nur bei Standard Tabellen
        INSERT zahl INTO table tabelle.   " Bei Sortierten Tabellen
    zahl = 67843.
*    APPEND zahl TO tabelle.              " Nur bei Standard Tabellen
        INSERT zahl INTO table tabelle.   " Bei Sortierten Tabellen
    zahl = 13458.
*    APPEND zahl TO tabelle.              " Nur bei Standard Tabellen
        INSERT zahl INTO table tabelle.   " Bei Sortierten Tabellen

*    APPEND 2 * zahl TO tabelle.                          " Variable Zahl wird mal 2 berechnet

  out->write(  tabelle ).

* Hier Einzelsatz über index
*    out->write( tabelle[ 3 ] ).

*  Hier Einzelsatz mit Read Table
*    READ TABLE tabelle WITH KEY table_line = 56789 INTO zahl.
*
*    IF sy-subrc = 0.
*      out->write( |Gefunden an Position: { sy-tabix }| ).
*    ENDIF.
*
**    CLEAR tabelle.
**
*    IF tabelle IS INITIAL.
*      out->write( 'Tabelle ist leer' ).
*    ENDIF.
**
*    out->write( '---------------------------------------------------------------------' ).
**
*    LOOP AT tabelle INTO zahl.                                " Schleife mit explizierter Deklaration
*      out->write( |Index: { sy-tabix }, Wert: { zahl }| ).
*    ENDLOOP.
**
*
*    out->write( '---------------------------------------------------------------------' ).
*
*    LOOP AT tabelle INTO DATA(zahl1).         " Schleife mit Inline Deklaration
*      out->write( |Index: { sy-tabix }, Wert: { zahl1 }| ).
*    ENDLOOP.
**
*

  ENDMETHOD.
ENDCLASS.
