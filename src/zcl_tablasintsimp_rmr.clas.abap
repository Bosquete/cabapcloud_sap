CLASS zcl_tablasintsimp_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TABLASINTSIMP_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* DECLARATIONS
****************************************************************

    "INTERNAL TABLES
    DATA numbers TYPE TABLE OF i.

    "Table type (local)
    TYPES tt_strings TYPE TABLE OF string.
    DATA text1       TYPE tt_strings.

    "Table type (global)
    DATA text2 TYPE string_table.


    "work areas
    DATA number TYPE i VALUE 1234.
    DATA text TYPE string.


*EXAMPLE 1 : APPEND
**********************************************************************

    APPEND 4711      TO numbers.
    APPEND number    TO numbers.
    APPEND 2 * number TO numbers.

out->write( `-------------------------------` ).
out->write( `Example 1: APPEND` ).
out->write( `-------------------------------` ).

out->write( numbers ).

*EXAMPLE 2 : CLEAR
**********************************************************************

    CLEAR numbers.

out->write( `-------------------------------` ).
out->write( `Example 2: CLEAR` ).
out->write( `-------------------------------` ).

out->write( numbers ).

*EXAMPLE 3 : TABLE EXPRESSION
**********************************************************************

    APPEND 4711      TO numbers.
    APPEND number    TO numbers.
    APPEND 2 * number TO numbers.

out->write( `-------------------------------` ).
out->write( `Example 3: TABLE EXPRESSION` ).
out->write( `-------------------------------` ).

number = numbers[ 2 ].

out->write( |CONTENT OF Row 2: { number }| ).
"Direct use of expression in string template
out->write(  |Content of row 1: {  numbers[ 1 ] }| ).

* Example 4: LOOP ... ENDLOOP
**********************************************************************
    out->write(  `---------------------------` ).
    out->write(  `Example 4: LOOP ... ENDLOOP` ).
    out->write(  `---------------------------` ).

    LOOP AT numbers INTO number.

      out->write( |Row: { sy-tabix } Content { number }| ).

    ENDLOOP.

* Example 5: Inline declaration in LOOP ... ENDLOOP
**********************************************************************
    out->write(  `-----------------------------` ).
    out->write(  `Example 5: Inline Declaration` ).
    out->write(  `-----------------------------` ).

    LOOP AT numbers INTO DATA(number_inline).
      out->write( |Row: { sy-tabix } Content { number_inline }| ).
    ENDLOOP.





  ENDMETHOD.
ENDCLASS.
