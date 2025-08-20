CLASS zcl_progra_dinam_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_progra_dinam_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  " PROGRAMACIÓN DINÁMICA:

  "FIELD-SYMBOLS DINÁMICOS

  FIELD-SYMBOLS: <gt_employees> TYPE ANY TABLE,  "any table es un puntero a una tabl ainterna genérica, o sea a cualquier tipo de tabla
                 <gs_employee>  TYPE ANY,       " puntero a un regustro/ estructura gen
                 <gs_data>      TYPE ANY.       " puntero a un campo genérico.

   "crea un registro de ejemplo en base a la tabla    ZTAB_DBASE_RMR
  DATA(gs_employee) = VALUE ZTAB_DBASE_RMR(
                                            mandt          = sy-mandt
                                            id             = 05
                                            first_name     = 'Peter'
                                            last_name      = 'Mora'
                                            email          = 'mora@experis.es'
                                            phone_number   = 5092348
                                            salary         = '2000'
                                            currency_code  = 'EUR'
                                            ).

  "Asignar el registro gs_employee al field_symbol <gs_employee>
  ASSIGN gs_employee to <gs_employee>.

        "verificar que el field-symbol <gs_employee> esta esignado
        if <gs_employee> is assigned.
                "asignar dinamicamente el componente 'first_name? del registro >gs_employee> al field-symbols <gs_dat>
                ASSIGN COMPONENT 'first_name' OF STRUCTURE <gs_employee> TO <gs_data>.

                "verifica que el field-symbol <gs_data> está asignado
                if <gs_data> is ASSIGNED.
                        "modifica dinamicamente el valor del campo first_name a 'María'
                        <gs_data> = 'María'.
                        out->write( <gs_data> ).

                        UNASSIGN <gs_data>.
                ENDIF.

                "<gs_employee> = 'JUAN'.
                        out->write( <gs_employee> ).

                        UNASSIGN <gs_employee>.
        endif.

        out->write( data = gs_employee name = 'gs_employee' ).



**********************************************************************
"        DECLARACIÓN UNA VARIABLE DE REFERENCIA LR_DATA Y LE ASIGNAMOS MEMORIA PARA UN ENTERO (TIPO I)

        DATA(lr_data) = NEW i( ).

        "asociamos el contenido de la referencia lr_data(el entero en memoria)
        "a un field-symbol <lfs_value>, para poder manipularlo de forma directa.

        ASSIGN lr_data->* TO FIELD-SYMBOL(<lfs_value>).

        "modificamos el valor apuntado por <lfs_value> (es decir el entero en memoria) y lo establecemos en 30
        <lfs_value> = 30.

        "Declaramos una referencia lr_class y creamos u nuevo objeto de la clase ZCL_xxx llamando a su constructor (el paéntesis vacio indica constructor sin parámetros.
        data(lr_class) = new ZCL_CLASS_CONST_ESTRUCT_RMR( ).

        out->write( lr_class ).




  ENDMETHOD.
ENDCLASS.
