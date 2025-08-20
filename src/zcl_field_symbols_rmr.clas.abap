CLASS zcl_field_symbols_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_field_symbols_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*"          FIELD SYMBOLS
*
*        DATA gv_employee TYPE string.
*
*        " declaración del field symbol (símbolo de campo) que actua como puntero para una variable string.
*        FIELD-SYMBOLS <gfs_employee> TYPE string.
*
*        "asignamos la dirección de memoria de gv_employee al field symbol
*        "ahora <gfs_employee> apunta a la misma zona de memoria que gv_employee.
*        ASSIGN gv_employee TO <gfs_employee>.
*
*
*        "asignamos un valor usando el field symbol, esto modifica la variable global gv_employeeporque ambos apuntan al nmismo dato.
*        <gfs_employee> = 'María'.


**********************************************************************

  "          FIELD SYMBOLS

  " Declaración de variables y tablas internas
*    DATA gv_employee      TYPE string.
*    DATA gt_employees     TYPE STANDARD TABLE OF ztab_dbase_rmr.
*    DATA gt_employees_for TYPE STANDARD TABLE OF ztab_dbase_rmr.
*
*    FIELD-SYMBOLS: <gfs_employee>  TYPE string,
*                   <gfs_employee2> TYPE ztab_dbase_rmr. " field-symbol a una **linea** de la tabla Zxxxxxx
*
*    " Asignar y usar un field-symbol con variable simple
*    ASSIGN gv_employee TO <gfs_employee>.
*    <gfs_employee> = 'Maria'.
*    "out->write( <gfs_employee> ).
*
*
*    UNASSIGN <gfs_employee>.
*
*    " Seleccionar todos los empleados de la tabla Z
*    SELECT FROM ztab_bd_der
*           FIELDS *
*           INTO TABLE @gt_employees.
*
*
*    LOOP AT gt_employees INTO DATA(gs_employee). " itera copuando cda fila en gs_emloyee ( estructura loca)
*      gs_employee-email = 'nuevo@email.com'.     " cambia el email **solo en la copia**, no en gt_employees
*    ENDLOOP.                                     " fin del bucle por copia ( no persiste camnos en la tabla )
*
*    out->write( gs_employee ).
*    out->write( |\n| ).
*    out->write( data = gt_employees name = 'Structure' ). "Muestra gt_employees "(deberia seguir sin cambios) "
*
*
*    LOOP AT gt_employees ASSIGNING <gfs_employee2>.    " Itera ASSIGNING haciendo referencia a la fila real de gt_employees
*      <gfs_employee2>-email = 'nuevo@email.com'.       " Modifica el email **en la fila real** de gt_employees
*    ENDLOOP.                                           " Fin del bulcle por referencia ( si persisten los cambios)
*    out->write( |\n| ).
*    out->write( data = gt_employees name = 'Field symbols' ). "Muestra gt_employees ya con los emails modificados
*
*
*    gt_employees_for = VALUE #(                  " construye otra tabla a partir de gt_employees
*      FOR <gfs_employee3> IN gt_employees        " bucle de compresion: recorre cada fila
*      ( CORRESPONDING #( <gfs_employee3> ) )     " inserta una linea copiando campos por Nombre (1:1)
*    ).                                           " gt_emloyees_for queda como copia de gt_employees
*    out->write( |\n| ).
*    out->write( data = gt_employees_for name = 'gt_employees_for' ).  "muestra el resultado de la copia de gt_employees, en la nueva tabla
*                                                                      " gt_employees_for que ha sido introducida por el for.
*
*

**********************************************************************
"         AÑADIR REGISTROS
*
*        SELECT
*        FROM ztab_dbase_rmr
*        FIELDS *
*        INTO TABLE @DATA(gt_employees).
*
*        APPEND INITIAL LINE TO gt_employees ASSIGNING FIELD-SYMBOL(<lfs_employee_apd>).
*
*        <lfs_employee_apd> = VALUE #(
*                                    mandt          = sy-mandt
*                                    id             = 05
*                                    first_name     = 'Peter'
*                                    last_name      = 'Mora'
*                                    email          = 'mora@experis.es'
*                                    phone_number   = 5092348
*                                    salary         = '2000'
*                                    currency_code  = 'EUR'
*                                    ).
*
*
*        out->write( data = gt_employees name = 'gt_employees' ).


**********************************************************************
"  INSERTAR REGISTRO SCON INSERT


*        SELECT
*        FROM ztab_dbase_rmr
*        FIELDS *
*        INTO TABLE @DATA(gt_employees).
*
*        INSERT INITIAL LINE INTO gt_employees ASSIGNING FIELD-SYMBOL(<lfs_employee_apd>) INDEX 2.
*
*        <lfs_employee_apd> = VALUE #(
*                                    mandt          = sy-mandt
*                                    id             = 05
*                                    first_name     = 'Peter'
*                                    last_name      = 'Mora'
*                                    email          = 'mora@experis.es'
*                                    phone_number   = 5092348
*                                    salary         = '2000'
*                                    currency_code  = 'EUR'
*                                    ).
*
*
*        out->write( data = gt_employees name = 'gt_employees' ).

**********************************************************************
"    LEER REGISTROS

*
*
*    SELECT
*    FROM ztab_dbase_rmr
*    FIELDS *
*    INTO TABLE @DATA(gt_employees).
*
*    out->write( data =  gt_employees name = 'gt_employees' ).
*    out->write( |\n| ).
*
*    READ TABLE gt_employees ASSIGNING FIELD-SYMBOL(<lfs_employee_rd>) WITH KEY first_name = 'Mario'.
*
*            <lfs_employee_rd>-last_name = 'Rivera'.
*            <lfs_employee_rd>-email = 'rivera@experis.es'.
*
*
*    out->write( data =  gt_employees name = 'gt_employees' ).



**********************************************************************

"          OBJETOS DE DATOS ANÓNIMOS


        DATA(lr_dato01) = NEW i( 123 ). "creamos un objeto de datos anónimo de TYPE i
                                        " inicializamos a 123 y guarda un "ref to" i en lr_dato01
        DATA(lr_dato02) = NEW ztab_dbase_rmr( id = 10005 first_name = 'Sofía' ). "creamos una estructura anónima de tipo ztab con lso valores indicados entre paréntesis.
                                                                                " y guarda una ref to.

         out->write( lr_dato01 ).
         out->write( lr_dato02 ).

         SELECT *
         from ztab_dbase_rmr
         INTO TABLE NEW @DATA(lr_dato03). "crea una tabla interna anónima con el resultado y devuelve una ref to en lr_data03

            out->write( lr_dato03 ).

          SELECT
          SINGLE *
          FROM ztab_dbase_rmr
          INTO NEW @DATA(lr_dato04). "crea una estructura anónima con esa fila y devuelve un ref to en lr_dato04

          out->write( lr_dato04 ). "sentencia dinámica con assign


          """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
          "SENTENCIAS DINÁMICAS CON ASSIGN

          TYPES: BEGIN OF lty_data,
                 field1 TYPE i,
                 field2 TYPE string,
                 field3 TYPE string,
           END OF lty_data.


           DATA: ls_data TYPE lty_data,
                 lt_data TYPE TABLE OF lty_data WITH EMPTY KEY.

           ls_data = VALUE #(
                             field1 = 1
                             field2 = 'aaa'
                             field3 = 'z'
                             ).
           APPEND ls_data to lt_data.


           DATA(lr_data) = NEW lty_data( " crea referencia de datos a una estructura anónima.
                             field1 = 2     "iniciada con los valores 2, b,y
                             field2 = 'b'
                             field3 = 'y'
                             ).


           FIELD-SYMBOLS <lfs_generic> TYPE DATA. "field symbol genérico dinámico.

           ASSIGN ls_data-('field1')  TO <lfs_generic>. "asigna por nombre dinámico el comp. field1 de ls_data
           out->write( <lfs_generic> ).

           ASSIGN ls_data-field1  TO <lfs_generic>.
            out->write( <lfs_generic> ).

            ASSIGN lt_data[ 1 ]-('field1') TO <lfs_generic>.
            out->write( lt_data ).

            ASSIGN lt_data[ 1 ]-field1 TO <lfs_generic>.
            out->write( lt_data ).

            ASSIGN COMPONENT 'field2' OF STRUCTURE lr_data->* TO <lfs_generic>. "accede a field2 de la estructura referenciada
                                                                                "importante al trabajar con referncias de datos usar el component
            out->write( <lfs_generic> ).  " muestra b

            ASSIGN COMPONENT 'field3' OF STRUCTURE lr_data->* TO <lfs_generic>. "accede a field2 de la estructura referenciada
                                                                                "importante al trabajar con referncias de datos usar el component
            out->write( <lfs_generic> ).  " muestra y


            DATA lv_field TYPE string VALUE 'field2'.
            ASSIGN ls_data-(lv_field) TO <lfs_generic>." asignación por nombre en variable field2
            out->write( <lfs_generic> ). "muestra aaa


            ASSIGN ls_data-field1 TO <lfs_generic>.  "asignación por nombre absoluto en c
            out->write( <lfs_generic> ).  "muestra1.

            ASSIGN ls_data-(3) TO <lfs_generic>.  "asignación por posición
            out->write( <lfs_generic> ).  "muestra z



  ENDMETHOD.
ENDCLASS.
