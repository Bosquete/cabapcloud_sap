CLASS zcl_ref_datos_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_REF_DATOS_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA: lv_int_value TYPE i VALUE 100,
        lv_ref_int TYPE REF TO i.

        lv_ref_int = REF #( lv_int_value ).


        out->write( data = lv_int_value name = 'Original Value' ).
        out->write( data = lv_ref_int->* name = 'Value desde la referencia' ).
        out->write( data = lv_ref_int name = 'Value desde la referencia' ).









  ENDMETHOD.
ENDCLASS.
