CLASS zcl_table_flight_changes_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_table_flight_changes_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



   TYPES: BEGIN OF ty_flights,
           idUser     TYPE c LENGTH 40,
           airCode    TYPE /dmo/carrier_id,
           flightNum  TYPE /dmo/connection_id,
           key        TYPE land1,
           seat       TYPE /dmo/plane_seats_occupied,
           flightDate TYPE /dmo/flight_date,
    END OF ty_flights.

    "out->write(  data = ty_flights name = 'ty_flights' ).

    DATA: lt_flights      TYPE TABLE OF ty_flights,
          lt_flights_info TYPE TABLE OF ty_flights.


           lt_flights = VALUE #( for i      = 1 WHILE i <= 15
                               ( idUser     = |{ 1234 + i }- USER |
                                 airCode    = 'SQ'
                                 flightNum  = 0000 + i
                                 key        = 'US'
                                 seat       = 0 + i
                                 flightDate = cl_abap_context_info=>get_system_date( ) ) ).



                      out->write( |\n| ).
                   out->write(  data = lt_flights name = 'lt_flights' ).


      out->write( |\n| ).


     CLEAR lt_flights_info.

     lt_flights_info[] = lt_flights[].

     out->write( lt_flights_info ).

            APPEND VALUE #(

                    airCode   = 'CL'
                    flightNum = 0010
                    key       = 'COP'

             ) to lt_flights_info.

             out->write( data = lt_flights_info name = 'lt_flights_info' ).






  ENDMETHOD.
ENDCLASS.
