CLASS zcl_plantcadena_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_plantcadena_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* FORMAT OPTION DATE

*  DATA the_date TYPE d VALUE '20250726'.

*  out->write(  |{  the_date }| ).
*    out->write(  |{  the_date  DATE = ISO }| ).
*    out->write(  |{  the_date DATE = USER }| ).

* FORMAT OPTIONS FOR NUMBERS

*DATA my_number TYPE p LENGTH 3 DECIMALS 2 VALUE '-273.15'.

*  out->write( |{  my_number }| ).
*  out->write( |{  my_number NUMBER = USER          }| ).
*  out->write( |{  my_number SIGN   = RIGHT         }| ).
*  out->write( |{  my_number STYLE  = SCIENTIFIC    }| ).

* DECLARATIONS
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    TYPES t_amount TYPE p LENGTH 8 DECIMALS 2.

    DATA amount TYPE t_amount VALUE '3.30'.
    DATA amount1 TYPE t_amount VALUE '1.20'.
    DATA amount2 TYPE t_amount VALUE '2.10'.

    DATA the_date TYPE d                     VALUE '19891109'.
    DATA my_number TYPE p LENGTH 3 DECIMALS 2 VALUE '-273.15'.

    DATA part1 TYPE string VALUE `Hello`.
    DATA part2 TYPE string VALUE `World`.

*  STRING TEMPLATES
* |-----------------------------------------------------------------------------------------------|
    " COMMENT/UNCOMMENT THE FOLLOWING LINES FOR DIFFERENT EXAMPLES

*   DATA(text) = |Hello World|.
*  DATA(text) = |Total: {  amount } EUR|.
*  DATA(text) = |TOTAL: {  amount1 + amount2 } EUR|.

* FORMAT OPTIONS
************************************************

    "Date

*    DATA(text) = |Raw Date: { the_date               }|.
*    DATA(text) = |ISO Date: { the_date Date = ISO   }|.
*    DATA(text) = |USER Date. { the_date DAte = USER }|.

    "Number

*    DATA(text) = |Raw Number { my_number              }|.
*    DATA(text) = |User Format{ my_number NUMBER = USER }|.
*    DATA(text) = |Sign Right { my_number SIGN = RIGHT  }|.
*    DATA(text) = |Scientific { my_number STYLE = SCIENTIFIC }|.

* STRING EXPRESSION (CONCATENATION OPERATOR)
* |-------------------------------------------------------------------------------------------|

*   DATA(text) = part1 && part2.
*   DATA(text) = part1 && | | && part2.
    DATA(text) = |{ amount1 } + { amount2 } | &&
                   | = | &&
                    |{  amount1 + amount2 }|.



* OUTPUT
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    out->write(  text ).



  ENDMETHOD.
ENDCLASS.
