CLASS zcl_local_class2_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_local_class2_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: connection2 TYPE REF TO lcl_connect2,
        connectors TYPE TABLE OF REF TO lcl_connect2,
        carrier_id2 TYPE /dmo/carrier_id,
        connection_id2 TYPE /dmo/connection_id.

        TRY.

        connection2 = NEW #(
                            i_carrier_id = 'LH'
                             i_connection_id = '0400'
                             ).
        APPEND connection2 TO connectors.
        CATCH cx_abap_invalid_value.
            out->write( 'Method call failed' ).
        ENDTRY.

        TRY.
        connection2 = NEW #(
                            i_carrier_id    = 'AA'
                            i_connection_id = '0017'
                            ).

        APPEND connection2 TO connectors.
        CATCH cx_abap_invalid_value.
            out->write( 'Method call failed' ).
        ENDTRY.

        TRY.
        connection2 = NEw #(
                            i_carrier_id    = 'SQ'
                            i_connection_id = '0001'
                             ).

        APPEND connection2 TO connectors.
        CATCH cx_abap_invalid_value.
            out->write( 'Method call failed' ).
        ENDTRY.

        "out->write( connectors ).

        LOOP AT connectors INTO connection2.

                out->write( connection2->get_output( ) ).
        ENDLOOP.

  ENDMETHOD.
ENDCLASS.
