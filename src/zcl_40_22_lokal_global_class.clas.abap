CLASS zcl_40_22_lokal_global_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_22_lokal_global_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA hotel TYPE REF TO lcl_hotel.
  DATA hotel2 TYPE REF TO lcl_hotel.
  DATA hotel3 TYPE REF TO lcl_hotel.


  lcl_hotel=>counter = 1.

   hotel = NEW #( ).
   hotel->name = 'Breidenbach SPA Resort'.
   hotel->beds = 355.
   hotel->pools = 7.

*   hotel2 = hotel.     " Hier wird die Adresse koppiert 1 nach 2

   hotel2 = NEW #(  ).
   hotel2->name = 'Breidenbach 8 Sterne Resort'.  " mehrere Instanzen der gleichen Klasse
   hotel2->beds = 645.
   hotel2->pools = 9.

   hotel3 = NEW #(  ).                   "   Im Debuigger sind die Atribute dennoch zu sehen

   lcl_hotel=>counter = 1313.

   out->write( hotel ).

  ENDMETHOD.
ENDCLASS.
