CLASS zcl_declobjdatestrutu_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DECLOBJDATESTRUTU_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


**********************************************************************
*---------EXAMPLE 1: MOTIVATION FOR STRUCTURED VARIABLES--------------


    DATA connection_full TYPE /dmo/I_connection.

    SELECT SINGLE
        FROM /dmo/I_connection
        FIELDS AirlineID, ConnectionID, DepartureAirport, DestinationAirport, DepartureTime, ArrivalTime, Distance, DIstanceUnit
        WHERE AirlineId = 'LH'
        AND   ConnectionID = '0400'
        INTO  @connection_full.

    out->write( `--------------------------------------------` ).
    out->write( `Example 1: CDS View as Structured TYpe` ).
    out->write( connection_full ).

*---------EXAMPLE 2: GLOBAL STRUCTURED TYPE---------------------------
**********************************************************************

    DATA message TYPE symsg.


    out->write( `--------------------------------------------` ).
    out->write( `Example 2: Global Structured TYpe` ).
    out->write( message ).

*---------EXAMPLE 3: Local STRUCTURED TYPE---------------------------
**********************************************************************

    TYPES: BEGIN OF st_connection,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.


     DATA connection TYPE st_connection.

     SELECT SINGLE
        FROM /dmo/I_connection
        FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
        WHERE AIrlineID = 'LH'
            AND ConnectionID = '0400'
            INTO @connection.

    out->write( `--------------------------------` ).
    out->write(  `Example 3: Local Structured TYpe` ).
    out->write( connection ).

*---------EXAMPLE 4: Nested STRUCTURED TYPE---------------------------
**********************************************************************

    TYPES: BEGIN OF st_nested,
           airport_from_id TYPE /dmo/airport_from_id,
           airport_to_id   TYPE /dmo/airport_to_id,
           message         TYPE symsg,
           carrier_name    TYPE /dmo/carrier_name,
           END OF st_nested.

     DATA connection_nested TYPE st_nested.


     out->write( `--------------------------------` ).
     out->write( `Example 4: Nested Structured Type` ).
     out->write(  connection_nested ).






  ENDMETHOD.
ENDCLASS.
