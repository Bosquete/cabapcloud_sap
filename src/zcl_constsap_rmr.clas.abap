CLASS zcl_constsap_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_constsap_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* EXAMPLE 1: LOCAL TYPES
* ******************************************************************************

* COMMENT/UNCOMMENT THE FOLLOWING LINES TO CHANGE THE TYPE OF MY_VAR

    TYPES my_type TYPE p LENGTH 3 DECIMALS 2.
* TYPES my_type TYPE i.
* TYPES my_type TYPE string.
* TYPES my_type TYPE n length 10.

* Variable based on local type.
    DATA my_variable TYPE my_type.

    out->write(  `my_variable (TYPE MY_TYPE)` ).
    out->write(  my_variable ).

* Example 2: Global Types
* *******************************************************************************


* Variable based on global type.

    "Place cursor on variable and press F2 or F3
    DATA airport TYPE /dmo/airport_id VALUE 'FRA'.

    out->write( `airport ( TYPE /DMO/AIRPORT_ID )` ).
    out->write( airport ).


*EXAMPLE 3: CONSTANTS
* ********************************************************************************

    CONSTANTS c_text TYPE string VALUE `Hello World`.
    CONSTANTS c_number TYPE i    VALUE 12345.

    "Uncomment thi sline to see syntax error (Value is mandatory)

* constants c_text2 type string.

    out->write(  `c_text (TYPE STRING)` ).
    out->write( c_text ).
    out->write( '---------' ).

    out->write( `c_number (TYPE I)` ).
    out->write( c_text ).
    out->write( `--------` ).

* Example 4: Literals
* **********************************************************************************


    out->write( '12345                    ' ). "Text Literal (TYPE C)
    out->write( `12345                    ` ). "String Literal (Type STRING)
    out->write( 12345                       ). "NUmber Literal (Type I)



    "Uncomment this libe to see sybtax error (no number literal with digits)

*   out->write( 12345.76 ):








  ENDMETHOD.
ENDCLASS.
