CLASS zcl_except_handl_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EXCEPT_HANDL_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
*   DECLARATIONS

    DATA result TYPE i.
    DATA numbers TYPE TABLE OF i.

* PREPARATION

    APPEND 123 TO numbers.

* EXAMPLE 1: CONVERSION ERROR (NO NUMBER)
**********************************************************************

    CONSTANTS c_text TYPE string VALUE 'ABC'.
    "CONSTANTS c_text TYPE string VALUE '123'.

    out->write(  '--------------------------' ).
    out->write(  'Example 1: conversion error' ).
    out->write(  '--------------------------' ).

    TRY.

        result = c_text.
        out->write(  |Converted content is {  result }| ).

      CATCH cx_sy_conversion_no_number.
        out->write( |Error: {  c_text } is not a number!| ).
    ENDTRY.

    out->write( |\n| ).


* EXAMPLE 2: DIVISION BY ZERO
**********************************************************************

    CONSTANTS c_numer TYPE i VALUE 0.
    "CONSTANTS c_numer TYPE i VALUE 7.

    out->write(  '--------------------------' ).
    out->write(  'Example 2: division by zero' ).
    out->write(  '--------------------------' ).

    TRY.
        result = 100 / c_numer.
        out->write( |100 divided by {  c_numer } equals {  result }| ).
      CATCH cx_sy_zerodivide.
        out->write( 'Error: Division by zero is not defined!' ).
    ENDTRY.
    out->write( |\n| ).

* EXAMPLE 3: ITAB ERROR (LINE NOT FOUND)
**********************************************************************

    CONSTANTS c_index TYPE i VALUE 2.
    "CONSTANTS c_index TYPE i VALUE 1.

    out->write(  '--------------------------' ).
    out->write(  'Example 3: Line not found' ).
    out->write(  '--------------------------' ).

    TRY.
        result = numbers[ c_index ].
        out->write( |COntent of row { c_index } equals { result }| ).
      CATCH cx_sy_itab_line_not_found.
        out->write( `Error: Itab has less than { c_index } rows` ).
    ENDTRY.

    out->write( |\n| ).

* EXAMPLE 4:COMBINATION OF DIFFERENT EXCEPTIONS.
**********************************************************************

    "CONSTANTS c_char TYPE c LENGTH 1 VALUE 'X'.
    "CONSTANTS c_char TYPE c LENGTH 1 VALUE '0'.
    CONSTANTS c_char TYPE c LENGTH 1 VALUE '1'.
    "CONSTANTS c_char TYPE c LENGTH 1 VALUE '2'.

    out->write(  '--------------------------' ).
    out->write(  'Example 4: COmbination' ).
    out->write(  '--------------------------' ).


        TRY.
         result = numbers[ 2 / c_char ].
         out->write( |Result: {  result }| ).
        CATCH CX_SY_ZERODIVIDE.
            out->write( `Error: Division by zero is not defined` ).
        CATCH cx_sy_conversion_no_number.
        out->write( |Error: { c_char } is not a number! | ).
        CATCH CX_SY_ITAB_LINE_NOT_FOUND.
        out->write( |Error: Itab contains less than { 2 / c_char } rows| ).
    ENDTRY.





  ENDMETHOD.
ENDCLASS.
