CLASS zcl_read_table_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_read_table_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*
*  SELECT FROM /dmo/airport
*         FIELDS *
*         WHERE country = 'DE'
*         INTO TABLE @DATA(lt_flights).
*
*   IF sy-subrc = 0.  " sirve como un código de retorno que indica el estado de ejecución de una sentencia ABAP específica.
*                        "Si la sentencia se ejecuta correctamente, SY-SUBRC toma el valor 0, lo que indica un resultado exitoso.
*                        "En caso de que la operación falle o genere un error o advertencia, SY-SUBRC adopta un valor distinto de cero,
*                        "como 4, 8, o otros valores específicos según el tipo de sentencia y el motivo del fallo
*
*        READ TABLE lt_flights INTO DATA(ls_flights) INDEX 4.  "trae la fila 4
*
**        out->write( data = lt_flights name = 'tabla de vuelos' ).
**        out->write( |\n| ).
**        out->write( data = ls_flights name = 'estructura de vuelos' ).
*
*        READ TABLE lt_flights INTO DATA(ls_flights2) INDEX 4 TRANSPORTING airport_id city. " trae los dos indicados con el transporting
*
*        out->write( data = ls_flights2 name = 'estructura de vuelos' ).
*
*  ENDIF.

**********************************************************************
    " lo mismo pero usando lso apuntadores.


*  SELECT FROM /dmo/airport
*         FIELDS *
*         WHERE country = 'DE'
*         INTO TABLE @DATA(lt_flights).
*
*   IF sy-subrc = 0.
*
*        READ TABLE lt_flights ASSIGNING FIELD-SYMBOL(<lfs_flights>) INDEX 3. " asigna - lfs_flights funciona como un puntero
*        out->write(  data = <lfs_flights> name = '<lfs_flights>' ).
*
*
*
*  ENDIF.

**********************************************************************
    " la forma moderna de usar el READ TABKE con índice.
*
*        SELECT FROM /dmo/airport
*         FIELDS *
*         WHERE country = 'DE'
*         INTO TABLE @DATA(lt_flights).
*
*        DATA(ls_data) = lt_flights[ 2 ].
*        out->write( data = ls_data  name = 'ls_data' ).
*
*        DATA(ls_data2) = VALUE #( lt_flights[ 20 ] DEFAULT lt_flights[ 1 ] ).
*        out->write( data = ls_data2  name = 'ls_data2' ).

**********************************************************************

    "READ TABLE con clave


*             SELECT FROM /dmo/airport
*         FIELDS *
*         WHERE country = 'DE'
*         INTO TABLE @DATA(lt_flights).

*    IF sy-subrc = 0.
*
*      READ TABLE lt_flights INTO DATA(ls_flights) WITH KEY city = 'Berlin'.
*      out->write( data = lt_flights name = 'lt_flights' ).
*      out->write( |\n| ).
*      out->write( data = ls_flights name = 'ls_flights' ).
*
*    ENDIF.

    " forma moderna -- cloud

    SELECT FROM /dmo/airport
             FIELDS *
             WHERE country = 'DE'
             INTO TABLE @DATA(lt_flights).

    "DATA(ls_flight2) = lt_flights[ airport_id = 'MUC' ].
    "out->write(  data = ls_flight2 name = 'ls_flight2' ).

    " para coger solo un valor:
     DATA(ls_flight2) = lt_flights[ airport_id = 'MUC' ]-name.
    out->write(  data = ls_flight2 name = 'ls_flight2' ).


  ENDMETHOD.
ENDCLASS.
