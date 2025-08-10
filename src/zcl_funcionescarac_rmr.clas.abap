CLASS zcl_funcionescarac_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_funcionescarac_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: lv_string TYPE string VALUE 'daniel Fernando Pedro Ramon',
        lv_name TYPE string VALUE 'Fernando',
        lv_comodin TYPE string,
        lv_num TYPE i.

        "FUNCIONES DE BÚSQUEDA SOBRE CADENAS DE TEXTO

        "strlen - cuenta el nº total de caracteres de la cadena (incluye espacios)

        lv_num = strlen( lv_string ).
        out->write( lv_num ).
        out->write( |El nº total de caracteeres incluyendo espacios es de: { lv_num } | ).


        "count - cuenta cuántas veces aparece un valor en el string.

        lv_num = count(  val = lv_string sub = lv_name ).
        out->write( lv_num ).
        out->write( |Cuenta las veces que aparece en un texto una palabra, en este caso es { lv_name } | &&
                     | y la cantidad de veces que aparece en "{ lv_string }" es: { lv_num } veces.| ).
        lv_num = count(  val = lv_string sub = 'Fernando' ).
        out->write( lv_num ).
        out->write( count(  val = lv_string sub = 'Fernando' ) ).

        "COUNT_ANY_OF - CUENTA CUÁNTOS CARACTERES DE UNA VARIABLE STRING ESTÁN EN UN TEXTO
        lv_num = count_any_of(  val = lv_string sub = lv_name ).
        out->write( lv_num ).

        "COUNT_ANY_NOT_OF - CUENTA CUÁNTOS CARACTERES DE UNA VARIABLE STRING NO ESTÁN EN UN TEXTO
        lv_num = count_any_not_of(  val = lv_string sub = lv_name ).
        out->write( lv_num ).

        " FIND - EMPIEZA A CONTAR POR 0 - DEVUELVE LA POSICIÓN DONDE EMPIEZA LA PALABRA  DENTRO DEL TEXTO
        LV_NUM = FIND(  VAL = LV_STRING SUB = lv_name ).
        out->write( lv_num ).

        " FIND_ANY_OF - devuelve la posición del primer caracter que coincida ocn alguno d elso caracteres.
        lv_num = find_any_of(  val = lv_string sub = 'Fernando' ).
        out->write( lv_num ).

        " FIND_ANY_not_OF - devuelve la posición del primer caracter que coincida ocn alguno d elso caracteres.
        lv_num = find_any_not_of(  val = lv_string sub = 'Fernando' ).
        out->write( lv_num ).
  ENDMETHOD.
ENDCLASS.
