CLASS zcl_impl_meth_manufa_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_impl_meth_manufa_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


data connection type ref to lcl_connection.


* Debug the method to show that the class returns objects, but that there are different
* objects for the same combination of airline and flight number


connection = lcl_connection=>get_connection( airlineid = 'LH' connectionnumber = '0400' ).


connection = lcl_connection=>get_connection( airlineid = 'LH' connectionnumber = '0400' ).




  ENDMETHOD.
ENDCLASS.
