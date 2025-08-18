CLASS zcl_conv_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CONV_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA(lv_number) = 2025.
  Data(lv_text) = CONV string( lv_number ).


  out->write( |Número original ( entero( : { lv_number } ) | ).
  out->write( |Número convertido a texto: { lv_text } | ).

  out->write( |Número original entero: { lv_number } |  && |\n| &&  |Número convertido a texto: { lv_text } | ).

  DATA(lv_str_number) = '150'.
  DATA(lv_int_number) = conv i( lv_str_number ).

  out->write( |cadena originl: { lv_str_number } | ).
  out->write( |Número conevetido a entero: { lv_int_number } | ).


**********************************************************************


            TYPES: BEGIN OF st_connect,
                        airport_from_id TYPE /dmo/airport_from_id,
                        airport_to_id   TYPE /dmo/airport_to_id,
                        carrier_name    TYPE /dmo/carrier_name,
                   END OF st_connect.

            DATA connection TYPE st_connect.
            connection = VALUE #( airport_from_id = 'ABC'  " El signo almohadilla (#) indica al entorno de tiempo de
                                                           " ejecución ABAP que construya una estructura con el mismo
                                                           " tipo que la conexión de variable de destino
                                airport_to_id   = 'XYZ'
                                carrier_name    = 'Mi aerolínea'
                                ).

            out->write( connection ).

            out->write( |\n| ).

*Nota:
*Una asignación en la conexión de formulario = VALUE #( ). con solo un espacio en
*blanco entre paréntesis, rellena todos los componentes de la estructura con el
*valor inicial específico de tipo. Esto tiene el mismo efecto que la sentencia CLEAR.

         DATA connection2 TYPE st_connect.
            connection2 = VALUE #(
                                ).

            out->write( connection2 ).

**********************************************************************

        DATA: var_date1 TYPE d,
              var_date2 TYPE d,
              var_date TYPE d,
              days_between TYPE i,
              var_time_system TYPE t,
              time_zone TYPE c LENGTH 6.

              var_date = cl_abap_context_info=>get_system_date( ).
              "var_date2 = cl_abap_context_info=>get_system_date( ).
              var_time_system = cl_abap_context_info=>get_system_time( ).
              TRY.
                  time_zone = cl_abap_context_info=>get_user_time_zone( ).
                CATCH cx_abap_context_info_error.
                  "handle exception
              ENDTRY.

              var_date1 = '20230101'.
              var_date2 = '20230131'.
              days_between = var_date1 - var_date2.

              out->write(   |{ var_date DATE = USER }| ).
              out->write( var_time_system ).
              out->write( time_zone ).
              out->write( days_between ).








  ENDMETHOD.
ENDCLASS.
