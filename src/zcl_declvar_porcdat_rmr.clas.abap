CLASS zcl_declvar_porcdat_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DECLVAR_PORCDAT_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA number1 TYPE i.
  DATA number2 TYPE i.

  number1 = -8.
  number2 = 3.

*  DATA(result) = number1 / number2.  with inline declaration

  DATA result TYPE p LENGTH 8 DECIMALS 2.

  result = number1 / number2.

  DATA(output) = |{  number1 } / {  number2 } = {  result }|.

  out->write(  result ).
  out->write(  output ).


  ENDMETHOD.
ENDCLASS.
