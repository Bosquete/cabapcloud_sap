CLASS zcl_exact_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_exact_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA lv_num TYPE p LENGTH 5 DECIMALS 2 VALUE '123.45'.

  DATA(lv_conv) = CONV i( lv_num ).

  out->write( |CONV a entero: {  lv_conv } | ).

  TRY.
  DATA(lv_exact) = EXACT i( lv_num ).

  out->write( |EXact a entero: { lv_exact } | ).

  CATCH cx_sy_conversion_error INTO DATA(lx_error).

    out->write( |Error Exact: { lx_error->get_text( ) } | ).

  ENDTRY.




  ENDMETHOD.
ENDCLASS.
