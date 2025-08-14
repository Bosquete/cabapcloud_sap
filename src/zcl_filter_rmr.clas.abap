CLASS zcl_filter_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_filter_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    " Filter: es una expresión de ABAp que crea una nueva tabla interna filtrando los registros según unas condiciones.
    "Las condiciones pueden basarse en valores individuales o en una tabla de RANGOs, la tabla interna en la que s eutiliza el
    "operador filter debe tener al menos una clave ordenada o una clave hash utilizada para le acceso.

  DATA: lt_flights_all   TYPE TABLE OF        /dmo/flight,
        lt_flights_final TYPE TABLE OF        /dmo/flight,
        lt_filter        TYPE SORTED TABLE OF /dmo/flight-carrier_id
                         WITH UNIQUE KEY      TABLE_LINE.

*                         SELECT from /dmo/flight
*                            FIELDS *
*                            INTO TABLE @lt_flights_all.

         lt_filter = VALUE #( ( 'LH ' ) ( 'AA ' ) ( 'UA ' ) ).

         lt_flights_final = FILTER #( lt_flights_all IN lt_filter WHERE carrier_id = TABLE_LINE ).

         out->write(  name = 'lt_flights_all' data = lt_flights_all ).

         out->write( name = 'lt_flights_final (solo LH, AA, UA)' data = lt_flights_final ).




  ENDMETHOD.
ENDCLASS.
