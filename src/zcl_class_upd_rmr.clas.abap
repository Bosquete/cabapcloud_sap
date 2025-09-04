CLASS zcl_class_upd_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_class_upd_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  "  actualización de un único campo
*  data ls_airline type ztab_carri_rmr.
*
*  select single from ztab_carri_rmr
*                fields *
*                where carrier_id = 'AA'
*                into @ls_airline.
*
*   if sy-subrc = 0.
*
*        out->write( |Current Currency: { ls_airline-currency_code }| ).
*
*   endif.
*
*   ls_airline-currency_code = 'EUR'.
*
*   update ztab_carri_rmr from @ls_airline.
*
*   if sy-subrc = 0.
*
*        out->write( |Updated record with new "currency": { ls_airline-currency_code }| ).
*
*   endif.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""    sin select
*
*        data ls_airline type ztab_carri_rmr.
*        ls_airline = value #(
*                              carrier_id = 'AA'
*                              name       = 'Americam Airline Inc.'
*                              currency_code = 'USD' ).
*
*update ztab_carri_rmr from @ls_airline.
*
*   if sy-subrc = 0.
*
*        out->write( |Updated record with new "currency": { ls_airline-currency_code }| ).
*
*   endif.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   update múltiples registros

*
*             constants lc_currency type c length 3 value 'usd'.
*
*             select from ztab_carri_rmr
*                    fields *
*                    into table @data(lt_airlines).
*
*             if sy-subrc = 0.
*
*                 loop at lt_airlines assigning field-symbol(<ls_airlines>).
*
*                        clear <ls_airlines>-name.
*                        <ls_airlines>-currency_code = lc_currency.
*
*                   endloop.
*
*               update ztab_carri_rmr from table @lt_airlines.
*
*                   if sy-subrc = 0.
*
*        out->write( |Updated record with new "currency": { lc_currency }| ).
*
*   endif.
*
*   endif.

**********************************************************************
"   actualización columnas

*        constants lc_currency type c length 3 value 'EUR'.
*
*         update ztab_carri_rmr
*                set currency_code = @lc_currency
*                where carrier_id = 'AA'
*                or carrier_id = 'DL'.
*
*                            if sy-subrc = 0.
*
*        out->write( |Updated record | ).
*        else.
*        out->write( |no Updated record | ).
*
*   endif.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       COLUMNAS CON EXPRESIONES

data lt_flights type standard table of ztab_flightb_rmr.

        update ztab_flightb_rmr
                set maximumseats = maximumseats + 10,
                occupiedseats = occupiedseats + 5
                where airlineid = 'LH'.

        if sy-subrc = 0.
                out->write(  |actualización de columnas: { sy-dbcnt }| ).
                else.
                out->write( |actualización no ejecutada| ).
         endif.

  ENDMETHOD.
ENDCLASS.
