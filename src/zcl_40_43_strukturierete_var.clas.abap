CLASS zcl_40_43_strukturierete_var DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_43_strukturierete_var IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection_full TYPE /dmo/i_connection.   " Struktur auf Basis der CDS View

    DATA message type symsg.   " Globale Struktur

    SELECT SINGLE
      FROM /dmo/i_connection
    FIELDS AirlineID, ConnectionID, DepartureAirport, DestinationAirport,
           DepartureTime, ArrivalTime, Distance, DistanceUnit
       WHERE AirlineID = 'LH'
       AND ConnectionID = '0400'
      INTO @connection_full.


    out->write( connection_full ).

  ENDMETHOD.
ENDCLASS.
