CLASS zcl_total_voc_control_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_total_voc_control_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Desarrollar un programa que cuente el número total de vocales presentes en una cadena de
*texto utilizando estructuras de control básicas y funciones de manipulación de cadenas.
*Teneis que crear un programa que recorra letra por letra una cadena de texto y cuente cuántas vocales contiene.
*Para ello deberás usar un bucle DO, la función to_lower para normalizar las letras, y la sentencia CHECK para
*filtrar solo aquellas que sean vocales.

" Declaramos una cadena de texto.
DATA lv_text TYPE string VALUE 'El perro corre por el prado'.
"inicializamos el contador para las vocales
DATA(lv_cont) = 0.
DATA(lv_cont2) = 0.
"Variable para ir extrayendo letra por letra
DATA lv_letra TYPE c LENGTH 1.

"Bucle se repite tantas veces como letras tenga el texto.
Do strlen( lv_text ) TIMES.

    "extraemos una letra por cada vuelta dle bucle
    lv_letra = lv_text+lv_cont2.
    lv_cont2 += 1.

    "convertimos la letra a minúscula para que A=a, E=e, etc
    lv_letra = to_lower( lv_letra ).

    " usamoe sCHECK para continuar solo si es una vocal
    CHECK lv_letra = 'a' OR lv_letra = 'e' OR lv_letra = 'i' OR lv_letra = 'o' OR lv_letra = 'u'.

    " si ha pasado el CHECK aumentamos el contador

    lv_cont += 1.

    ENDDO.

    out->write( |Número de vocales: {  lv_cont } | ).











  ENDMETHOD.
ENDCLASS.
