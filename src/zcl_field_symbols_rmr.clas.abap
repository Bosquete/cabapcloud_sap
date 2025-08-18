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



    SELECT
    FROM ztab_dbase_rmr
    FIELDS *
    INTO TABLE @DATA(gt_employees).

    out->write( data =  gt_employees name = 'gt_employees' ).
    out->write( |\n| ).

    READ TABLE gt_employees ASSIGNING FIELD-SYMBOL(<lfs_employee_rd>) WITH KEY first_name = 'Mario'.

            <lfs_employee_rd>-last_name = 'Rivera'.
            <lfs_employee_rd>-email = 'rivera@experis.es'.


    out->write( data =  gt_employees name = 'gt_employees' ).

  ENDMETHOD.
ENDCLASS.
