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


*      define structure zst_nested_struct_rmr {
*
*  employer_id : abap.numc(5);
*  first_name  : /dmo/first_name;
*  last_name   : /dmo/last_name;
*  start_date  : zde_date_struc_rmr;
*  category    : zde_category_struct_rmr;
*  include zst_employers_rmr;
*
*
*}
*      address     : INCLUDE zst_employers_rmr;


DATA ls_anidada TYPE zst_nested_struct_rmr.
out->write(  ls_anidada ).

**********************************************************************

" subestructura (plana)
TYPES: BEGIN OF ty_addr,
       steet TYPE c LENGTH 30,
       city TYPE c LENGTH 20,
       END OF TY_ADDR.


       "estructura anidada: contiene ty_addr como un campo
       TYPES: BEGIN OF ty_employee_nested,
              id TYPE c LENGTH 20,
              addr TYPE ty_addr, "subestructura anidada sería igual que decir prueba: include zst_empleados_der.
              "include ty_addr, ESTA FORMA NO DEJA

              end of ty_employee_nested.

**********************************************************************
     "  ESTRUCTURA PROFUNDA
     "producto simple para la tabla interna
     TYPES: BEGIN OF ty_order_item,
            product TYPE c LENGTH 10,
            truck TYPE i,
            END OF TY_ORDER_ITEM.


            "esrtuctura profunda: tiene tipos dinámicos (string, tablas, referencias)
            TYPES: BEGIN OF ty_customer_deep,
                   id TYPE i,
                   name TYPE string, " profunda
                   addr TYPE ty_addr, "anidada (plana)
                   orders TYPE STANDARD TABLE OF ty_order_item  WITH EMPTY KEY, "profunda (tabla interna)
                   refaddr TYPE REF TO ty_addr, "profunda (esta haciendo una referncia)
                   END OF TY_CUSTOMER_DEEP.


                   DATA ls_cust TYPE ty_customer_deep.
                   free ls_cust-orders.

                   out->write( ls_cust ).


**********************************************************************

" creamso una tabla interna



      DATA: lt_tabla_dic_datos TYPE ZTT_TYPE_TABLE_RMR,
            ls_structure_dic_datos TYPE zst_employee_2_rmr.

            ls_structure_dic_datos-category = |00001|.
            ls_structure_dic_datos-employee_id = 's'.
            ls_structure_dic_datos-fisrt_name = 'Daniel'.
            ls_structure_dic_datos-last_name = 'López'.
            ls_structure_dic_datos-start_date = sy-datum.

            out->write( ls_structure_dic_datos ).

            APPEND ls_structure_dic_datos To lt_tabla_dic_datos.













  ENDMETHOD.
ENDCLASS.
