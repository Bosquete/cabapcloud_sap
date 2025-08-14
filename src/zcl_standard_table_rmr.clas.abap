CLASS zcl_standard_table_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_standard_table_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA lt_aeropuerto TYPE STANDARD TABLE OF /dmo/airport.


    INSERT VALUE #(
                  client     = 100
                  airport_id = 'FRA'
                  name       = 'Frankfurt Airport'
                  city       = 'Frankfurt/Main'
                  country    = 'DE'
                  )
    INTO TABLE lt_aeropuerto.

    INSERT VALUE #(
                   client     = 100
                   airport_id = 'FRA'
                   name       = 'Frankfurt Airport'
                   city       = 'Frankfurt/Main'
                   country    = 'PP'
                 )
    INTO TABLE lt_aeropuerto.

    INSERT VALUE #(
                   client = 100
                   airport_id = 'FRA'
                   name = 'Frankfurt airport'
                   city = 'Frankfurt/Main'
                   country = 'EE'
                    )
    INTO lt_aeropuerto INDEX 2. " con INDEX le indicamos la posición en donde queremos introducir esta fila.

    out->write( lt_aeropuerto ).

    " para crear un registro con una línea en blnaco
    " INSERT INITIAL LINE INTO TABLE lt_aeropuerto

    "PAra igualar ddos tablas internas usamos LIKE

    " DATA lt_aeropuerto2 LIKE lt_aeropuerto.

    " DUPLICAR CONTENIDO

     "INSERT LINES OF lt_aeropuerto INTO TABLE lt_aeropuerto2  " duplica todo el contenido de la tabla original

     "INSERT LINES OF lt_aeropuerto TO 2 INTO TABLE lt_aeropuerto2. " COpia el contenido de las líneas d ela tabla original hasta la línea 2

     " INSERT LINES OF lt_aeropuerto FROM 2 TO 3 INTO TABLE lt_aeropuerto2.  " COPia el contenido de las líneas de la tabla original hasta la línea 2


  ENDMETHOD.
ENDCLASS.
