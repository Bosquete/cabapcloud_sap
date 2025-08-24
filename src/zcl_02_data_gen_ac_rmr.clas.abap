CLASS zcl_02_data_gen_ac_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_data_gen_ac_rmr IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


  out->write( 'Adding Ttravel data...' ).

  delete from ztb_travel_rmr.

  insert ztb_travel_rmr from (

              select from /dmo/travel
                fields
                " client
                uuid( ) as travel_uuid,
                travel_id,
                agency_id,
                customer_id,
                begin_date,
                end_date,
                booking_fee,
                total_price,
                currency_code,
                description,
                case status when 'B' then 'A'
                            when 'P' then 'O'
                            when 'N' then 'O'
                            else 'X' end as overall_status,
                createdby as local_created_by,
                createdat as local_creted_at,
                lastchangedby as local_last_changed_by,
                lastchangedat as local_last_changed_at,
                lastchangedat as  last_changed_at ).

     out->write(  |{ sy-dbcnt } rows added.| ).

  ENDMETHOD.

ENDCLASS.
