*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION.
*  Para abordar un atributo estático fuera de clase, 1º nombre clase + selector componente estático (=>) y + nombre atributo
*  para acceder a un componente de instancia necesita variable de referencia. Es un tipo especial de variable que se utiliza para crear, direccionar y administrar un obnjeto.
*  se utiliza para señalar l ainstancia de una clase en la memeoria dle programa
*  se declara con DATA TYPE REF TO seguida del nombre de la clase.
*  para crear una nueva instancia de una clase se utiliza el operador NEW
*  para abordar un atributo de instancia fuera de clase, 1º escriba la variable de referencia,
*  luego el seelector de componente de instancia (->) y luego el nombre del atributo

  PUBLIC SECTION.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.


    CLASS-DATA conn_counter TYPE i.

*    TRY.
*    METHODS->set_attributes(
*    EXPORTING
*        i_carrier_id = 'LH'
*        i_connection_id = '0400'
*        ).
*           connection->carrier_id = 'LH'.
*           connection->connection_id = '0400'.
*        Append connection TO connections.
*
*        CATCH cx_abap_invalid_value.
*        out->write( `Method call failed` ).
*
*        ENDTRY.
       METHODS set_attributes
       IMPORTING
      i_carrier_id TYPE /dmo/carrier_id
      i_connection_id TYPE /dmo/connection_id
        RAISING
        cx_abap_invalid_value.


*    METHODS get_attributes
*    EXPORTING
*    i_carrier_id TYPE /dmo/carrier_id OPTIONAL
*    i_connection_id TYPE /dmo/connection_id.

*      e_carrier_id TYPE /dmo/carrier_id
*      e_connection_id TYPE /dmo/connection_id.

        METHODS get_output
            RETURNING
            VALUE(r_output) TYPE string_table.


  PROTECTED SECTION.
  PRIVATE SECTION.



ENDCLASS.



CLASS lcl_connection IMPLEMENTATION.



*  METHOD get_attributes.
*        e_carrier_id = carrier_id.
*      e_connection_id = connection_id.
*  ENDMETHOD.

*  METHOD set_attributes_me.
*    me->carrier_id = carrier_id.
*    me->connection_id = connection_id.
*  ENDMETHOD.

  METHOD get_output.

        APPEND |------------------------------| TO r_output.
        APPEND |Carrier:     { carrier_id    }| TO r_output.
        APPEND |Connection:  { connection_id }| TO r_output.
    ENDMETHOD.

  METHOD set_attributes.
          IF carrier_id IS INITIAL OR connection_id IS INITIAL.
        RAISE EXCEPTION TYPE cx_abap_invalid_value.
      ENDIF.
      carrier_id = i_carrier_id.
      connection_id = i_connection_id.
  ENDMETHOD.






ENDCLASS.
