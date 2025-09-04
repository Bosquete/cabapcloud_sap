CLASS zcl_second_k_rmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_second_k_rmr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: gt_employees TYPE sorted table of ztab_dbase2_rmr
         with unique key id with NON-UNIQUE SORTED KEY first_name
         COMPONENTS last_name.
*      data(count1) = 0.
*  loop at gt_employees ASSIGNING FIELD-SYMBOL(<gs_employees>)
*
*        where id  BETWEEN |0000000002| and |0000000004|.
*        count1 += 1.
*        ENDLOOP.

            Select
            from ztab_dbase2_rmr
            "between 2 and 4
            fields *
            into table @gt_employees.

  out->write( gt_employees ).

  loop at gt_employees ASSIGNING FIELD-SYMBOL(<gs_employees>)

         where id  BETWEEN '0000000002' and '0000000004'.
         out->write( <gs_employees> ).

        ENDLOOP.




  ENDMETHOD.
ENDCLASS.
