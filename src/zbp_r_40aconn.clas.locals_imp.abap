CLASS lhc_z40_r_aconn DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Verbindungen
        RESULT result,
      CheckSemanticKey FOR VALIDATE ON SAVE    " Hier die Methods Definition Check
        IMPORTING keys FOR Verbindungen~CheckSemanticKey,
      GetCities FOR DETERMINE ON SAVE
            IMPORTING keys FOR Verbindungen~GetCities.   " Hier ist der Aliasname von Connection Die Methode verknüpft.
ENDCLASS.

CLASS lhc_z40_r_aconn IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.


  METHOD CheckSemanticKey.

    READ ENTITIES OF z40_r_aconn IN LOCAL MODE         " 1 Schrritt einfach mit strg + space arveiten und ausfüllen
              ENTITY Verbindungen
              FIELDS ( uuid carrierID ConnectionID )
        WITH CORRESPONDING #( keys )
         RESULT DATA(connection).

     LOOP AT connection INTO DATA(connections).        " 2 Schritt Loop erstellen

          SELECT FROM z40aconn                         " 3 Schritt Select mit Union erstellen
               FIELDS uuid
                WHERE carrier_id = @connections-CarrierID
                AND connection_id = @connections-ConnectionID
                AND uuid <> @connections-uuid

          UNION

          SELECT FROM z40dconn
               FIELDS uuid
                WHERE carrierid = @connections-CarrierID
                AND connectionid = @connections-ConnectionID
                AND uuid <> @connections-uuid

           INTO TABLE @DATA(check_result).              " inline Deklaration


* 4 Wenn die Select-Anweisung Daten zurückgibt, erstellen Wir ein neues Nachrichtenobjekt mit der Nachricht
* Klasse ZS4D400, Nachrichtennummer 001 und Schweregrad ms-error.
* Übergeben wir die connection-CarrierID an Parameter v1 und connection-ConnectionID an Parameter v2

        IF check_result IS not INITIAL.

        DATA(message) = me->new_message(
                                 id = 'ZS4D400'
                                 number = '001'
                                 severity = ms-error
                                 v1       = connections-CarrierID
                                 v2       = connections-ConnectionID ).

* 5 Deklarieren einen Arbeitsbereich für die interne Tabelle reported-connection.
* Füllen Wir Ihn mit dem Gesamtschlüssel des
* aktuellen Datensatzes, fügen dann den Verweis auf das Nachrichtenobjekt hinzu
* und stellen sicher, dass die Nachricht mit den Elementen CarierID und ConnectionID verknüpft ist
* Fügen schliesslich eine neue Zeile in die Verbindung der Meldestruktur ein

         DATA reported_record LIKE LINE of reported-verbindungen.
         reported_record-%tky = connections-%tky.
         reported_record-%msg = message.
         reported_record-%element-carrierid = if_abap_behv=>mk-on.
         reported_record-%element-connectionid = if_abap_behv=>mk-on.

         APPEND reported_record TO reported-verbindungen.

* 6 Deklarieren einen Arbeitsbereich für die Interne Tabelle failed -connection.
* Füllen ihn mit dem Gesamtschlüssel des akzuellen Datensatzes und
* fügen eine neue Zeile in die Verbindungskomponente der failed ein
* Schliessen dann Schliesslich die offenen IF- LOOP - Kontrollstrukuren

        DATA failed_record LIKE LINE OF failed-verbindungen.
        failed_record-%tky = connections-%tky.

        APPEND failed_record TO failed-verbindungen.

     ENDIF.
    ENDLOOP.



  ENDMETHOD.

  METHOD GetCities.    " Neu Hier die Mthodenimplementation

* 1 Lesen die Benutzereingaben mit einer EML Read ENTITIES Anweisung,
* Lesen der Felder AirportFromID und AirportToID. Verwenden eine InlineDeklaration für die Ergebnismenge

      READ ENTITIES OF z40_r_aconn IN LOCAL MODE         " 1 Schrritt einfach mit strg + space arveiten und ausfüllen
              ENTITY Verbindungen
              FIELDS ( AirportFromID AirportToID )
        WITH CORRESPONDING #( keys )
         RESULT DATA(connections).

* 2 Verwenden in einer Schleife über die Daten zwei Select Anweisungen um diue Stadt und Länderdaten für die beiden
* vom Benutrzer eingegebenen Flüghäfen. Wir verwenden die CDS-View /DMO/I_Airport als Datenquelle
* und lesen dann die Felder City und CountryCode. Für AirportFromId, füllen die Felder Cityfrom und Countryfrom.
* Für AirportToID, füllen wir die Felder CityTo und CountryTo
* Bitte daran Denken, dass wir die Modify Anweisung benötigen, um Änderungen an den Internen Tabellen zu schreiben

  LOOP AT connections INTO data(connection).

               SELECT SINGLE
                       FROM /dmo/i_airport
                       FIELDS city, countryCode
                       WHERE Airportid = @connection-AirportFromID
                     INTO (  @connection-CityFrom, @connection-CountryFrom ).

               SELECT SINGLE
                       FROM /dmo/i_airport
                       FIELDS city, countryCode
                       WHERE Airportid = @connection-AirportTOID
                     INTO (  @connection-CityTO, @connection-CountryTO ).

              MODIFY connections FROM connection.
     ENDLOOP.

* 3 Deklarieren wir eine Interne Tabelle connection_upd mit dem Typ TABLE FOR UPDATE
* z40_r_aconn. Kopieren wir die Daten aus der Internen Tabelle connections in die neue Tabelle connections_upd

          DATA connections_upd TYPE TABLE FOR UPDATE z40_r_aconn.
          connections_upd = CORRESPONDING #( connections ).

* 4 Verwenden Wir eine EML Moify Entities Anweisung, um die Daten im Transaktionspuffer zu aktualisieren
* Beschränken die Aktualisierung auf die Felder, die wir geändert haben (CityFrom CityTo CountryFrom
* Verwenden wir den Zusatz Reported, um alle Nachrichten der Anweisung zu empfangen
* Übertraen alle Maldungen in die Berichtsstruktur unsere Methode

  MODIFY ENTITIES OF z40_r_aconn IN LOCAL MODE
      ENTITY Verbindungen
      UPDATE
      FIELDS ( Cityfrom CountryFrom CityTo CountryTo )
      with connections_upd

      REPORTED DATA(reported_records).
      reported-verbindungen = CORRESPONDING #( reported_records-verbindungen ).

  ENDMETHOD.

ENDCLASS.
