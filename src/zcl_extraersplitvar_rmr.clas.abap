CLASS zcl_extraersplitvar_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EXTRAERSPLITVAR_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*  Ejercicio:
* 1-Extraer de la siguiente variable   DATA(lv_string) = ‘daniel Fernando Pedro ramon Sergio’.
*  los distintos nombres que hay su interior y almacenar cada nombre en variables independientes.
*****************************


  DATA: lv_string TYPE string Value 'daniel Fernando Pedro ramon Sergio',
        lv_nombres TYPE TABLE OF string,
        lv_nombre TYPE string,
        lv_nombre1 TYPE string,
        lv_nombre2 TYPE string,
        lv_nombre3 TYPE string,
        lv_nombre4 TYPE string,
        lv_nombre5 TYPE string.

  "SPLIT lv_string AT | | INTO TABLE lv_nombres.
  SPLIT lv_string AT ' ' INTO TABLE lv_nombres.

  LOOP AT lv_nombres INTO lv_nombre.

        if sy-index = 1.
            lv_nombre1 = lv_nombre.
            out->write( | Hola { lv_nombre1 } | ).
        ELSEIF sy-index = 2.
            lv_nombre2 = lv_nombre.
            out->write( | Hola { lv_nombre2 } | ).
        ElseIF sy-index = 3.
            lv_nombre3 = lv_nombre.
            out->write( | Hola { lv_nombre3 } | ).
         ELSEIF sy-index = 4.
            lv_nombre4 = lv_nombre.
            out->write( | Hola {  lv_nombre4 } | ).
         ELSEIF sy-index = 5.
            lv_nombre5 = lv_nombre.
            out->write( |Hola { lv_nombre5 } | ).
         ENDIF.


   ENDLOOP.


  DATA(lv_nombre7) = lv_nombre1.
   IF lv_nombre1 EQ lv_nombre7.
        out->write( 'son iguales' ).
   ELSE.
        out->write( 'son distintos' ).
   ENDIF.


  ENDMETHOD.
ENDCLASS.
