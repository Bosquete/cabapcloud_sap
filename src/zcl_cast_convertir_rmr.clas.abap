CLASS zcl_cast_convertir_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cast_convertir_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_struc,
             col1 TYPE i,
             col2 TYPE i,
           END OF ty_struc.

    DATA lr_data TYPE REF TO data.

    DATA ls_int TYPE ty_struc.

    lr_data = NEW ty_struc( ).



    ls_int = CAST ty_struc( lr_data )->*.




    ls_int-col1 = CAST ty_struc( lr_data )->col1.
    ls_int-col2 = CAST ty_struc( lr_data )->col2.

    out->write( data = ls_int name = 'ls_int' ).

    out->write( data = ls_int-col1 name = 'ls_int-col1' ).

    out->write( data = ls_int-col2 name = 'ls_int-col2' ).



  ENDMETHOD.
ENDCLASS.
