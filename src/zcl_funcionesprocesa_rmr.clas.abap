CLASS zcl_funcionesprocesa_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_funcionesprocesa_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA: lv_string TYPE string VALUE 'daniel Fernando Pedro Ramon',
        lv_comodin TYPE string.


        "MAYUS minus
        out->write( |to_upper = { to_upper( lv_string )  } | ).  "texto a mayúscula

        out->write( | to_lower = {  to_lower( lv_string ) }| ).  "texto a minúscula

        out->write( | to_mixed = {  to_mixed( lv_string ) }| ).  " convierte primera letra de cada palabra en mayúscula

        out->write( | from_mixed = {  from_mixed( lv_string ) }| ). "Invierte el efecto de too_mixed si corresponde.

        "order

        out->write( | reverse = { reverse( lv_string ) }| ). "invierte le orden de todos lso carcateres del texto.

        out->write( | shift_left (places) = { shift_left( val = lv_string places = 5 ) }| ). " desplaza 5 carcateres ala izquierda ( rellena espacios)

        out->write( | shift_right (places) = { shift_right( val = lv_string places = 5 ) }| ). " desplaza 5 carcateres ala izquierda ( rellena espacios)

        out->write( | shift_left (circ) = {  shift_left(  val = lv_string circular = 5 ) }| ). "desplaza cinco carcateres izquierda de forma circular.

        out->write( |shift_right (circ) = {  shift_right(  val = lv_string circular  = 5 ) }| ). "desplaza 5 carcateres derecha de forma ciruclar.

        "SUBSTRING

        out->write( | Substring = {  substring(  val = lv_string off = 5 len = 9 ) }| ). "Extrae 6 carcateres desde la posición 9.

        out->write( |substring_from = {  substring_from( val = lv_string sub = 'Pedro' ) }| ). "Devuelve el texto a partir del indicado inclusive.

        out->write( | substring_after = {  substring_after(  val = lv_string sub = 'Pedro' ) }| ). "devuleve el texto después del indicado excluyente

        out->write( | substring_to = {  substring_to(  val = lv_string sub = 'Pedro' ) }| ). "devuleve el texto desde el inicio hasta del indicado incluido.

        out->write( | substring_before = {  substring_before(  val = lv_string sub = 'Pedro' ) }| ). "devuleve el texto antes del indicado.

        "others

        out->write( | condense = {  condense(  val = lv_string ) }| ). "elimina espacios duplicados e innecesarios ( como dobles espacios en blanco)

        out->write( | repeat = { repeat( val = lv_string occ = 2 ) }| ). " repite el contenido completo 2 veces

        out->write( | segment1 = { segment(  val = lv_string sep = '!' index = 1 ) }| ). "extrae el primer segmento antes del primer !

    DATA: lv_texto type string VALUE '!Bienvenido a ABAP DANI!',
          lv_abap  type string value 'ABAP',
          lv_resultado type string,
          lv_count1 type i.

          "lv_count1 =    { count( val = lv_texto sub = lv_abap ) } ).

          "lv_count1 = count( val = lv_texto sub = 'ABAP' ).
          "out->write(  lv_count1 ).

            "if lv_count1 = 1.

            if count( val = lv_texto sub = 'ABAP' ) = 1.

                out->write( substring_from(  val = lv_texto sub = 'ABAP' ) ).

                else.
                 out->write( 'no existe en el texto' ).

            ENDIF.




  ENDMETHOD.
ENDCLASS.
