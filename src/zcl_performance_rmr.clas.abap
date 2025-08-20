CLASS zcl_performance_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_performance_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



*"---------------------------------------------------------------------------------
*" Definición de un tipo de tabla interna con filas de /dmo/flight
*" Clave primaria NO única por (carrier_id, connection_id, flight_date)
*" → permitirá duplicados en esa combinación pero servirá para ordenar por defecto
*"---------------------------------------------------------------------------------
*TYPES lty_flights TYPE STANDARD TABLE OF /dmo/flight
*                  WITH NON-UNIQUE KEY carrier_id connection_id flight_date.
**
**"---------------------------------------------------------------------------------
**" Declaración de la tabla interna que usaremos en los ejemplos de ordenación
**"---------------------------------------------------------------------------------
*DATA lt_flights TYPE lty_flights.                          " Itab de vuelos con la clave anterior
**
**"---------------------------------------------------------------------------------
**" Carga manual de datos de ejemplo usando constructor VALUE #( ... ).
**" Nota: muchos campos de /dmo/flight son DATS, NUMC o DEC → las comillas serán
**"       convertidas implícitamente (si prefieres, puedes usar CONV <tipo>( ... )).
**"       flight_date es DATS (YYYYMMDD), price suele ser DEC / CURR.
**"---------------------------------------------------------------------------------
*lt_flights = VALUE #(
*  ( client         = sy-mandt                                " Mandante actual del sistema
*    carrier_id     = 'CO'                                    " Compañía aérea
*    connection_id  = '0500'                                  " Conexión (NUMC/char con ceros a la izquierda)
*    flight_date    = '20250201'                              " Fecha de vuelo (YYYYMMDD)
*    plane_type_id  = '123-456'                               " Tipo de avión (texto)
*    price          = '1000'                                  " Precio (se convertirá a DEC/CURR si aplica)
*    currency_code  = 'COP' )                                 " Moneda
*
*  ( client         = sy-mandt
*    carrier_id     = 'MX'
*    connection_id  = '0600'
*    flight_date    = '20250120'
*    plane_type_id  = '747-400'
*    price          = '800'
*    currency_code  = 'MXN' )
*
*  ( client         = sy-mandt
*    carrier_id     = 'QF'
*    connection_id  = '0006'
*    flight_date    = '20230112'
*    plane_type_id  = 'A380'
*    price          = '1600'
*    currency_code  = 'AUD' )
*
*  ( client         = sy-mandt
*    carrier_id     = 'SP'
*    connection_id  = '0700'
*    flight_date    = '20250610'
*    plane_type_id  = '321-654'
*    price          = '100'
*    currency_code  = 'EUR' )
*
*  ( client         = sy-mandt
*    carrier_id     = 'LX'
*    connection_id  = '0900'
*    flight_date    = '20250101'
*    plane_type_id  = '258-963'
*    price          = '50'
*    currency_code  = 'COP' )
*).
*
*"---------------------------------------------------------------------------------
*" Mostrar la tabla ANTES de ordenar
*"---------------------------------------------------------------------------------
*out->write( |Before Sort| ).                                " Título/etiqueta
*out->write( lt_flights ).                                   " Contenido actual de la itab
*
*"=================================================================================
*" SORT con la clave primaria de la itab
*"=================================================================================
*SORT lt_flights.                                            " Ordena por la clave definida en lty_flights:
*                                                            " (carrier_id, connection_id, flight_date) ASC por defecto
*out->write( |Sort by primary key| ).                        " Título/etiqueta
*out->write( lt_flights ).                                   " Tabla ya ordenada por la clave
*
**"=================================================================================
**" SORT por cualquier campo (varios campos) – orden ascendente por defecto
**"=================================================================================
**SORT lt_flights BY currency_code plane_type_id.             " Ordena 1º por moneda, 2º por tipo de avión (ASC/ASC)
**out->write( |Sort by 2 fields| ).                           " Título/etiqueta
**out->write( lt_flights ).                                   " Resultado del orden múltiple
**
**"=================================================================================
**" SORT combinando ASCENDING y DESCENDING por distintos campos
**"=================================================================================
**SORT lt_flights BY carrier_id ASCENDING                     " 1º por compañía (A→Z)
**                   flight_date DESCENDING.                  " 2º por fecha (más reciente primero)
**out->write( |Sort by 2 fields (ASC/DESC)| ).                " Título/etiqueta
**out->write( lt_flights ).
*
*    "objetos de datos anonimos
*
*    DATA(lr_dato01) = NEW i( 123 ).  " creamos un objeto de datos anonimo de tipo i
*    " inizializamos a 123 y guarda un "ref to" i en lr_dato01
*
*
*    DATA(lr_dato02) = NEW ztab_bd_der( id = 10005 first_name = 'Sofia' ). "creamos una estructura anonima de tipo ztab_bd_der
*    " con los valores  ( id = 10005 first_name = 'Sofia' )  y guarda una "ref to" a ztab_bd_der
*
*
*
*    out->write( lr_dato01 ).
*    out->write( lr_dato02 ).
*
*    SELECT *
*    FROM ztab_bd_der
*    INTO TABLE NEW @DATA(lr_dato03).  "Crea una "tabla interna anonima" con el resultado y devuelve una "ref to" en lr_data03.
*
*    out->write( lr_dato03 ).
*
*
*    SELECT
*    SINGLE *
*    FROM  ztab_bd_der
*    INTO NEW @DATA(lr_dato04).     " crea una "estructura anonima" con esa fila y devuelve un "ref to" en lr_dato04
*
*
*    out->write( lr_dato04 ).
*
*ASSIGN ls_data-field1  TO <lfs_generic>.
*            out->write( <lfs_generic> ).
*
*    "Sentencia dinamica con assign
*
*
*    TYPES: BEGIN OF lty_data,
*             field1 TYPE i,
*             field2 TYPE string,
*             field3 TYPE string,
*           END OF lty_data.
*
*
*    DATA: ls_data TYPE lty_data,
*          lt_data TYPE TABLE OF lty_data WITH EMPTY KEY.
*
*
*    ls_data = VALUE #(
*    field1  = 1
*    field2 = 'aaa'
*    field3  = 'z'
*
*    ).
*
*    APPEND ls_data TO lt_data.
*
*
*
*    DATA(lr_data) = NEW lty_data(           "crea "referencia de datos " a una estructura anonima
*                                            " iniciada con los valores 2, b, y
*   field1  = 2
*   field2 = 'b'
*   field3  = 'y'
*
*   ).
*
*
*    FIELD-SYMBOLS <lfs_generic> TYPE data.     "field symol generico (tipo dinamico)
*
*
*
*    ASSIGN ls_data-('field1') TO <lfs_generic>.   "asigna por "nombre dinamico" el comp . field1 de ls_data
*    out->write( <lfs_generic> ).                  "->muestra 1
*
*
*
*    ASSIGN lt_data[ 1 ]-('field1') TO <lfs_generic>.  " toma la fila 1 de  lt_data y su comp. field1 " -> muestra 1
*    "ASSIGN lt_data[ 1 ]-field1 TO <lfs_generic>.      " lo mismo que la anterior fila
*    out->write( <lfs_generic> ).                      "->muestra 1
*
*
*
*    "------IMPORTANTE AL TRABABJAR CON REFERENCIAS DE DATOS USAR EL COMPONENT------
*    ASSIGN COMPONENT  'field2' OF STRUCTURE lr_Data->* TO <lfs_generic>. "accede a field2 de la estructura ereferenciada
*    out->write( <lfs_generic> ).    " -> muestra B
*
*
*    ASSIGN COMPONENT  'field3' OF STRUCTURE lr_Data->* TO <lfs_generic>. "accede a field3 de la estructura ereferenciada
*    out->write( <lfs_generic> ).    " -> muestra y
*
*
*
*    DATA lv_field TYPE string VALUE 'field2'.
*    ASSIGN ls_data-(lv_field) TO <lfs_generic>.     " asignacion por "nombre en variable" field2
*    out->write( <lfs_generic> ).                    " muestra aaa
*
*    ASSIGN ('ls_data-field1') to <lfs_generic>.     "asignacion por "nombre absoluto" en c adena
*     out->write( <lfs_generic> ).                   " muestra 1
*
*     ASSIGN ls_data-(3) to <lfs_generic>.           "Asignacion por "posicion"  (3= field3)
*       out->write( <lfs_generic> ).                 "muestra z
*

*"---------------------------------------------------------------------------------
*" Definición de un tipo de tabla interna con filas de /dmo/flight
*" Clave primaria NO única por (carrier_id, connection_id, flight_date)
*" → permitirá duplicados en esa combinación pero servirá para ordenar por defecto
*"---------------------------------------------------------------------------------
TYPES lty_flights TYPE STANDARD TABLE OF /dmo/flight
                  WITH NON-UNIQUE KEY carrier_id connection_id flight_date.
*
*"---------------------------------------------------------------------------------
*" Declaración de la tabla interna que usaremos en los ejemplos de ordenación
*"---------------------------------------------------------------------------------
DATA lt_flights TYPE lty_flights.                          " Itab de vuelos con la clave anterior
*
*"---------------------------------------------------------------------------------
*" Carga manual de datos de ejemplo usando constructor VALUE #( ... ).
*" Nota: muchos campos de /dmo/flight son DATS, NUMC o DEC → las comillas serán
*"       convertidas implícitamente (si prefieres, puedes usar CONV <tipo>( ... )).
*"       flight_date es DATS (YYYYMMDD), price suele ser DEC / CURR.
*"---------------------------------------------------------------------------------
lt_flights = VALUE #(
  ( client         = sy-mandt                                " Mandante actual del sistema
    carrier_id     = 'CO'                                    " Compañía aérea
    connection_id  = '0500'                                  " Conexión (NUMC/char con ceros a la izquierda)
    flight_date    = '20250201'                              " Fecha de vuelo (YYYYMMDD)
    plane_type_id  = '123-456'                               " Tipo de avión (texto)
    price          = '1000'                                  " Precio (se convertirá a DEC/CURR si aplica)
    currency_code  = 'COP' )                                 " Moneda

  ( client         = sy-mandt
    carrier_id     = 'MX'
    connection_id  = '0600'
    flight_date    = '20250120'
    plane_type_id  = '747-400'
    price          = '800'
    currency_code  = 'MXN' )

  ( client         = sy-mandt
    carrier_id     = 'QF'
    connection_id  = '0006'
    flight_date    = '20230112'
    plane_type_id  = 'A380'
    price          = '1600'
    currency_code  = 'AUD' )

  ( client         = sy-mandt
    carrier_id     = 'SP'
    connection_id  = '0700'
    flight_date    = '20250610'
    plane_type_id  = '321-654'
    price          = '100'
    currency_code  = 'EUR' )

  ( client         = sy-mandt
    carrier_id     = 'LX'
    connection_id  = '0900'
    flight_date    = '20250101'
    plane_type_id  = '258-963'
    price          = '50'
    currency_code  = 'COP' )
).
*
*"---------------------------------------------------------------------------------
*" Mostrar la tabla ANTES de ordenar
*"---------------------------------------------------------------------------------
*out->write( |Before Sort| ).                                " Título/etiqueta
*out->write( lt_flights ).                                   " Contenido actual de la itab
*
*"=================================================================================
*" SORT con la clave primaria de la itab
*"=================================================================================
*SORT lt_flights.                                            " Ordena por la clave definida en lty_flights:
*                                                            " (carrier_id, connection_id, flight_date) ASC por defecto
*out->write( |Sort by primary key| ).                        " Título/etiqueta
*out->write( lt_flights ).                                   " Tabla ya ordenada por la clave
*
*"=================================================================================
*" SORT por cualquier campo (varios campos) – orden ascendente por defecto
*"=================================================================================
*SORT lt_flights BY currency_code plane_type_id.             " Ordena 1º por moneda, 2º por tipo de avión (ASC/ASC)
*out->write( |Sort by 2 fields| ).                           " Título/etiqueta
*out->write( lt_flights ).                                   " Resultado del orden múltiple
*
*"=================================================================================
*" SORT combinando ASCENDING y DESCENDING por distintos campos
*"=================================================================================
*SORT lt_flights BY carrier_id ASCENDING                     " 1º por compañía (A→Z)
*                   flight_date DESCENDING.                  " 2º por fecha (más reciente primero)
*out->write( |Sort by 2 fields (ASC/DESC)| ).                " Título/etiqueta
*out->write( lt_flights ).


"MEJOR MANERA PARA ELIMINAR REGISTROS DUPLICADOS

    SORT lt_flights by carrier_id connection_id.
    out->write( lt_flights ).

    DELETE ADJACENT DUPLICATES FROM lt_flights.

    out->write( lt_flights ).





  ENDMETHOD.
ENDCLASS.
