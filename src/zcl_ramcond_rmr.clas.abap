CLASS zcl_ramcond_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RAMCOND_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



* DECLARATIONS
* |------------------------------------------------------------------------------|

*  CONSTANTS c_number TYPE i VALUE 0.
*    CONSTANTS c_number TYPE i VALUE 1.
*  CONSTANTS c_number TYPE i VALUE 2.
*  CONSTANTS c_number TYPE i VALUE -1.
  CONSTANTS c_number TYPE i VALUE -2.

* EXAMPLE 1: SIMPLE IF ... ENDIF.
***************************************************************

    out->write( `-------------------------------` ).
    out->write( `Example 1: Simple IF ... ENDIF.` ).
    out->write( `-------------------------------` ).

    IF c_number = 0.
      out->write( `The value of C_NUMBER equals zero` ).
    ELSE.
      out->write( `The value of C_NUMBER is NOT zero` ).
    ENDIF.

* EXAMPLE 2: OPTIONAL BRANHES ELSEIF AND ELSE
*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    out->write( `-------------------------------` ).
    out->write( `Example 2: OPtional Branches ELSEIF and ELSE.` ).
    out->write( `-------------------------------` ).

    IF c_number = 0.
      out->write(  `The value of C_NUMBER is equals zero` ).
    ELSEIF c_number > 0.
      out->write(  `The value of C_NUMBER is greater than zero` ).
    ELSE.
      out->write(  `The value of C_NUMBER is less than zero` ).
    ENDIF.

* EXAMPLE 3: CASE ...ENDCASE
* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    out->write( `-------------------------------` ).
    out->write( `Example 3: CASE ... ENDCASE.` ).
    out->write( `-------------------------------` ).

    CASE c_number.
      WHEN 0.
        out->write( `The value of C_NUMBER equals zero` ).
      WHEN 1.
        out->write( `The value of C_NUMBER equals ONE` ).
      WHEN 2.
        out->write( `The value of C_NUMBER equals TWO` ).
      WHEN OTHERS.
        out->write( `The value of C_NUMBER EQUALS NONOF THE ABOVE` ).
    ENDCASE.














  ENDMETHOD.
ENDCLASS.
