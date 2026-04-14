CLASS zcl_40_46_lok_glob_struk_nest DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_46_lok_glob_struk_nest IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Beispiel1 für Strukturierte Variable
***********************************************************************************************

    DATA connection_full TYPE /dmo/i_connection.

    SELECT SINGLE
      FROM /dmo/i_connection
    FIELDS AirlineID, ConnectionID, DepartureAirport, DestinationAirport,
           DepartureTime, ArrivalTime, Distance, DistanceUnit
     WHERE AirlineID = 'LH'                                       " Beachten, das sind Aliasnamen der CDS View
       AND ConnectionID = 0400
      INTO  @connection_full.

    out->write( '-----------------------------------------' ).
    out->write( 'Beispiel einer CDS View Struturtypen' ).
    out->write( connection_full ).


* Beispiel 2 Globale Structur
************************************************************************************************

     DATA message TYPE symsg.

     out->write( '-----------------------------------------' ).
     out->write( 'Beispiel einer Globalen Struktur' ).
     out->write( message ).

* Beispiel 3 Lokale Struktur
*************************************************************************************************

    Types: BEGIN OF st_connection,                         " Lokale Struktur deklariert
           airport_from_id TYPE /dmo/airport_from_id,
           airport_to_id   TYPE /dmo/airport_to_id,
           carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

     DATA connection TYPE st_connection.

   SELECT SINGLE
      FROM /dmo/i_connection
    FIELDS DepartureAirport, DestinationAirport, \_airline-name
     WHERE AirlineID = 'LH'                                       " Beachten, das sind Aliasnamen der CDS View
       AND ConnectionID = 0400
      INTO  @connection.

      out->write( '-----------------------------------------' ).
      out->write( 'Beispiel einer lokalen Struktur' ).
      out->write( connection ).

* Beispiel 4 Geschachtelte Struktur
******************************************************************************************************

      TYPES: BEGIN OF st_nested,                         " Lokale Struktur deklariert
           airport_from_id TYPE /dmo/airport_from_id,
           airport_to_id   TYPE /dmo/airport_to_id,
           message         TYPE symsg,
           carrier_name    TYPE /dmo/carrier_name,
           END OF st_nested.

      DATA connection_nested TYPE st_nested.

      out->write( '-----------------------------------------' ).
      out->write( 'Beispiel einer geschachtelten Struktur' ).
      out->write( connection_nested ).

  ENDMETHOD.
ENDCLASS.
