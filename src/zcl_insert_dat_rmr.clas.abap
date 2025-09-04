CLASS zcl_insert_dat_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_dat_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  data ls_airline type  ztab_carri_rmr.
*
*  ls_airline = value #(
*                        carrier_id     = 'AA'
*                        name           = 'American Airlines'
*                        currency_code  = 'USD'
*                         ).
   "INSERT into ztab_carri_rmr values @ls_airline. " est amejor no usarla
*   INSERT ztab_carri_rmr from @ls_airline. "usar preferentemente
*
*  if sy-subrc = 0.
*        out->write(  'Registro introducido correctamente' ).
*        else.
*        out->write( 'El registro no se ha introducido' ).
*        endif.

    " insercción de múltiples registros
  "esta hecho con copilot

*DATA: lt_airlines TYPE STANDARD TABLE OF ztab_carri_rmr,
*      ls_airline  TYPE ztab_carri_rmr.

" Eliminar el registro con carrid = 'AA' si existe
*DELETE FROM ztab_carri_rmr WHERE carrier_id = 'AA'.

" Preparar nuevos registros
*lt_airlines = VALUE #(
*  ( carrier_id = 'AA' name = 'American Airlines' currency_code = 'USD'  )
*  ( carrier_id = 'LH' name = 'Lufthansa'         currency_code = 'EUR' )
*).

" Insertar registros
*INSERT ztab_carri_rmr FROM TABLE @lt_airlines.

" Mostrar resultado usando salida compatible con ABAP Cloud
" Mostrar resultado usando out->write
*IF sy-subrc = 0.
*  out->write( |Registros insertados correctamente: { sy-dbcnt }| ).
*ELSE.
*  out->write( 'Error al insertar los registros.' ).
*ENDIF.

" versión daniel

*delete from ztab_carri_rmr.
*data lt_ddbb type standard table of ztab_carri_rmr.
*
*select from /dmo/I_Carrier
*fields *
*where currencyCode = 'USD'
*into table @data(lt_airlines).
*
*if sy-subrc = 0.
*
*lt_ddbb = corresponding #(  lt_airlines Mapping carrier_id = AirlineID
*                                                currency_code = CurrencyCode ).
*
*  insert ztab_carri_rmr from table @lt_ddbb.
*
*  if sy-subrc = 0.
*  out->write(  |El número de líneas insertadas es: {  sy-dbcnt  }| ).
*  endif.
*
*endif.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   lo mismo de arriba pero más eficiente

*
*    delete from ztab_carri_rmr.
*    data lt_ddbb type standard table of ztab_carri_rmr.
*
*
*    select from /dmo/I_Carrier
*    fields AirlineID as carrier_id,
*    name,
*    CurrencyCode as currency_code
*
*    where currencyCode = 'USD'
*    into corresponding fields of table @lt_ddbb.
*
*    if sy-subrc = 0.
*
*            insert ztab_carri_rmr from table @lt_ddbb.
*            if sy-subrc = 0.
*                out->write(  |el nº de línesa isnertadas es: {  sy-dbcnt }| ).
*                endif.
*                endif.

**********************************************************************
" con excepción

*DATA: lt_ddbb TYPE STANDARD TABLE OF ztab_carri_rmr.
*
*TRY.
    " Eliminar todos los registros de la tabla
    "DELETE FROM ztab_carri_rmr.

    " Seleccionar registros desde vista CDS
*    SELECT FROM /dmo/I_Carrier
*      FIELDS AirlineID AS carrier_id,
*             name,
*             CurrencyCode AS currency_code
*      WHERE CurrencyCode = 'USD'
*      INTO CORRESPONDING FIELDS OF TABLE @lt_ddbb.
*
*    IF sy-subrc = 0.
*
*      " Insertar registros en la tabla destino
*      INSERT ztab_carri_rmr FROM TABLE @lt_ddbb.
*
*      IF sy-subrc = 0.
*        out->write( |El nº de líneas insertadas es: { sy-dbcnt }| ).
*      ELSE.
*        out->write( 'Error al insertar los registros.' ).
*      ENDIF.
*
*    ELSE.
*      out->write( 'No se encontraron registros con moneda USD.' ).
*    ENDIF.
*
*  CATCH cx_sy_open_sql_db INTO DATA(lx_sql).
*    out->write( |Error de base de datos: { lx_sql->get_text( ) }| ).
*
*ENDTRY.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"          para meter datos en la tabla flight



DATA lt_flights TYPE STANDARD TABLE OF ztab_flightb_rmr.

    SELECT FROM /DMO/I_Flight
     FIELDS *
     INTO CORRESPONDING FIELDS OF TABLE @lt_flights.

    IF sy-subrc = 0.
      INSERT ztab_flightb_rmr FROM TABLE @lt_flights.
      IF sy-subrc = 0.
        out->write( |Insercciones: { sy-dbcnt } filas | ).
      ENDIF.
    ENDIF.








  ENDMETHOD.
ENDCLASS.
