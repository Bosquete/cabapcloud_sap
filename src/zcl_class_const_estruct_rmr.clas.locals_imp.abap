*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connect definition.


PUBLIC SECTION.





CLASS-DATA conn_counter TYPE i READ-ONLY.

METHODS constructor
  IMPORTING
    i_carrier_id TYPE /dmo/carrier_id
    i_connection_id TYPE /dmo/connection_id
    RAISING
        cx_ABAP_INVALID_VALUE.
*METHODS set_attributes
*    IMPORTING
*        i_carrier_id TYPE /dmo/carrier_id
*        i_connection_id TYPE /dmo/connection_id
*    RAISING
*        cx_abap_invalid_value.

METHODS get_output
    RETURNING VALUE(r_output) TYPE string_table.

PROTECTED SECTION.
PRIVATE SECTION.

TYPES:
BEGIN OF st_details,
DepartureAirport TYPE /dmo/airport_from_id,
DestinationAirport TYPE /dmo/airport_to_id,
AirlineName TYPE /dmo/carrier_name,
END OF st_details.

  DATA airport_from_id TYPE /dmo/airport_from_id.
  DATA airport_to_id TYPE /dmo/airport_to_id.
  DATA carrier_name TYPE /dmo/carrier_name.
  DATA details TYPE st_details.

ENDCLASS.

CLASS lcl_connect IMPLEMENTATION.

  METHOD constructor.

  SELECT SINGLE
FROM /DMO/I_Connection
FIELDS DepartureAirport, DestinationAirport, \_Airline-Name as
AirlineName
WHERE AirlineID = @i_carrier_id
AND ConnectionID = @i_connection_id
INTO CORRESPONDING FIELDS OF @details.

*    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
*                RAISE EXCEPTION TYPE cx_abap_invalid_value.
*    ENDIF.

*    me->carrier_id = i_carrier_id.
*    me->connection_id = i_connection_id.

    conn_counter = conn_counter + 1.

  ENDMETHOD.


  METHOD get_output.

    APPEND |-------------------------------------------------| TO r_output.
    APPEND |Carrier:                       { carrier_name }  | TO r_output.
    APPEND |Departure:                    { airport_from_id }| TO r_output.
    APPEND |Destination:                    { airport_to_id }| TO r_output.


  ENDMETHOD.

*  METHOD set_attributes.
*
*        IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
*                RAISE EXCEPTION TYPE cx_abap_invalid_value.
*        ENDIF.
*
*        carrier_id = i_carrier_id.
*        connection_id = i_connection_id.
*
*  ENDMETHOD.

ENDCLASS.
