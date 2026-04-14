CLASS zcl_40_54_inline_deklar_into DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_54_inline_deklar_into IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

     Types: BEGIN OF st_connection,                         " Lokale Struktur deklariert
           airport_from_id TYPE /dmo/airport_from_id,
           airport_to_id   TYPE /dmo/airport_to_id,
           carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

     DATA connection TYPE /dmo/i_connection.

     SELECT SINGLE
     FROM /dmo/i_connection
     FIELDS DepartureAirport,
          DestinationAirport AS ArrivalAirport,
              \_Airline-Name AS AirlineName
     WHERE AirlineID = 'LH'
     INTO @DATA(connection_short).


     out->write( connection_short ).


  ENDMETHOD.
ENDCLASS.
