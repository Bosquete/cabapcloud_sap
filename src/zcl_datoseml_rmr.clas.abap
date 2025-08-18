CLASS zcl_datoseml_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DATOSEML_RMR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA agencies_upd TYPE TABLE FOR UPDATE /dmo/I_AgencyTP.

  agencies_upd = VALUE #( (  agencyid = '0700240' name = 'SOme fabcy new name' ) ).


  MODIFY ENTITIES OF /dmo/i_agencytp
    ENTITY /dmo/agency
    UPDATE FIELDS ( name )
        WITH agencies_upd.

  COMMIT ENTITIES.

   out->write(  `Method execution finished!` ).





  ENDMETHOD.
ENDCLASS.
