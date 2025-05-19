CLASS zcl_rush_order_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RUSH_ORDER_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


   DATA: lt_salesorder_header TYPE STANDARD TABLE OF zud_salesorder_h WITH EMPTY KEY,
        lt_salesorder_item TYPE STANDARD TABLE OF zud_item_i WITH EMPTY KEY.
*        lt_warehouse       TYPE STANDARD TABLE OF zud_wharehouse.

  TRY.
      " Create test data for zud_salesorder_h (Sales Order Header)
      lt_salesorder_header = VALUE #(
  ( client = '100' vbeln = '0000000001' kunnr = 'CUST001' netwr = '1200.50' waerk = 'USD' bstnk = 'BNK001' route = 'ROT01' vdatu = '20250401' name_co = 'Tech Innovators' street = '123 Main St' state = 'NY' pin = '10001' )
  ( client = '100' vbeln = '0000000002' kunnr = 'CUST002' netwr = '3000.75' waerk = 'USD' bstnk = 'BNK002' route = 'ROT02' vdatu = '20250402' name_co = 'Global Enterprises' street = '456 Oak St' state = 'CA' pin = '90001' )
  ( client = '100' vbeln = '0000000003' kunnr = 'CUST003' netwr = '1500.00' waerk = 'USD' bstnk = 'BNK003' route = 'ROT03' vdatu = '20250403' name_co = 'Green Valley Corp' street = '789 Pine St' state = 'TX' pin = '70001' )
  ( client = '100' vbeln = '0000000004' kunnr = 'CUST004' netwr = '2200.10' waerk = 'USD' bstnk = 'BNK004' route = 'ROT04' vdatu = '20250404' name_co = 'Miller & Sons Ltd' street = '321 Elm St' state = 'FL' pin = '40001' )
  ( client = '100' vbeln = '0000000005' kunnr = 'CUST005' netwr = '5000.00' waerk = 'USD' bstnk = 'BNK005' route = 'ROT05' vdatu = '20250405' name_co = 'Sunshine Holdings' street = '654 Maple St' state = 'IL' pin = '60001' )
  ( client = '100' vbeln = '0000000006' kunnr = 'CUST006' netwr = '2200.10' waerk = 'USD' bstnk = 'BNK006' route = 'ROT06' vdatu = '20250406' name_co = 'Prime Solution' street = '234 Birch St' state = 'CO' pin = '80001' )
  ( client = '100' vbeln = '0000000007' kunnr = 'CUST007' netwr = '3400.20' waerk = 'USD' bstnk = 'BNK007' route = 'ROT07' vdatu = '20250407' name_co = 'Blue Ocean Inc' street = '876 Cedar St' state = 'WA' pin = '60021' )
  ( client = '100' vbeln = '0000000008' kunnr = 'CUST008' netwr = '5400.40' waerk = 'USD' bstnk = 'BNK008' route = 'ROT08' vdatu = '20250408' name_co = 'FastTrack Industries' street = '432 Pine St' state = 'NV' pin = '20001' )
  ( client = '100' vbeln = '0000000009' kunnr = 'CUST009' netwr = '4300.30' waerk = 'USD' bstnk = 'BNK009' route = 'ROT09' vdatu = '20250409' name_co = 'NorthStar Technologies' street = '765 Oak St' state = 'AZ' pin = '50001' )
  ( client = '100' vbeln = '0000000010' kunnr = 'CUST010' netwr = '6200.60' waerk = 'USD' bstnk = 'BNK010' route = 'ROT010' vdatu = '20250410' name_co = 'Jhonson company' street = '987 Maple St' state = 'OR' pin = '90011' )
).
      " Delete existing entries in zud_salesorder_h and insert new data
      DELETE FROM zud_salesorder_h.
      INSERT zud_salesorder_h FROM TABLE @lt_salesorder_header.
      out->write( |{ sy-dbcnt } entries in zud_salesorder_h modified| ).

      " Create test data for zud_item_i (Sales Order Items)
      lt_salesorder_item = VALUE #(
           " Sales Order 0000000001 Line Items
           ( client = '100' vbeln = '0000000001' posnr = '000001' matnr = 'MAT001' kwmeng = '10.000' vrkme = 'EA' werks = '1000' netwr = '100.00' waerk = 'USD' brgew = '5.000' ntgew = '5.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000001' posnr = '000002' matnr = 'MAT002' kwmeng = '20.000' vrkme = 'EA' werks = '1000' netwr = '200.00' waerk = 'USD' brgew = '10.000' ntgew = '10.000' gewei = 'KG' lgort = '' )

           " Sales Order 0000000002 Line Items
           ( client = '100' vbeln = '0000000002' posnr = '000001' matnr = 'MAT001' kwmeng = '10.000' vrkme = 'EA' werks = '2000' netwr = '100.00' waerk = 'USD' brgew = '5.000' ntgew = '5.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000002' posnr = '000002' matnr = 'MAT002' kwmeng = '20.000' vrkme = 'EA' werks = '2000' netwr = '200.00' waerk = 'USD' brgew = '10.000' ntgew = '10.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000002' posnr = '000003' matnr = 'MAT003' kwmeng = '30.000' vrkme = 'EA' werks = '2000' netwr = '300.00' waerk = 'USD' brgew = '15.000' ntgew = '15.000' gewei = 'KG' lgort = '' )

           " Sales Order 0000000003 Line Items
           ( client = '100' vbeln = '0000000003' posnr = '000001' matnr = 'MAT004' kwmeng = '10.000' vrkme = 'EA' werks = '2000' netwr = '100.00' waerk = 'USD' brgew = '5.000' ntgew = '5.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000003' posnr = '000002' matnr = 'MAT005' kwmeng = '20.000' vrkme = 'EA' werks = '2000' netwr = '200.00' waerk = 'USD' brgew = '10.000' ntgew = '10.000' gewei = 'KG' lgort = '' )


           " Sales Order 0000000004 Line Items
           ( client = '100' vbeln = '0000000004' posnr = '000001' matnr = 'MAT001' kwmeng = '10.000' vrkme = 'EA' werks = '1000' netwr = '100.00' waerk = 'USD' brgew = '5.000' ntgew = '5.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000004' posnr = '000002' matnr = 'MAT002' kwmeng = '20.000' vrkme = 'EA' werks = '1000' netwr = '200.00' waerk = 'USD' brgew = '10.000' ntgew = '10.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000004' posnr = '000003' matnr = 'MAT004' kwmeng = '30.000' vrkme = 'EA' werks = '1000' netwr = '300.00' waerk = 'USD' brgew = '15.000' ntgew = '15.000' gewei = 'KG' lgort = '' )

           " Sales Order 0000000005 Line Items
           ( client = '100' vbeln = '0000000005' posnr = '000001' matnr = 'MAT004' kwmeng = '10.000' vrkme = 'EA' werks = '1000' netwr = '100.00' waerk = 'USD' brgew = '5.000' ntgew = '5.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000005' posnr = '000002' matnr = 'MAT005' kwmeng = '20.000' vrkme = 'EA' werks = '1000' netwr = '200.00' waerk = 'USD' brgew = '10.000' ntgew = '10.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000005' posnr = '000003' matnr = 'MAT006' kwmeng = '30.000' vrkme = 'EA' werks = '1000' netwr = '300.00' waerk = 'USD' brgew = '15.000' ntgew = '15.000' gewei = 'KG' lgort = '' )

           " Sales Order 0000000006 Line Items
           ( client = '100' vbeln = '0000000006' posnr = '000001' matnr = 'MAT001' kwmeng = '10.000' vrkme = 'EA' werks = '1000' netwr = '100.00' waerk = 'USD' brgew = '5.000' ntgew = '5.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000006' posnr = '000002' matnr = 'MAT002' kwmeng = '20.000' vrkme = 'EA' werks = '1000' netwr = '200.00' waerk = 'USD' brgew = '10.000' ntgew = '10.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000006' posnr = '000003' matnr = 'MAT003' kwmeng = '30.000' vrkme = 'EA' werks = '1000' netwr = '300.00' waerk = 'USD' brgew = '15.000' ntgew = '15.000' gewei = 'KG' lgort = '' )

           " Sales Order 0000000007 Line Items
           ( client = '100' vbeln = '0000000007' posnr = '000001' matnr = 'MAT001' kwmeng = '10.000' vrkme = 'EA' werks = '1000' netwr = '100.00' waerk = 'USD' brgew = '5.000' ntgew = '5.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000007' posnr = '000002' matnr = 'MAT003' kwmeng = '20.000' vrkme = 'EA' werks = '1000' netwr = '200.00' waerk = 'USD' brgew = '10.000' ntgew = '10.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000007' posnr = '000003' matnr = 'MAT005' kwmeng = '30.000' vrkme = 'EA' werks = '1000' netwr = '300.00' waerk = 'USD' brgew = '15.000' ntgew = '15.000' gewei = 'KG' lgort = '' )

           " Sales Order 0000000008 Line Items
           ( client = '100' vbeln = '0000000008' posnr = '000001' matnr = 'MAT002' kwmeng = '10.000' vrkme = 'EA' werks = '1000' netwr = '100.00' waerk = 'USD' brgew = '5.000' ntgew = '5.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000008' posnr = '000002' matnr = 'MAT004' kwmeng = '20.000' vrkme = 'EA' werks = '1000' netwr = '200.00' waerk = 'USD' brgew = '10.000' ntgew = '10.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000008' posnr = '000003' matnr = 'MAT006' kwmeng = '30.000' vrkme = 'EA' werks = '1000' netwr = '300.00' waerk = 'USD' brgew = '15.000' ntgew = '15.000' gewei = 'KG' lgort = '' )

           " Sales Order 0000000009 Line Items
           ( client = '100' vbeln = '0000000009' posnr = '000001' matnr = 'MAT004' kwmeng = '10.000' vrkme = 'EA' werks = '1000' netwr = '100.00' waerk = 'USD' brgew = '5.000' ntgew = '5.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000009' posnr = '000002' matnr = 'MAT005' kwmeng = '20.000' vrkme = 'EA' werks = '1000' netwr = '200.00' waerk = 'USD' brgew = '10.000' ntgew = '10.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000009' posnr = '000003' matnr = 'MAT006' kwmeng = '30.000' vrkme = 'EA' werks = '1000' netwr = '300.00' waerk = 'USD' brgew = '15.000' ntgew = '15.000' gewei = 'KG' lgort = '' )

           " Sales Order 0000000010 Line Items
           ( client = '100' vbeln = '0000000010' posnr = '000001' matnr = 'MAT002' kwmeng = '10.000' vrkme = 'EA' werks = '1000' netwr = '100.00' waerk = 'USD' brgew = '5.000' ntgew = '5.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000010' posnr = '000002' matnr = 'MAT003' kwmeng = '20.000' vrkme = 'EA' werks = '1000' netwr = '200.00' waerk = 'USD' brgew = '10.000' ntgew = '10.000' gewei = 'KG' lgort = '' )
           ( client = '100' vbeln = '0000000010' posnr = '000003' matnr = 'MAT004' kwmeng = '30.000' vrkme = 'EA' werks = '1000' netwr = '300.00' waerk = 'USD' brgew = '15.000' ntgew = '15.000' gewei = 'KG' lgort = '' )
        ).
      " Delete existing entries in zud_item_i and insert new data
      DELETE FROM zud_item_i.
      INSERT zud_item_i FROM TABLE @lt_salesorder_item.
      out->write( |{ sy-dbcnt } entries in zud_item_i modified| ).


*       " Warehouse data
*        lt_warehouse = VALUE #(
*           ( client = '100' lgort = 'WH1' matnr = 'MAT001' quantity_avail = '150.000' vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
*           ( client = '100' lgort = 'WH1' matnr = 'MAT002' quantity_avail = '100.000' vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
*           ( client = '100' lgort = 'WH1' matnr = 'MAT004' quantity_avail = '200.000' vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
*            ( client = '100' lgort = 'WH1' matnr = 'MAT006' quantity_avail = '250.000' vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH2' matnr = 'MAT001' quantity_avail = '150.000' vrkme = 'EA' distance_to = '16.00' dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH2' matnr = 'MAT002' quantity_avail = '200.000' vrkme = 'EA' distance_to = '16.00' dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH2' matnr = 'MAT003' quantity_avail = '150.000' vrkme = 'EA' distance_to = '16.00' dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH2' matnr = 'MAT005' quantity_avail = '160.000' vrkme = 'EA' distance_to = '16.00' dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH3' matnr = 'MAT001' quantity_avail = '185.000'  vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH3' matnr = 'MAT002' quantity_avail = '35.000'  vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH3' matnr = 'MAT003' quantity_avail = '175.000'  vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH3' matnr = 'MAT004' quantity_avail = '5.000'  vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH3' matnr = 'MAT005' quantity_avail = '45.000'  vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
*    ( client = '100' lgort = 'WH3' matnr = 'MAT006' quantity_avail = '105.000'  vrkme = 'EA' distance_to = '8.00'  dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH4' matnr = 'MAT001' quantity_avail = '120.000' vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
*    ( client = '100' lgort = 'WH4' matnr = 'MAT002' quantity_avail = '80.000' vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
*      ( client = '100' lgort = 'WH4' matnr = 'MAT003' quantity_avail = '10.000' vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
*        ( client = '100' lgort = 'WH4' matnr = 'MAT004' quantity_avail = '50.000' vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
*          ( client = '100' lgort = 'WH4' matnr = 'MAT005' quantity_avail = '230.000' vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
*            ( client = '100' lgort = 'WH4' matnr = 'MAT006' quantity_avail = '85.000' vrkme = 'EA' distance_to = '25.00' dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH5' matnr = 'MAT002' quantity_avail = '130.000' vrkme = 'EA' distance_to = '3.00'  dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH5' matnr = 'MAT003' quantity_avail = '90.000' vrkme = 'EA' distance_to = '3.00'  dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH5' matnr = 'MAT004' quantity_avail = '140.000' vrkme = 'EA' distance_to = '3.00'  dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH5' matnr = 'MAT005' quantity_avail = '50.000' vrkme = 'EA' distance_to = '3.00'  dist_uom = 'MI' )
*  ( client = '100' lgort = 'WH5' matnr = 'MAT006' quantity_avail = '15.000' vrkme = 'EA' distance_to = '3.00'  dist_uom = 'MI' )
*
*
*        ).
*        DELETE FROM zud_wharehouse.
*        INSERT zud_wharehouse FROM TABLE @lt_warehouse.
*        out->write( |{ sy-dbcnt } entries in zud_warehouse modified.| ).

      COMMIT WORK.
  CATCH cx_uuid_error.

  ENDTRY.

  ENDMETHOD.
ENDCLASS.
