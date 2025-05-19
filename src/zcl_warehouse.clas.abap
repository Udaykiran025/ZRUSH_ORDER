CLASS zcl_warehouse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_WAREHOUSE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA: lt_warehouse TYPE STANDARD TABLE OF zud_wharehouse WITH EMPTY KEY.

    TRY.
        " Fill warehouse data
        lt_warehouse = VALUE #(
          (  lgort = 'WH1' matnr = 'MAT001' quantity_avail = '150.000' vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
          (  lgort = 'WH1' matnr = 'MAT002' quantity_avail = '100.000' vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
          (  lgort = 'WH1' matnr = 'MAT004' quantity_avail = '200.000' vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
          (  lgort = 'WH1' matnr = 'MAT006' quantity_avail = '250.000' vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
          (  lgort = 'WH2' matnr = 'MAT001' quantity_avail = '150.000' vrkme = 'EA' distance_to = '16.00' dist_uom = 'MI' )
          ( lgort = 'WH2' matnr = 'MAT002' quantity_avail = '200.000' vrkme = 'EA' distance_to = '16.00' dist_uom = 'MI' )
          (  lgort = 'WH2' matnr = 'MAT003' quantity_avail = '150.000' vrkme = 'EA' distance_to = '16.00' dist_uom = 'MI' )
          (  lgort = 'WH2' matnr = 'MAT005' quantity_avail = '160.000' vrkme = 'EA' distance_to = '16.00' dist_uom = 'MI' )
          (  lgort = 'WH3' matnr = 'MAT001' quantity_avail = '185.000' vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
          (  lgort = 'WH3' matnr = 'MAT002' quantity_avail = '35.000'  vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
          (  lgort = 'WH3' matnr = 'MAT003' quantity_avail = '175.000' vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
          (  lgort = 'WH3' matnr = 'MAT004' quantity_avail = '5.000'   vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
          (  lgort = 'WH3' matnr = 'MAT005' quantity_avail = '45.000'  vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
          (  lgort = 'WH3' matnr = 'MAT006' quantity_avail = '105.000' vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
          (  lgort = 'WH4' matnr = 'MAT001' quantity_avail = '120.000' vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
          (  lgort = 'WH4' matnr = 'MAT002' quantity_avail = '80.000'  vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
          (  lgort = 'WH4' matnr = 'MAT003' quantity_avail = '10.000'  vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
          (  lgort = 'WH4' matnr = 'MAT004' quantity_avail = '50.000'  vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
          (  lgort = 'WH4' matnr = 'MAT005' quantity_avail = '230.000' vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
          (  lgort = 'WH4' matnr = 'MAT006' quantity_avail = '85.000'  vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
          (  lgort = 'WH5' matnr = 'MAT002' quantity_avail = '130.000' vrkme = 'EA' distance_to = '3.00'  dist_uom = 'MI' )
          (  lgort = 'WH5' matnr = 'MAT003' quantity_avail = '90.000'  vrkme = 'EA' distance_to = '3.00'  dist_uom = 'MI' )
          (  lgort = 'WH5' matnr = 'MAT004' quantity_avail = '140.000' vrkme = 'EA' distance_to = '3.00'  dist_uom = 'MI' )
          ( lgort = 'WH5' matnr = 'MAT005' quantity_avail = '50.000'  vrkme = 'EA' distance_to = '3.00'  dist_uom = 'MI' )
          (  lgort = 'WH5' matnr = 'MAT006' quantity_avail = '15.000'  vrkme = 'EA' distance_to = '3.00'  dist_uom = 'MI' )
        ).

        " Remove old test data
        DELETE FROM zud_wharehouse.

        " Insert new data
        INSERT zud_wharehouse FROM TABLE @lt_warehouse.

        out->write( |{ sy-dbcnt } entries inserted into ZUD_WHAREHOUSE.| ).

        COMMIT WORK.

      CATCH cx_root INTO DATA(lx_error).
        out->write( |Error: { lx_error->get_text( ) }| ).
    ENDTRY.


  ENDMETHOD.
ENDCLASS.
