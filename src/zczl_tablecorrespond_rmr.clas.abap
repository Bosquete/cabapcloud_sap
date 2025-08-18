CLASS zczl_tablecorrespond_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCZL_TABLECORRESPOND_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " MOVE-CORRESPONDING  Alinear datos entre tablas basándose en campos coincidentes.
    "Trae los datos que cinciden e ignora los qu eno coinciden. Igual nombre y tipo
*
*
*  TYPES: BEGIN OF ty_flights,
*            carrier_id TYPE /dmo/carrier_id,
*            connection_id TYPE /dmo/connection_id,
*            flight_date TYPE /dmo/flight_date,
*            animales TYPE string,
*            currency_code TYPE /dmo/currency_code,
*         END OF ty_flights.
*
*  DATA: lt_my_flights TYPE STANDARD TABLE OF ty_flights, "estructura se puede eliminar la segunda línea.
*        ls_my_flight TYPE ty_flights.
*
*  SELECT FROM /dmo/flight
*  FIELDS *
*  WHERE  currency_code = 'EUR'
*  INTO TABLE @DATA(lt_flights).   "DATA con @ coge lso valores filtrados, no hace falta crear tabla cuando haces un select
*
*  MOVE-CORRESPONDING lt_flights TO lt_my_flights.
*
*  out->write( DATA = lt_flights NAME = `lt_flights` ).
*  out->write( |\n| ).
*  out->write( DATA = lt_my_flights NAME = `lt_my_flights` ).

**********************************************************************
*
*    TYPES: BEGIN OF ty_flights,
*             carrier_id    TYPE /dmo/carrier_id,
*             connection_id TYPE /dmo/connection_id,
*             flight_date   TYPE /dmo/flight_date,
*             animales      TYPE string,
*             currency_code TYPE /dmo/currency_code,
*           END OF ty_flights.
*
*    DATA: lt_my_flights TYPE STANDARD TABLE OF ty_flights, "estructura se puede eliminar la segunda línea.
*          ls_my_flight  TYPE ty_flights.
*
*    SELECT FROM /dmo/flight
*    FIELDS *
*    WHERE  currency_code = 'EUR'
*    INTO TABLE @DATA(lt_flights).
*
*    lt_my_flights = CORRESPONDING #(  lt_flights ).
*
*    MOVE-CORRESPONDING lt_flights TO lt_my_flights. "KEEPING TARGET LINES.  "evitamos que se sobreescriban reggistros que ya hay,
*                                                        "se puede utilizar para tarer de dos tablas datos...
*
*    out->write( data = lt_flights name = `lt_flights` ).
*    out->write( |\n| ).
*    out->write( data = lt_my_flights name = `lt_my_flights` ).

**********************************************************************"
    "                   CHEQUEO DE REGISTROS

*
*         DATA lt_flights TYPE STANDARD TABLE OF /dmo/flight.  " verifica qu eun registro existe en una tabla
*
*         SELECT from /dmo/flight
*           FIELDS *
*           WHERE  carrier_id = 'LH'
*           INTO TABLE @lt_flights.
*
*           out->write( lt_flights ).
*
*         if sy-subrc = 0.
*
*         READ TABLE lt_flights WITH KEY connection_id = '0403' TRANSPORTING NO FIELDS.
*
*            """READ TABLE lt_flights INTO DATA(ls_flights) INDEX 2.
*
*            IF sy-subrc = 0.
*
*                out->write(  'el vuelo existe en la base de datos' ).
*            ELSE.
*                out->write(  'el vuelo NO existe en la base de datos' ).
*            ENDIF.
*
*
*          ENDIF.

**********************************************************************
*
*    DATA lt_flights TYPE STANDARD TABLE OF /dmo/flight.  " verifica qu eun registro existe en una tabla
*
*    SELECT FROM /dmo/flight
*      FIELDS *
*      WHERE  carrier_id = 'LH'
*      INTO TABLE @lt_flights.
*
*    out->write( lt_flights ).
*
*    IF sy-subrc = 0.
*
*      IF line_exists( lt_flights[ connection_id = '0404' ] ).
*
*        out->write(  'el vuelo existe en la base de datos' ).
*      ELSE.
*        out->write(  'el vuelo NO existe en la base de datos' ).
*      ENDIF.
*
*
*    ENDIF.

**********************************************************************
    """"""""""""""""""""  INDICE DE UN REGISTRO

    "line index devuelve el número de línea en donde se encuentra un registro.

*            SELECT from /dmo/flight
*           FIELDS *
*           WHERE  carrier_id = 'LH'
*           INTO TABLE @lt_flights.
*
*
*           "DATA lt_flights TYPE STANDARD TABLE OF /dmo/flight.
*          READ TABLE lt_flights WITH KEY connection_id = '0403' TRANSPORTING NO FIELDS. " transporting no fields, sentencia que combinada
*                                                                                        "con registro de raAd table busca si existe '0403'
*
*            data(lv_index) = sy-tabix.
*            out->write(  data = lt_flights  name = `lt_flights` ).
*            out->write( lv_index ).


**********************************************************************
    """"""""""""""""""""""""""""""""FORMA MODERNA""""""""""""""""""""""""""""""""""""""
*    SELECT FROM /dmo/flight
*       FIELDS *
*       WHERE  carrier_id = 'LH'
*       INTO TABLE @lt_flights.
*    DATA(lv_index) = line_index( lt_flights[ connection_id = '0401' ] ).
*    out->write(  data = lt_flights  name = `lt_flights` ).
*    out->write( lv_index ).
*        "lines, número total de líneas
*    data(lv_num) = lines( lt_flights ).
*    out->write( data = lv_num name = 'lv_num' ).

**********************************************************************
        "LOOP AT
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
     "Loop at

* TYPES: BEGIN OF ty_persona,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona.
*
*    TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH EMPTY KEY.
*
*
*    DATA(lt_persona) = VALUE ty_tabla_personas(
*    ( nombre = 'Ana' edad = 25 )
*    ( nombre = 'Javier' edad = 45 )
*    ( nombre = 'Lucia' edad = 22 )
*
*
*
*    ).
*
*    out->write( lt_persona ).
*
*    DATA ls_persona TYPE ty_persona.
*
*    LOOP AT lt_persona INTO ls_persona where nombre = 'Ana' .
*
*      out->write( |Nombre: { ls_persona-nombre }, Edad: { ls_persona-edad }| ).

    " ENDLOOP.
    "loop con assigning field-symbol


*    SELECT FROM /dmo/flight
*      FIELDS *
*      WHERE carrier_id = 'LH'
*      INTO TABLE @DATA(lt_flights).
*
*    DATA ls_flight TYPE /dmo/flight.
*
*"loop "normal"
*
*    LOOP AT lt_flights INTO ls_flight.
*
*      out->write( data = ls_flight name = `ls_flight` ).
*    ENDLOOP.
*
*
*    """"""""""""""""""""""""""""""
*
*"loop con where y field-symbol
*    LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs_flight>) WHERE connection_id = '0403'.
*
*      "out->write( data = <fs_flight> name = `<fs_flight>` ).
*    ENDLOOP.
*    out->write( |\n| ).
*    out->write( |\n| ).
*
*
*"loop con where y estructura creada en linea para almacenar valores
*    LOOP AT lt_flights INTO DATA(ls_flight2) WHERE connection_id = '0403'.
*
*      out->write( data = ls_flight2 name = `fs_flight2` ).
*
*    ENDLOOP.

* SELECT FROM /dmo/flight
*      FIELDS *
*      WHERE carrier_id = 'LH'
*      INTO TABLE @DATA(lt_flights).
*
*    DATA ls_flight TYPE /dmo/flight.
*
*    LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs_flight>) from 3 to 8.
*
*     <fs_flight>-currency_code = 'COP'.
*    ENDLOOP.
*    out->write( data = lt_flights name = `lt_flights` ).

**********************************************************************

           data lv_var type i value 0.

    SELECT FROM /dmo/flight
      FIELDS *
      WHERE carrier_id = 'LH'
      INTO TABLE @DATA(lt_flights).

    DATA ls_flight TYPE /dmo/flight.

    LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs_flight>) from 3 to 8.


      <fs_flight>-currency_code = 'COP'.


    ENDLOOP.
    out->write( data = lt_flights name = `lt_flights` ).

  ENDMETHOD.
ENDCLASS.
