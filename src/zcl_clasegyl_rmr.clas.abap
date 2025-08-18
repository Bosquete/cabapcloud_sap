CLASS zcl_clasegyl_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CLASEGYL_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main."

    " Para abordar un atributo estático fuera de clase, 1º nombre clase + selector componente estático (=>) y + nombre atributo
    " para acceder a un componente de instancia necesita variable de referencia. Es un tipo especial de variable que se utiliza para crear, direccionar y administrar un obnjeto.
    "se utiliza para señalar l ainstancia de una clase en la memeoria dle programa
    " se declara con DATA TYPE REF TO seguida del nombre de la clase.
    " para crear una nueva instancia de una clase se utiliza el operador NEW
    " para abordar un atributo de instancia fuera de clase, 1º escriba la variable de referencia,
    "luego el seelector de componente de instancia (->) y luego el nombre del atributo

*        DATA: connection TYPE REF TO lcl_connection,
*                connection2 TYPE REF TO lcl_connection.
*           DATA connection2 TYPE TABLE OF REF TO lcl_connection.
*        connection = NEW #(  ).
*        connection->carrier_id = 'LH'.
*        connection->connection_id = '0400'.
*        connection2 = connection.

*        APPEND connection TO connection2.
* Second Instance
**********************************************************************
*    connection = NEW #(  ).
*
*    connection->carrier_id    = 'AA'.
*    connection->connection_id = '0017'.
*
*    APPEND connection TO connections.

* Third Instance
**********************************************************************
*
*    connection = NEW #(  ).
*
*    connection->carrier_id    = 'SQ'.
*    connection->connection_id = '0001'.
*
*    APPEND connection TO connections.

    " una forma de mantener vivos los objetos es colocar las referencias en una taba interna.
    "Permite utilizar una única variable de referencia para crear muchos objetos.
    " Aunque la variable de eferencia se sobreescribe con la dirección del siguiente objeto, los objetos existentes
    "son seguros porque la tabla interna contiene una referencia a ellos.
    " por lo tanto, nunca leimines la "última" referencia a los objetos.

*    DATA connection TYPE REF TO lcl_connection.
*    DATA connections TYPE TABLE OF REF TO lcl_connection.
*        connection = nEW #(  ).
*        APPEND connection TO connections.
*        connection = NEW #(  ).
*        APPEND connection TO connections.

    "DATA connections TYPE TABLE OF REF TO lcl_connection.

**********************************************************************


    "METHOD if_oo_adt_classrun~main.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

* First Instance
**********************************************************************
    connection = NEW #(  ).
    TRY.
        connection->set_attributes(
            EXPORTING
                i_carrier_id = 'LH'
                i_connection_id = '0400' ).

        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( `Method call Failed` ).
    ENDTRY.

* Second instance
**********************************************************************
    connection = NEW #(  ).
    TRY.
        connection->set_attributes(
        EXPORTING
            i_carrier_id = 'AA'
            i_connection_id = '0017' ).

        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

*        LOOP AT connections INTO connection.
*
*                connection->get_attributes(
*                IMPORTING
*                e_carrier_id = carrier_id
*                e_connection_id = connection_id ).
*
*            out->write(  |Flight Connection {  carrier_id } { connection_id } | ).
*         ENDLOOP.
* Third instance
**********************************************************************
    connection = NEW #( ).
    TRY.
        connection->set_attributes(
        EXPORTING
        i_carrier_id = 'SQ'
        i_connection_id = '0001'
        ).
* connection->carrier_id = 'SQ'.
* connection->connection_id = '0001'.
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.
* Output
**********************************************************************
    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
