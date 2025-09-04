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


       data(ls_airline) = value ztab_carri_rmr(
                                         carrier_id     = 'WZ'
                                         name           = 'Wiz Air'
                                         currency_code  = 'USD'
                                         ).

       modify ztab_carri_rmr from @ls_airline.
       if sy-subrc = 0.
            out->write( 'el registro ha sido introducido/ modificado ' ).
            else.
            out->write( 'el registro no ha sido modificado' ).
       endif.








  ENDMETHOD.
ENDCLASS.
