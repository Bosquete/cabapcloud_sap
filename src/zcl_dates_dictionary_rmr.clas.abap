CLASS zcl_dates_dictionary_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dates_dictionary_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA lv_name TYPE ZDE_NAME_RMR.
  DATA ls_employee TYPE zst_employers_rmr.

  lv_name = 'danieldanieldaniel'.  " si te pasas de la cantidad de caracteres te da una advertencia
  out->write( lv_name ).

    ls_employee-employee_id = '0001'.
    ls_employee-name        = lv_name.

     out->write( ls_employee         ).
      out->write( ls_employee-name        ).


  ENDMETHOD.
ENDCLASS.
