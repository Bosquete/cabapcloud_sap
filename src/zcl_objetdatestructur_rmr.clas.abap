CLASS zcl_objetdatestructur_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_OBJETDATESTRUCTUR_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  TYPES: BEGIN OF st_connection,
         airport_from_id TYPE /dmo/airport_from_id,
         airport_to_id   TYPE /dmo/airport_to_id,
         carrier_name    TYPE /dmo/carrier_name,
       END OF st_connection.

  TYPES: BEGIN OF st_connection_nested,
         airport_from_id TYPE /dmo/airport_from_id,
         airport_to_id   TYPE /dmo/airport_to_id,
         message         TYPE symsg,
         carrier_name    TYPE /dmo/carrier_name,
        END OF st_connection_nested.

   DATA connection TYPE st_connection.
   DATA connection_nested TYPE st_connection_nested.


*       EXAMPLE 1: ACCESS TO STRUCTURE COMPONENTS
**********************************************************************


        connection-airport_from_id = 'ABC'.
        connection-airport_to_id   = 'XYZ'.
        connection-carrier_name    = 'My Airline'.

        "Access to sub-componets of nested structure
        connection_nested-message-msgty = 'E'.
        connection_nested-message-msgid = 'ABC'.
        connection_nested-message-msgno = '123'.

*       EXAMPLE 2: FILLING A STRUCTURE WITH VALUE #(   ).
**********************************************************************


        CLEAR connection.

            connection = VALUE #( airport_from_id = 'ABC'
                                  airport_to_id   = 'XYZ'
                                  carrier_name    = 'My Airline'
                                  ).

        " NESTED VALUE TO FILL NESTED STRUCTURE
        connection_nested = VALUE #( airport_from_id = 'ABC'
                                     airport_to_id   = 'XYZ'
                                     message         = Value #( msgty = 'E'
                                                                msgid = 'ABC'
                                                                msgno = '123' )
                                     carrier_name    = 'My Airline'
                                    ).

*       EXAMPLE 3: WRONG RESULT AFTER DIRECT ASSIGNMENT
**********************************************************************


        connection_nested = connection.

        out->write( `-----------------------------------------------` ).
        out->write( `EXAMPLE 3: WRONG RESULT AFTER DIRECT ASSIGNMENT` ).


        out->write( data = connection
                     name = `Source Structure:` ).

        OUT->WRITE( |COMPONENT connection_nested-message-msgid: { connection_nested-message-msgid }| ).
        out->write( |Componente connection-nested-carrier_name: { connection_nested-carrier_name }| ).


*       EXAMPLE 4: Assigning Structures using CORRESPONDING #( )
**********************************************************************


        CLEAR connection_nested.
        connection_nested = CORRESPONDING #( CONNECTION ).  "

         out->write( `------------------------------------------------------------` ).
        out->write( `EXAMPLE 4: Correct result after assignment with CORRESPONDING` ).

        out->write(  data = connection
                     name =  `Source Structure;` ).

           OUT->WRITE( |COMPONENT connection_nested-message-msgid: { connection_nested-message-msgid }| ).
        out->write( |Componente connection-nested-carrier_name: { connection_nested-carrier_name }| ).








  ENDMETHOD.
ENDCLASS.
