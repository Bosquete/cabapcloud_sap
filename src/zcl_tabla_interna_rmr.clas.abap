CLASS zcl_tabla_interna_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tabla_interna_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  Una biblioteca quiere guardar información sobre los libros que tiene. Para ello, crea un programa que:
*        1- Defina un tipo de estructura ty_libro con estos campos:
*            * Título (tipo string)
*            * Autor (tipo string)
*            * Número de páginas (tipo i)
*        2- Declare una tabla interna lt_libros y una variable ls_libro de ese tipo.
*        3- Añada tres libros usando INSERT ... INDEX para colocarlos en posiciones concretas.
*        4- Recorra la tabla con un LOOP AT y muestre:
*            * Libro corto: <título>" si tiene menos de 150 páginas
*            * Libro largo: <título>" si tiene más de 500 páginas
*            * Libro estándar: <título>" en otro caso
*        5- Finalmente, muestra toda la tabla con out->write.



  " 1- DEFINIMOS UN TIPO DE ESTRUCTURA PARA GUARDAR LSO DATOS DE LSO LIBROS:

            TYPES: BEGIN OF ty_book,
                   title TYPE string,
                   author TYPE string,
                   pages TYPE i,
            END OF ty_book.

   " 2- Declare an internal table and temporal structure.

            TYPES: ty_table_books TYPE STANDARD TABLE OF ty_book WITH EMPTY KEY.

            DATA: lt_books TYPE ty_table_books,
                  ls_book type ty_book.



        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " viene de la clase de constructor y puntero

        DATA(lo_employee) = NEW zcl_const_news_rmr(  iv_age = 22
                                                                 iv_name = 'Laura'   ).

                                                                 out->write( lo_employee ).









  ENDMETHOD.
ENDCLASS.
