CLASS lhc_z40_r_flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR flight~validatePrice,
      validateCurrencyCode FOR VALIDATE ON SAVE
            IMPORTING keys FOR FLIGHT~validateCurrencyCode.
ENDCLASS.

CLASS lhc_z40_r_flight IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validatePrice.

    DATA failed_record LIKE LINE OF failed-flight.
    DATA reported_record LIKE LINE OF reported-flight.

    READ ENTITIES OF z40_r_flight IN LOCAL MODE
          ENTITY flight
          FIELDS ( Price )
          WITH CORRESPONDING #( keys )
          RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).

      IF flight-Price <= 0.

        failed_record-%tky = flight-%tky.

        APPEND failed_record TO failed-flight.

        reported_record-%tky = flight-%tky.

        reported_record-%msg =
             new_message(
                  id =  '/LRN/S4D400'
                 number = '101'
                 severity = if_abap_behv_message=>severity-error ).

        APPEND reported_record TO reported-flight.

      ENDIF.
    ENDLOOP.


  ENDMETHOD.

  METHOD validateCurrencyCode.

        DATA failed_record LIKE LINE OF failed-flight.
        DATA reported_record LIKE LINE OF reported-flight.

        DATA exists TYPE abap_bool.     " Kommt ja erst später in der Aufgabe

        exists = abap_false.

        READ ENTITIES OF z40_r_flight IN LOCAL MODE
          ENTITY flight
          FIELDS ( currencycode )
          WITH CORRESPONDING #( keys )
          RESULT DATA(flights).

        LOOP AT flights INTO DATA(flight).
          SELECT SINGLE FROM i_currency
           FIELDS @abap_true
           WHERE currency = @flight-CurrencyCode
           INTO @exists.

         IF exists = abap_false.   " Der CurrencyCode ist nicht gültig

         failed_record-%tky = flight-%tky.

        APPEND failed_record TO failed-flight.

        reported_record-%tky = flight-%tky.
        reported_record-%msg =
             new_message(
                  id =  '/LRN/S4D400'
                 number = '102'
                 severity = if_abap_behv_message=>severity-error
                 v1 = flight-CurrencyCode ).

        APPEND reported_record TO reported-flight.

       ENDIF.
     ENDLOOP.

  ENDMETHOD.

ENDCLASS.
