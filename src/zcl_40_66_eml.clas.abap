CLASS zcl_40_66_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_66_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA update_tab TYPE TABLE FOR UPDATE /dmo/i_agencyTP.

  DATA input_keys TYPE TABLE FOR READ IMPORT /dmo/i_agencyTP.  " Tabelle für den Lese import

  DATA result_tab TYPE TABLE FOR READ RESULT /dmo/i_agencytp.  " Tabelle für das Read Ergebnis

  input_keys = VALUE #( ( agencyid = '070045'  ) ).             " Bis hier in Input Keys nur die agencyID

      READ ENTITIES OF /dmo/i_agencyTP   " Name der Verhaltendefinition
                ENTITY /dmo/Agency       " Aliasname der in der definierten Entität
            ALL FIELDS                   " oder (agency name street postalcode city) Feldauswahl
                  with input_keys        " Tabelle mit den Abfrage Parametern
                Result result_tab.       " ab hier das Ergebnis in der result_tab

      MODIFY ENTITIES OF /dmo/i_agencyTP
                ENTITY /dmo/Agency
                UPDATE
                FIELDS ( name )          "  zu ändernde Feld(er)
                  with update_tab.       " Tabelle mit den zu verbuchenden Daten
*      Commit ENTITIES.                 " Daten zu persistieren  ***** WICHTIG - COMMIT - Hier NICHT erlaubt ohne commit keine Änderung

   out->write( result_tab  ).
   ENDMETHOD.
ENDCLASS.
