CLASS zcl_struct_decl_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_struct_decl_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  "Forma1 declaración estructura

  TYPES: BEGIN OF ty_persona,   " ty_persona es el nombre creado para nuestro nuevo typo
         nombre TYPE char40,
         edad TYPE numc3,
         email TYPE /dmo/email_address,
         END OF ty_persona.

       DATA ls_persona TYPE ty_persona.  " declaración de la estructura en si misma.

       ls_persona-nombre = 'Pedro'.
       ls_persona-edad   = 20.
       ls_persona-email  = 'daniel@experis.es'.

       out->write( ls_persona ).

       out->write( |\n| ).

**********************************************************************
       "Forma 2 declrar una estructura

       DATA(ls_persona2) = VALUE ty_persona( nombre = 'Daniel'  edad = 20 email = 'daniel@experis.es' ).

       out->write( ls_persona2 ).

       out->write( |\n| ).

**********************************************************************
       "Forma 3 declrar una estructura

    DATA: BEGIN OF ls_empleado,
          nombre TYPE string VALUE 'Laura',
          id     TYPE i,
          email  TYPE /dmo/email_address,
          END OF ls_empleado.

          out->write( ls_empleado ).

          out->write( |\n| ).

**********************************************************************

" Tipos de tablas:
"1-TABLAS INTERNAS ( en memoria) Se usan dentro del codigo ABAP !SOLO EXISTEN EN TIEMPO DE EJECUCION¡
"y las creamos nosotros, no estan en la base de datos.  se declaran como lt_xxxx
"2-TABLAS DE BASE DE DATOS(persistentes) o tablas transparentes o externas.
"se crean en el diccionario ABAP (.ddls, .ddic ) y alamacenan datos reales.
"3-CDS table (o Entity) es una vista avanzada que se define con el lenguaje DDL, en Eclipse, sobre una o varias tablas
"exsitentes.

**********************************************************************
"  ESTRUCTURAS TIPOS:

"    ESTRUCTURA SIMPLE:

     DATA: BEGIN OF ls_employee,
           name   TYPE string VALUE 'Laura',
           id     TYPE i,
           email  TYPE /dmo/email_address,
           END OF ls_employee.


           out->write(  ls_employee ).

           out->write( |\n| ).

    " ESTRUCTURA ANIDADA:

    DATA: BEGIN OF ls_emplo_info,

          BEGIN OF info,
          id         TYPE i      VALUE 1234,
          name       TYPE string VALUE 'Peter',
          surname    TYPE string VALUE 'Elvira',
          END OF info,

          BEGIN OF address,
          city       TYPE string VALUE 'Madrid',
          street     TYPE string VALUE 'Morfeo',
          country    TYPE string VALUE 'Spain',
          END OF address,

          BEGIN OF position,
          department TYPE string VALUE 'IT',
          salary     TYPE p DECIMALS 2 VALUE '2000.20',
          END OF position,

       END OF LS_EMPLO_INFO.

       out->write( ls_emplo_info ).

        out->write( |\n| ).

       out->write( ls_emplo_info-address-street ).

       out->write( |\n| ).

       out->write( ls_emplo_info-info-name ).

       out->write( |\n| ).

       out->write( data = ls_emplo_info name = 'Employee information' ).

          out->write( |\n| ).


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " ESTRUCTURA PROFUNDA:

      TYPES: BEGIN OF ty_flights,
             flight_date   TYPE /dmo/flight-flight_date,
             price         TYPE /dmo/flight-price,
             currency_code TYPE /dmo/flight-currency_code,
             END OF ty_flights.

      DATA: BEGIN OF ls_flight_info,
            carrier        TYPE /dmo/flight-carrier_id VALUE 'AA',
            connId         TYPE /dmo/flight-connection_id VALUE '0018',
            lt_flights     TYPE TABLE OF ty_flights WITH EMPTY KEY,
            END OF LS_FLIGHT_INFO.

            out->write( ls_flight_info ).  " esto pinta:
                                             "CARRIER    CONNID    LT_FLIGHTS
                                            " AA         0018      FLIGHT_DATE    PRICE      CURRENCY_CODE

            SELECT *
            FROM /dmo/flight
            WHERE carrier_id = 'AA'
            INTO CORRESPONDING FIELDS OF TABLE @ls_flight_info-lt_flights.

             out->write( |\n| ).
             out->write( data = ls_flight_info name = 'ls_flight_info' ).
             out->write( |\n| ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
       "  AÑADIR DATOS A LAS ESTRUCTURAS


           TYPES: BEGIN OF ty_flights2,
                  flight_date     TYPE /dmo/flight-flight_date,
                  price           TYPE /dmo/flight-price,
                  currency_code   TYPE /dmo/flight-currency_code,
                  END OF TY_FLIGHTS2.

            DATA: BEGIN OF ls_flight_info2,
                  carrier         TYPE /dmo/flight-carrier_id VALUE 'AA',
                  connId          TYPE /dmo/flight-connection_id,
                  ls_flights      TYPE ty_flights,
                  END OF LS_FLIGHT_INFO2.

            out->write( ls_flight_info2 ).

            out->write( |\n| ).

            ls_flight_info2-carrier = 'XX'.
            ls_flight_info2-connid  = '0022'.
            ls_flight_info2-ls_flights-flight_date = cl_abap_context_info=>get_system_date( ).
            ls_flight_info2-ls_flights-currency_code = 'USD'.
            ls_flight_info2-ls_flights-price = '200'.

            out->write( data = ls_flight_info2 name = 'ls_flight_info2' ).
             out->write( |\n| ).

 "" para las estructuras anidadas:

            DATA: BEGIN OF ls_empl_info2,

                  BEGIN OF info,
                  id       TYPE i VALUE 1234,
                  name     TYPE string VALUE 'Peter',
                  surname  TYPE string VALUE 'Lord',
                  END OF info,

                  BEGIN OF address,
                  city     TYPE string VALUE 'London',
                  street   TYPE string VALUE 'ELmet street',
                  country  TYPE string VALUE 'UK',
                  END OF ADDRESS,

                  BEGIN OF position,
                  department TYPE string VALUE 'IT',
                  salary     TYPE p DECIMALS 2 VALUE '2000.20',
                  END OF POSITION,

            END OF LS_EMPL_INFO2.

             ls_empl_info2 = VALUE #(
                                     info = value #( id = 1234 name = 'John' surname = 'Mars' )
                                     address = VALUE #(  street = 'Ranger street' city = 'Milton Kings' country = 'United Kingdom' )
                                     position = VALUE #( department = 'finance' salary = '2000.00' )
                                      ).
            out->write( data = ls_empl_info2 name = 'ls_empl_info2' ).
             out->write( |\n| ).

      "INTRIDUCIR DATOS EN ESTRUCTURAS PROFUNDAS:

      TYPES: BEGIN OF ty_flights3,
             flight_date    TYPE  /dmo/flight-flight_date,
             price          TYPE  /dmo/flight-price,
             currency_code  TYPE  /dmo/flight-currency_code,
             END OF ty_flights3.

      DATA: BEGIN OF ls_flight_info3,
            carrier     TYPE  /dmo/flight-carrier_id VALUE 'AA',
            connId      TYPE  /dmo/flight-connection_id VALUE '0018',
            ls_flights TYPE ty_flights3,
            END OF LS_FLIGHT_INFO3.


            ls_flight_info3 = VALUE #(
                                      carrier = 'SP'
                                      connId  = '0035'
                                      ls_flights = VALUE #(
                                                           flight_date   = '20250731'
                                                           currency_code = 'EUR'
                                                           price         = '200'  )
                                      ).
            out->write(  data = ls_flight_info3 name = 'ls_flight_info3' ).













  ENDMETHOD.
ENDCLASS.
