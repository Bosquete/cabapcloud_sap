CLASS zcl_functions_rmr DEFINITION
         " Definición de la clase
  PUBLIC                                      " Visibilidad pública (usable desde cualquier paquete)
  FINAL                                       " No permite herencia
  CREATE PUBLIC.                              " Creadora pública (instanciable desde fuera)

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.            " Interfaz para ejecutar la clase desde ADT (método MAIN)
    METHODS constructor.                       " Carga de datos e inicializaciones
    METHODS standard.                          " Lectura por clave en tabla STANDARD
    METHODS sort.                              " Lectura por clave en tabla SORTED
    METHODS hash.                              " Lectura por clave en tabla HASHED

  PROTECTED SECTION.                           " (No se usa en este ejemplo)

  PRIVATE SECTION.                             " Atributos y ayudas internas

    DATA: lt_standard TYPE STANDARD TABLE OF /dmo/booking_m
                  WITH NON-UNIQUE KEY travel_id booking_id booking_date,   " Itab estándar con clave no única
          lt_sort     TYPE SORTED   TABLE OF /dmo/booking_m
                  WITH NON-UNIQUE KEY travel_id booking_id booking_date,   " Itab ordenada por la clave indicada
          lt_hash     TYPE HASHED   TABLE OF /dmo/booking_m
                  WITH UNIQUE      KEY travel_id booking_id booking_date.  " Itab hash con clave única

    DATA: key_travel_id  TYPE /dmo/travel_id,   " Clave elegida: travel_id
          key_booking_id TYPE /dmo/booking_id,  " Clave elegida: booking_id
          key_date       TYPE /dmo/booking_date. " Clave elegida: booking_date

    METHODS set_line_to_read.                  " Calcula y guarda en los atributos una línea “objetivo”
ENDCLASS.



CLASS zcl_functions_rmr IMPLEMENTATION.

  METHOD constructor.                                                        " Constructor de la clase
    SELECT FROM /dmo/booking_m                                               " Lee la tabla de reservas demo
           FIELDS *                                                          " Todas las columnas
           INTO TABLE @lt_standard.                                          " Carga la itab STANDARD

    SELECT FROM /dmo/booking_m                                               " Segunda lectura (mismo origen)
           FIELDS *                                                          " Idéntico dataset
           INTO TABLE @lt_sort.                                              " Carga la itab SORTED (se ordenará por su key)

    SELECT FROM /dmo/booking_m                                               " Tercera lectura (mismo origen)
           FIELDS *                                                          " Idéntico dataset
           INTO TABLE @lt_hash.                                              " Carga la itab HASHED (se indexará por su key)

    set_line_to_read( ).                                                     " Calcula una línea “de referencia” y guarda su clave en atributos
  ENDMETHOD.

  METHOD standard.                                                            " Lectura en tabla STANDARD por expresión de tabla
    DATA(result) = lt_standard[                                              " Lee la línea cuyo conjunto de claves coincide con…
                       travel_id    = me->key_travel_id                      " travel_id almacenado en los atributos
                       booking_id   = me->key_booking_id                     " booking_id almacenado
                       booking_date = me->key_date ].                        " booking_date almacenado
  ENDMETHOD.

  METHOD set_line_to_read.                                                    " Obtiene una línea “objetivo” y guarda sus claves
    DATA(lv_data) = lt_standard[ CONV i( lines( lt_standard ) * '0.65' ) ].  " Toma aprox. la fila del 65% (convierte a entero)
    me->key_travel_id  = lv_data-travel_id.                                  " Guarda travel_id de esa fila
    me->key_booking_id = lv_data-booking_id.                                 " Guarda booking_id
    me->key_date       = lv_data-booking_date.                               " Guarda booking_date
  ENDMETHOD.

  METHOD hash.                                                                " Lectura en tabla HASHED (acceso promedio O(1))
    DATA(result) = lt_hash[                                                  " Expresión de tabla: busca por clave primaria
                       travel_id    = me->key_travel_id                      " travel_id desde atributos
                       booking_id   = me->key_booking_id                     " booking_id desde atributos
                       booking_date = me->key_date ].                        " booking_date desde atributos
  ENDMETHOD.

  METHOD sort.                                                                " Lectura en tabla SORTED (búsqueda binaria O(log n))
    DATA(result) = lt_sort[                                                  " Expresión de tabla: coincide con la clave primaria
                       travel_id    = me->key_travel_id
                       booking_id   = me->key_booking_id
                       booking_date = me->key_date ].
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

                                         " Punto de entrada ejecutable en ADT
    DATA(lo_flights) = NEW zcl_functions_rmr( ).                           " Instancia la clase (ejecuta constructor)

    lo_flights->standard( ).                                                 " Prueba lectura en STANDARD
    lo_flights->sort( ).                                                     " Prueba lectura en SORTED
    lo_flights->hash( ).                                                     " Prueba lectura en HASHED

    " out->write( me->key_travel_id ).                                         " Muestra travel_id almacenado
    "out->write( me->key_booking_id ).                                        " Muestra booking_id almacenado
    "out->write( me->key_date ).                                              " Muestra booking_date almacenado




  ENDMETHOD.
ENDCLASS.
