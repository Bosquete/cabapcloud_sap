CLASS zcl_mexeptions_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mexeptions_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* DECLARATIONS
*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    DATA result TYPE i.
    DATA numbers TYPE TABLE OF i.


* PREPARATION
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


    APPEND 123 TO numbers.

* EXAMPLE 1: CONVERSION ERROR ( NO NUMBER)
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

*   CONSTANTS c_text TYPE string VALUE 'ABC'.
       CONSTANTS c_text TYPE string VALUE 'HOLA'.

    out->write( `----------------------------------` ).
    out->write( `Example 1: Conversion Error` ).
    out->write( `----------------------------------` ).



    TRY.
        result = c_text.
        out->write(  |Converted content is {  result }| ).
      CATCH cx_sy_conversion_no_number.
        out->write(  |Error: { c_text  } is not a number!| ).
    ENDTRY.

* EXAMPLE 2: DIVISION BY ZERO
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


*   CONSTANTS c_number TYPE i VALUE 0.
    CONSTANTS c_number TYPE i VALUE 7.

    out->write(  `---------------------------` ).
    out->write(  `Example 2: Division by Zero` ).
    out->write(  `---------------------------` ).

    TRY.
        result = 100 / c_number.
        out->write( |100 divided by { c_number } equals { result }| ).
      CATCH cx_sy_zerodivide.
        out->write(  `Error: Division by zero is not defined!` ).
    ENDTRY.

* Example 3: Itab Error (Line Not Found)
**********************************************************************

*    CONSTANTS c_index TYPE i VALUE 2.
    CONSTANTS c_index TYPE i VALUE 0.

    out->write(  `-------------------------` ).
    out->write(  `Example 3: Line Not Found` ).
    out->write(  `-------------------------` ).

    TRY.
        result = numbers[ c_index ].
        out->write( |Content of row { c_index } equals { result }| ).
      CATCH cx_sy_itab_line_not_found.
        out->write(  `Error: Itab has less than { c_index } rows!` ).
    ENDTRY.


* Example 4: Combination of Different Exceptions
**********************************************************************
*    CONSTANTS c_char TYPE c LENGTH 1 VALUE 'X'.
*    CONSTANTS c_char TYPE c length 1 value '0'.
*   CONSTANTS c_char TYPE c LENGTH 1 VALUE '1'.
    CONSTANTS c_char TYPE c length 1 value '2'.

    out->write(  `----------------------` ).
    out->write(  `Example 4: Combination` ).
    out->write(  `----------------------` ).

    TRY.
        result = numbers[ 2 / c_char ].
        out->write( |Result: { result } | ).
      CATCH cx_sy_zerodivide.
        out->write( `Error: Division by zero is not defined`  ).
      CATCH cx_sy_conversion_no_number.
        out->write( |Error: { c_char } is not a number! | ).
      CATCH cx_sy_itab_line_not_found.
        out->write( |Error: Itab contains less than { 2 / c_char } rows| ).
    ENDTRY.


  ENDMETHOD.
ENDCLASS.
