CLASS zcl_tableinsert_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tableinsert_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  " INSERT VALUE

  DATA lt_aeropuerto TYPE STANDARD TABLE OF /dmo/airport.

    INSERT VALUE #(  "# es un operador de
        client = 100
        airport_id = 'FRA'
        name = 'Frankfurt airport'
        city = 'Frankfurt/Main'
        country = 'DE'
        ) INTO TABLE lt_aeropuerto.

        out->write(  lt_aeropuerto ).

        INSERT VALUE #(
        client = 100
        airport_id = 'FRA'
        name = 'Frankfurt airport'
        city = 'Frankfurt/Main'
        country = 'EE'
        ) INTO TABLE lt_aeropuerto.

        INSERT VALUE #(
        client = 100
        airport_id = 'FRA'
        name = 'Frankfurt airport'
        city = 'Frankfurt/Main'
        country = 'PP'
        ) INTO lt_aeropuerto INDEX 2.




  ENDMETHOD.
ENDCLASS.
