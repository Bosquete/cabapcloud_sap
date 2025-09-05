CLASS zcl_estruc_dec_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_estruc_dec_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************

    "         DECLARRACIÓN ESTRUCTURAS

    " FORMA 1:

    TYPES: BEGIN OF ty_persona,
             nombre TYPE string,
             edad   TYPE i,
             email  TYPE /dmo/email_address,
           END OF ty_persona.

    DATA ls_persona TYPE ty_persona.

    ls_persona-nombre = 'Pedro'.
    ls_persona-edad = 20.
    ls_persona-email = 'pedro@gmail.com'.

    out->write( ls_persona ).

    out->write( |\n| ).

    "forma 2 declaracion de una estructura


    DATA(ls_persona2) = VALUE ty_persona( nombre = 'Daniel' edad = 20 email = 'pedro@gmail.com' ).



    out->write( ls_persona2 ).



    "forma 3 declaracion de una estructura y tipo DE GOLPE.


    DATA: BEGIN OF ls_empleado,
            nombre TYPE string VALUE 'Laura',
            id     TYPE i,
            email  TYPE  /dmo/email_address,
          END OF ls_empleado.


    out->write( |\n| ).
    out->write( ls_empleado ).


    "ESTRUCUTRAS ANIDADAS

    "TIPOS DE ESTRUCTURAS

    "estructura simple
    DATA: BEGIN OF ls_empleado2,
            nombre TYPE string VALUE 'Laura',
            id     TYPE i,
            email  TYPE  /dmo/email_address,
          END OF ls_empleado2.


    "estructura anidada

    DATA:BEGIN OF ls_empl_info,

           BEGIN OF info,
             id       TYPE i VALUE 1234,
             nombre   TYPE string VALUE 'Pedro',
             apellido TYPE string VALUE  'Gómez',
           END OF info,

           BEGIN OF direccion,
             ciudad TYPE string VALUE 'Madrid',
             calle  TYPE string VALUE 'c/ peña',
             pais   TYPE string VALUE  'España',
           END OF direccion,

           BEGIN OF puesto,
             departamento TYPE string VALUE 'IT',
             sueldo       TYPE p DECIMALS 2 VALUE '2000.20',

           END OF puesto,

         END OF ls_empl_info.

    out->write( ls_empl_info ).    " para imprimir todo el contenido de la estructura
    out->write( ls_empl_info-direccion-calle ).  " para imprimir un unico campo de la estructura
    out->write( data = ls_empl_info name = 'informacion de empleado' ). " para imprimir toda la estructura con un mensaje inform

    "estructura profunda.

    TYPES: BEGIN OF ty_flights,
             flight_date   TYPE /dmo/flight-flight_date,
             price         TYPE /dmo/flight-price,
             currency_code TYPE /dmo/flight-currency_code,
           END OF ty_flights.


    DATA: BEGIN OF ls_flight_info,
            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
            connid     TYPE /dmo/flight-connection_id VALUE '0018',
            lt_flights TYPE TABLE OF ty_flights WITH EMPTY KEY , " hace referencia tanto al tipo creado en el types "ty_flights como a la tabla de base de datos

          END OF ls_flight_info.

    SELECT *
FROM /dmo/flight
WHERE carrier_id = 'AA'
INTO CORRESPONDING FIELDS OF TABLE @ls_flight_info-lt_flights.


    out->write( data = ls_flight_info name = 'ls_flight_info' ).




  ENDMETHOD.
ENDCLASS.
