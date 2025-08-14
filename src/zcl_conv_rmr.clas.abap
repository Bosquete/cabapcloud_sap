CLASS zcl_conv_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_conv_rmr IMPLEMENTATION.


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












  ENDMETHOD.
ENDCLASS.
