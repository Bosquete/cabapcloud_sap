*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connect2 DEFINITION.

PUBLIC SECTION.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    "DATA r_output TYPE STRING_TABLE.

    CLASS-DATA conn_counter TYPE i READ-ONLY.

*    METHODS set_attributes
*    IMPORTING
*        i_carrier_id TYPE /dmo/carrier_id
*        i_connection_id TYPE /dmo/connection_id
*        RAISING
*            cx_abap_invalid_value.



    METHODS get_attributes
    EXPORTING

        e_carrier_id TYPE /dmo/carrier_id
        e_connection_id TYPE /dmo/connection_id.

    METHODS constructor
      IMPORTING
        i_carrier_id TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id
        RAISING
            cx_abap_invalid_value.

    METHODS get_output
        RETURNING
        VALUE(r_output)  TYPE STRING_TABLE.


PROTECTED SECTION.
PRIVATE SECTION.



ENDCLASS.
CLASS lcl_connect2 IMPLEMENTATION.

  METHOD constructor.
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
        RAISE EXCEPTION TYPE cx_abap_invalid_value.
        ENDIF.
    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.

    conn_counter += 1.

  ENDMETHOD.


  METHOD get_attributes.

    me->carrier_id = carrier_id.
    me->connection_id = connection_id.

  ENDMETHOD.

*  METHOD set_attributes.
*
*        IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
*        RAISE EXCEPTION TYPE cx_abap_invalid_value.
*        ENDIF.
*
*        carrier_id    =    i_carrier_id.
*        connection_id = i_connection_id.
*
*  ENDMETHOD.

  METHOD get_output.

    APPEND |------------------------------------------| TO r_output.
    APPEND |Carrier:                   {  carrier_id }| TO r_output.
    APPEND |Connection:             {  connection_id }| TO r_output.

  ENDMETHOD.

ENDCLASS.
