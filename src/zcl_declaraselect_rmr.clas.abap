CLASS zcl_declaraselect_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_declaraselect_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

     DATA: airport_from_id TYPE /dmo/airport_from_id,
            airport_to_id TYPE /dmo/airport_to_id,
            airports TYPE TABLE OF /dmo/airport_from_id.


*---------------EXAMPLE 1: SINGLE FIELD FROM SINGLE RECORD--------------------
******************************************************************************

        SELECT SINGLE
            FROM /dmo/connection
            FIELDS airport_from_id
            WHERE carrier_id = 'LH'
            AND connection_id = '0400'
            INTO @airport_from_id.

        out->write( `--------------` ).
        out->write( `Example 1:` ).
        out->write( |\n| ).
        out->write( |Flight LH 400 departs from { airport_from_id }.| ).

*---------------EXAMPLE 2: SINGLE FIELD FROM SINGLE RECORD--------------------
******************************************************************************

        out->write( |\n| ).

        SELECT SINGLE
            FROM /dmo/connection
            FIELDS airport_from_id, airport_to_id
            WHERE carrier_id = 'LH'
            AND connection_id = '0400'
            INTO ( @airport_from_id, @airport_to_id ).

        out->write( `--------------` ).
        out->write( `Example 2:` ).
        out->write( |\n| ).
        out->write( |Flight LH 400 departs from { airport_from_id } to { airport_to_id }.| ).

*---------------EXAMPLE 2: SINGLE FIELD FROM SINGLE RECORD--------------------
******************************************************************************

        out->write( |\n| ).

        SELECT SINGLE
            FROM /dmo/connection
            FIELDS airport_from_id
            WHERE carrier_id = 'XX'
            AND connection_id = '1234'
            INTO @airport_from_id.

        IF sy-subrc = 0.

            out->write( `--------------` ).
            out->write( `Example 3:` ).
            out->write( |Flight XX 1234 departs from {  airport_from_id }.| ).

        ELSE.

            out->write( `--------------` ).
            out->write( `Example 3:` ).
            out->write( |There is no flight XX 1234, but still airport_from_id =  {  airport_from_id }!| ).

        ENDIF.



  ENDMETHOD.
ENDCLASS.
