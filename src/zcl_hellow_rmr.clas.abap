CLASS zcl_hellow_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hellow_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  OUT->WRITE( 'Hello World' ).

  ENDMETHOD.
ENDCLASS.
