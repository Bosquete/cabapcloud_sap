CLASS zcl_dbs_select_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DBS_SELECT_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
        DATA connection TYPE REF TO lcl_connect.
        DATA connections TYPE TABLE OF REF TO lcl_connect.

        connection = NEW #(
                            i_carrier_id      = 'LH'
                            i_connection_id   = '0400'
                            ).

        APPEND connection TO connections.

     CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
     ENDTRY.

    TRY.
        connection = NEW #( i_carrier_id      = 'AA'
                            i_connection_id   = '0017'
                            ).

        APPEND connection TO connections.

    CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

    TRY.
        connection = NEW #( i_carrier_id      = 'SQ'
                            i_connection_id   = '0001'
                            ).

        APPEND connection TO connections.

     CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
     ENDTRY.

    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.



  ENDMETHOD.
ENDCLASS.
