CLASS zcl_40_33_instanzkonstructor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_33_instanzkonstructor IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA pools TYPE i.
    DATA name  TYPE string.
    DATA beds  TYPE i.
    DATA count TYPE string_table.

    DATA hotel TYPE REF TO lcl_hotel.

    DATA hotels TYPE TABLE OF REF TO lcl_hotel.   " Interne Tabelle anlegen

*    count = lcl_hotel=>get_n_o_hotels( ).
*    out->write( count ).

*    hotel = new #(  ).

*    hotel->name = 'Hopala'.   " Das funktioniert nicht mehr Attribute auf privat
*    hotel->beds = 123.
*    hotel->pools = 0.

*     APPEND hotel TO hotels.


*    hotel = NEW #( ).                             " Daran denken NEW #( ). zuerst sonst haben wir eine Null Referenz

    TRY.
        hotel = NEW #(

*             EXPORTING           "weder erforderlich noch erlaubt                              " Bei Methode mit Importing Paramtern,
           i_name  = 'Hammer Hotel Wellness'
           i_beds  = 645
           i_pools = 3 ).

      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).

    ENDTRY.

    APPEND hotel TO hotels.


    TRY.
        hotel = NEW #(

              i_name  =  'RIU Hotel ALL IN'
              i_beds  =  645
              i_pools =  3 ).

      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).

    ENDTRY.

    APPEND hotel TO hotels.



    TRY.
        hotel = NEW #(

        i_name  = 'Breidenbach 8 Sterne Resort'
        i_beds  =  645
        i_pools =  9 ).

      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).

    ENDTRY.

    APPEND hotel TO hotels.

    " Hier shift + Enter benutzen um die Schnittselle anzuzeigen und auszugeben


    TRY.
        hotel = NEW #(

           i_name  = 'Superklasse Hotel Breiudenbach SPA Resort'
           i_beds  = 354
           i_pools = 5 ).

      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).

    ENDTRY.

    APPEND hotel TO hotels.


    LOOP AT hotels INTO hotel.
      hotel->get_attributes(
        IMPORTING
          e_name  = name
          e_beds  = beds
          e_pools = pools
                 ).

      out->write(  |Hotel: { name }| && |'Anzahl der Betten:' { beds } | && | 'Anzahl der Pools' { pools } | ).

    ENDLOOP.

    count = lcl_hotel=>get_n_o_hotels( ).
    out->write( count ).

  ENDMETHOD.
ENDCLASS.
