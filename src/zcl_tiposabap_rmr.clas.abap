CLASS zcl_tiposabap_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tiposabap_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*  data Objects with Built_in Types
*  *******************************************************************************************************************************

    " comment/uncomment the following declaratins and check the output
*   DATA variable TYPE string.
*   Data variable TYPE i.
*   DATA varibale TYPE d.
*    DATA variable TYPE c LENGTH 10.
*    DATA variable TYPE n LENGTH 10.
    DATA variable TYPE p LENGTH 8 DECIMALS 2.
*
*    output
*    ********************************************************************************************************************************

    out->write( 'Result with Initial Value' ).
    out->write(  variable ).
    out->write( '---------' ).


    variable = '19891109'.

    out->write( 'Resulta with Value 19891109' ).
    out->write(  variable ).
    out->write(  '--------' ).


  ENDMETHOD.
ENDCLASS.
