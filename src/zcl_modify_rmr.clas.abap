CLASS zcl_modify_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_modify_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



  "     MODIFICACIÓN DE UN ÚNICO REGISTRO CON EL MODIFY

*
*       data(ls_airline) = value ztab_carri_rmr(
*                                         carrier_id     = 'WZ'
*                                         name           = 'Wiz Air'
*                                         currency_code  = 'USD'
*                                         ).
*
*       modify ztab_carri_rmr from @ls_airline.
*       if sy-subrc = 0.
*            out->write( 'el registro ha sido introducido/ modificado ' ).
*            else.
*            out->write( 'el registro no ha sido modificado' ).
*       endif.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"          MODIFICAR ACTUALIZAR MÚLTIPLES REGISTROS

       CONSTANTS lc_currency type c length 3 value 'EUR'.

       select from ztab_carri_rmr
            fields *
            where carrier_id = 'LH'
            or carrier_id = 'AF'
            into table @data(lt_airlines).

         if sy-subrc = 0.


         loop at lt_airlines assigning field-symbol(<fs_airline>).
                <fs_airline>-currency_code = lc_currency.
         endloop.

         Append value #(
                        carrier_id = 'AV'
                        name = 'AVIANCA'
                        currency_code = 'COP' ) to lt_airlines.

         modify ztab_carri_rmr from table @lt_airlines.

        if sy-subrc = 0.

        out->write( 'los registros se han modificado/creado ' ).
        else.
        out->write(  'los registros no se han modificado/creado' ).
        endif.


        else.
            select from /dmo/I_carrier
            fields AirlineID as carrier_id,
            name,
            CurrencyCode as currency_code
            where airlineID = 'AF' or AirlineID = 'HD'
            into corresponding fields of table @lt_airlines.

            if sy-subrc = 0.

            modify ztab_carri_rmr from table @lt_airlines.

            if sy-subrc = 0.
            out->write( 'los registros se han modificado 2' ).
            else.
            out->write( 'los registros no se han modificado 2' ).
            endif.
            endif.
            endif.


  ENDMETHOD.
ENDCLASS.
