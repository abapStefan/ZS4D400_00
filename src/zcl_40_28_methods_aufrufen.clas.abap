CLASS zcl_40_28_methods_aufrufen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_28_methods_aufrufen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      DATA pools TYPE i.
      DATA name  TYPE string.
      DATA beds  TYPE i.

    DATA hotel TYPE REF TO lcl_hotel.

    DATA hotels TYPE TABLE OF REF TO lcl_hotel.   " Interne Tabelle anlegen


    hotel = NEW #( ).                             " Daran denken NEW #( ). zuerst sonst haben wir eine Null Referenz

    hotel->set_attributes(
         EXPORTING                                " Bei Methode mit Importing Paramtern,
      i_name = 'Hammer Wellnes Hotel'
      i_beds  = 645
      i_pools = 3
    ).

    APPEND hotel TO hotels.

     hotel = NEW #( ).

    hotel->set_attributes(                        " Wenn nur Importing Parameter kann Exporting weggelassen werden
      i_name  =  'RIU Hotel ALL IN'
      i_beds  =  1345
      i_pools =  6
    ).

    APPEND hotel TO hotels.


    hotel = new #(  ).
    hotel->set_attributes(
      i_name  = 'Breidenbach 8 Sterne Resort'
      i_beds  =  645
      i_pools =  9
    ).


    APPEND hotel TO hotels.

    " Hier shift + Enter benutzen um die Schnittselle anzuzeigen und auszugeben

    hotel = NEW #(  ).
    hotel->set_attributes(
       EXPORTING
      i_name  = 'Superklasse Hotel Breiudenbach SPA Resort'
      i_beds  = 354
      i_pools = 5
    ).

    APPEND hotel TO hotels.

    LOOP AT hotels into hotel.
       hotel->get_attributes(
         IMPORTING
           e_name  = name
           e_beds  = beds
           e_pools = pools
                  ).

      out->write(  |Hotel: { name }| && |'Anzahl der Betten:' { beds } | && | 'Anzahl der Pools' { pools } | ).

   ENDLOOP.



  ENDMETHOD.
ENDCLASS.
