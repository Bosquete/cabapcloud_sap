CLASS zcl_class_review_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_class_review_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  data: lv_string type string value 'daniel fernando pedro jorge',
        lv_name type string value 'ana',
        lv_comodin type string,
        lv_num type i.


  " strlen -
  lv_num = strlen( lv_string ).

  out->write( lv_num ).

  "count
  lv_num = count( val = lv_string sub = lv_name ).

  out->write( lv_num ).

  "count_of_any
  lv_num = count_any_of( val = lv_string sub = lv_name ).

  out->write( lv_num ).

  "count_any_not_of
  lv_num = count_any_not_of( val = lv_string sub = lv_name ).
  out->write( lv_num ).

  "find
  lv_num = find( val = lv_string sub = lv_name ).
  out->write( lv_num ).

  "find_any_of
  lv_num = find_any_of( val = lv_string sub = 'Ana' ).
  out->write( lv_num ).

**********************************************************************

"             FUNCIONES DE PROCESAMIENTO

   data: lv_string2 type string value 'patrick jorge robert',
         lv_string3 type string value 'pedro_johnson patrick_label robert_black',
         lv_comodin2 type string.

         "to_upper
         out->write( |to_upper = { to_upper( lv_string2 ) }| ).

         "to_lower
         out->write( | to_lower = { to_lower( lv_string2 ) }| ).
         "to_mixed
         out->write( | to_mixed = {  to_mixed( lv_string3 ) }| ).
         "from_mixed
         out->write( |from_mixed = { from_mixed( lv_string3 ) }| ).
         "order
         out->write( |reverse = { reverse( lv_string3 ) }| ).
         "shift_left
         out->write( |shift_left = { shift_left( val = lv_string3 places = 3 ) }| ).
         "shift_right
         out->write( |shift_right = { shift_right( val = lv_string3 places = 5 ) }| ).
         "shift_left circ
         out->write( |shift_left = { shift_left(  val = lv_string circular = 5 ) }| ).
         "shift_right circ
         out->write( |shift_right = { shift_right( val = lv_string circular = 3 ) }| ).
         "substring
         out->write( |substring = { substring(  val = lv_string3 off = 5 len = 3 ) }| ).
         "substring_from
         out->write( |substring_from = { substring_from( val = lv_string sub = 'Ana' ) }| ).
         "substring_after
         out->write( |substring_after = { substring_after(  val = lv_string sub = lv_name ) }| ).
**********************************************************************

         " funciones de contenido

         data: lv_text type string,
               lv_patern type string,
               lv_patern2 type string.

               " contains con pcre

               lv_text = 'El teléfono del empleado es 688-365-987 y el correo electrónico es daniel.elviraruiz@experis.es'.
               lv_patern = `\d{3}-\d{3}-\d{3}`.
               lv_patern2 = `\b[ A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b`.

               if contains( val = lv_text pcre = lv_patern2 ).

                        out->write( 'El texto contiene una dirección de correo' ).

                        DATA(lv_count) = count(  val = lv_text pcre = lv_patern2  ).

                        out->write( lv_count ).

                        DATA(lv_pos) = find( val = lv_text pcre = lv_patern2 occ = 1 ).

                        out->write( lv_pos ).

                        ENDIF.

                 if contains( val = lv_text pcre = lv_patern ).

                        out->write( 'el texto contiene un nº de teléfono' ).
                        else.
                        out->write( 'el texto no contiene un nº de teléfono' ).
                    endif.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " CONCATENACIÓN

            "CONCATENACIÓN

            data: lv_string_a type string value 'hola,¿qué tal está?',
                  lv_string_b type string value 'Bien gracias 2',
                  lv_concatena type string,
                  lv_concatena2 type string,
                  lv_concatena3 type string.

             lv_concatena = |concatenación 1: { lv_string_a }{ lv_string_b }|.
             out->write( lv_concatena ).


                CONCATENATE lv_string_a lv_string_b
                into lv_concatena2 SEPARATED BY space.
                out->write( lv_concatena2 ).

                lv_concatena3 = 'Hola' && ` ` && 'Juan'.
                out->write( lv_concatena3 ).

**********************************************************************
        " concatenación de líneas de tablas

        select from /dmo/flight
        fields flight_date
        into table @data(lt_itab).

        data(lv_aleatorio) = cl_abap_random_int=>create(
                            seed = cl_abap_random=>seed( )
                            min = 1 max = 4
                            )->get_next( ).

        data(lv_num1) = cl_abap_random_int=>create(
                            seed = cl_abap_random=>seed(  )
                            min = 1 max = 100
                            )->get_next( ).

        data(lv_num2) = cl_abap_random_int=>create(
                            seed = cl_abap_random=>seed(  )
                            min = 1 max = 100
                            )->get_next( ).

        data: lv_operacion type string,
              lv_resultado type p DECIMALS 2.


              Case lv_aleatorio.

                    when 1.
                         lv_operacion = '+'.
                    when 2.
                         lv_operacion = '-'.
                    when 3.
                         lv_operacion = '*'.
                    when 4.
                         lv_operacion = '/'.
                    when others.

                    endcase.

              case lv_operacion.

                    when '+'.
                         lv_resultado = lv_num1 + lv_num2.
                         out->write( |'El resultado de { lv_num1 }{ lv_operacion }{ lv_num2 } es { lv_resultado }| ).
                    when '-'.
                         lv_resultado = lv_num1 + lv_num2.
                         out->write( |'El resultado de { lv_num1 }{ lv_operacion }{ lv_num2 } es { lv_resultado }| ).
                    when '*'.
                         lv_resultado = lv_num1 + lv_num2.
                         out->write( |'El resultado de { lv_num1 }{ lv_operacion }{ lv_num2 } es { lv_resultado }| ).
                    when '/'.
                         lv_resultado = lv_num1 + lv_num2.
                         out->write( |'El resultado de { lv_num1 }{ lv_operacion }{ lv_num2 } es { lv_resultado }| ).

                    when others.
                    endcase.






  ENDMETHOD.
ENDCLASS.
