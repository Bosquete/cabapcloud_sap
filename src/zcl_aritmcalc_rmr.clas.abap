CLASS zcl_aritmcalc_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ARITMCALC_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* DECLARATIONS
* |-----------------------------------------------------------------------------------|

    " COMMENT/UNCOMMENT THESE LINE FOR DIFFERENT RESULT TYPES
    TYPES t_result TYPE p LENGTH 8 DECIMALS 2.
*TYPES t_result TYPE p LENGTH 8 DECIMALS 0.
*TYPES t_result TYPE i.

    DATA result TYPE t_result.

* CALCULATIONS
* |------------------------------------------------------------------------------------|
    " comment/uncomment these lines for different calculations

*    result = 2 + 3.
*   result = 2 - 3.
*   result = 2 * 3.
*   result = 2 / 3.
*
*   result = sqrt( 2 ).
   result = ipow( base = 2 exp = 3 ).
*
*   result = ( 8* 7 -6 ) / ( 5 + 4 ).
*   result = 8 * 7 - 6 / 5 + 4.

* Output
*   |------------------------------------------------------------------------------------|


    out->write(  result ).


* DIV & MOD
**********************************************************************

DATA: num1 TYPE i VALUE 10,
      num2 TYPE i VALUE 3,
      cociente TYPE i,
      resto TYPE i.

cociente = num1 DIV num2.  " Cociente = 3
resto = num1 MOD num2.   " Resto = 1

out->write( | 'Cociente:' { cociente } | ).
out->write( |'Resto' {  resto }| ).






  ENDMETHOD.
ENDCLASS.
