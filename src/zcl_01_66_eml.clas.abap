CLASS zcl_01_66_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_66_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*
*    DATA update_tab TYPE TABLE FOR UPDATE /dmo/i_agencyTP.
*    DATA input_keys TYPE TABLE FOR READ IMPORT /dmo/i_agencyTP.  "Tabelle für den Lese import
*    DATA result_tab TYPE TABLE FOR READ RESULT /dmo/i_agencytp.  "Tabelle für das Read Ergebnis
*
*    input_keys = VALUE #( ( agencyid = '070050' ) ).              " Bis hier in Input Keys nur die agencyID
*
*    READ ENTITIES OF /dmo/i_agencyTP
*       ENTITY /dmo/Agency
*      ALL FIELDS
*         WITH input_keys
*         RESULT result_tab.
*
*
*    MODIFY ENTITIES OF /dmo/i_agencyTP
*                ENTITY /dmo/Agency
*                UPDATE
*                FIELDS ( name )
*                   WITH update_tab.
*
**    COMMIT ENTITIES.
*
**   out->write( result_tab ).

    DATA agencies_upd TYPE TABLE FOR UPDATE /dmo/i_agencytp.

    agencies_upd = VALUE #( ( agencyID = '070001'  name = 'fancyname' ) ).

    MODIFY ENTITIES OF /dmo/i_agencytp
     ENTITY /dmo/Agency
     UPDATE FIELDS ( name )
     WITH agencies_upd.

    COMMIT ENTITIES.


    out->write( `Method execution finished!` ).











  ENDMETHOD.
ENDCLASS.
