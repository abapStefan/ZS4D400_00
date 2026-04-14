CLASS zcl_40_44_lokale_struktur DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_44_lokale_struktur IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF st_connection,                         " Lokale Struktur deklariert
           airport_from_id TYPE /dmo/airport_from_id,
           airport_to_id   TYPE /dmo/airport_to_id,
           carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    DATA connection TYPE st_connection.                    " Lokale struktur definiert

    SELECT SINGLE
      FROM /dmo/i_connection
    FIELDS DepartureAirport, DestinationAirport, \_Airline-Name   " Beachten, das sind Aliasnamen der CDS View
     WHERE AirlineID = 'LH'                                       " Beachten, das sind Aliasnamen der CDS View
       AND ConnectionID = 0400
      INTO  @connection.

    out->write( '-----------------------------------------' ).
    out->write( 'Beispiel eines lokalen Struturtypen' ).
    out->write( connection ).


  ENDMETHOD.
ENDCLASS.
