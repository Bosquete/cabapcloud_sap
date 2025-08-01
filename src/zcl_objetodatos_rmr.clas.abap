CLASS zcl_objetodatos_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_objetodatos_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* EXAMPLE 1: Local Types
**********************************************************************

* Comment/uncomment the following lines to change the type of my_var

*            TYPES my_type TYPE p LENGTH 3 DECIMALS 2.
*            TYPES my_type TYPE i.
*            TYPES my_type TYPE string.
*            TYPES my_type TYPE n length 10.

*   Variable based on local type

*        DATA my_variable TYPE my_type.
*
*        out->write(  `my_variable (TYPE MY_TYPE)` ).
*        out->write( my_variable ).

**********************************************************************

* Variable based on global type.
        "Place cursor on variable and press F2 or F3
        DATA airport TYPE /dmo/airport_id VALUE 'FRA'.

        out->write( `airport (TYPE /DMO/AIRPORT_ID )` ).
        out->write(  airport ).

**********************************************************************

* example 3: COnstants
**********************************************************************

        CONSTANTS c_text TYPE string VALUE `HEllo World`.
        CONSTANTS c_number TYPE i    VALUE 12345.



        "Uncomment this line to see sybtax error (VAUE is mandatory)
*       constants c_text2 type string.


        out->write(  `c_text (TYPE STRING)` ).
        out->write( c_text ).
        out->write( `---------` ).

        out->write(  `c_number (TYPE STRING)` ).
        out->write( c_number ).
        out->write( `---------` ).

**********************************************************************
*  EXAMPLE 4: LITERALS

        out->write( '12345              ' ).    "Text Literal (type c)
        out->write( `12345              ` ).    " String Literal (Type STRING)
        out->write(  12345                ).    " Number LITeral (TYPE I)

        "uncomment this line to see syntax error ( no number literal with digits)
*       out->write(  12345.67  ).





  ENDMETHOD.
ENDCLASS.
