CLASS zcl_ware_i DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_WARE_I IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



  DATA: lt_warehouse TYPE STANDARD TABLE OF zwarehouse WITH EMPTY KEY,
         lt_material_stock TYPE STANDARD TABLE OF zmaterial_stock WITH EMPTY KEY,
         lt_customer_ud TYPE STANDARD TABLE OF zcustomer_ud WITH EMPTY KEY,
         lt_master_zip TYPE STANDARD TABLE OF zmaster_zip WITH EMPTY KEY.

  TRY.
      " Create test data for zwarehouse
      lt_warehouse = VALUE #(
        ( warehouse_id = 'W001' zipcode = '10001' warehouse_name = 'New York Central Warehouse'  )
        ( warehouse_id = 'W002' zipcode = '60601' warehouse_name = 'Chicago Main Depot'  )
        ( warehouse_id = 'W003' zipcode = '90001' warehouse_name = 'Los Angeles Storage Facility'  )
      ).

      " Delete existing entries in zwarehouse and insert new data
      DELETE FROM zwarehouse.
      INSERT zwarehouse FROM TABLE @lt_warehouse.
      out->write( |{ sy-dbcnt } entries in zwarehouse modified| ).

      " Create test data for zmaterial_stock
      lt_material_stock = VALUE #(
        " Warehouse A (W001)
        ( warehouse_id = 'W001' material_id = 'M001' material_name = 'Material A' quantity = 100 )
        ( warehouse_id = 'W001' material_id = 'M002' material_name = 'Material B' quantity = 200 )

        " Warehouse B (W002)
        ( warehouse_id = 'W002' material_id = 'M003' material_name = 'Material C' quantity = 150 )
        ( warehouse_id = 'W002' material_id = 'M004' material_name = 'Material D' quantity = 250 )

        " Warehouse C (W003)
        ( warehouse_id = 'W003' material_id = 'M005' material_name = 'Material E' quantity = 300 )
        ( warehouse_id = 'W003' material_id = 'M006' material_name = 'Material F' quantity = 400 )
      ).

      " Delete existing entries in zmaterial_stock and insert new data
      DELETE FROM zmaterial_stock.
      INSERT zmaterial_stock FROM TABLE @lt_material_stock.
      out->write( |{ sy-dbcnt } entries in zmaterial_stock modified| ).

      " Create test data for zcustomer_ud
      lt_customer_ud = VALUE #(
        ( customer_id = 'C001' customer_name = 'Customer A' longitude = '40.7306' )
        ( customer_id = 'C002' customer_name = 'Customer B' longitude = '34.0522' )
        ( customer_id = 'C003' customer_name = 'Customer C' longitude = '51.5074' )
      ).

      " Delete existing entries in zcustomer_ud and insert new data
      DELETE FROM zcustomer_ud.
      INSERT zcustomer_ud FROM TABLE @lt_customer_ud.
      out->write( |{ sy-dbcnt } entries in zcustomer_ud modified| ).


      " Create test data for zmaster_zip (USA only)
  lt_master_zip = VALUE #(
    ( zipcode = '10001'  country_code = 'USA' place = 'New York, NY'       latitude = '40.750742' longitude = '-73.996530' )
    ( zipcode = '94105'  country_code = 'USA' place = 'San Francisco, CA'  latitude = '37.789829' longitude = '-122.394020' )
    ( zipcode = '60601'  country_code = 'USA' place = 'Chicago, IL'        latitude = '41.886450' longitude = '-87.622550' )
    ( zipcode = '90001'  country_code = 'USA' place = 'Los Angeles, CA'    latitude = '33.973950' longitude = '-118.248405' )
    ( zipcode = '73301'  country_code = 'USA' place = 'Austin, TX'         latitude = '30.267153' longitude = '-97.743057' )
    ( zipcode = '98101'  country_code = 'USA' place = 'Seattle, WA'        latitude = '47.609722' longitude = '-122.333056' )
    ( zipcode = '30301'  country_code = 'USA' place = 'Atlanta, GA'        latitude = '33.748995' longitude = '-84.387982' )
    ( zipcode = '80202'  country_code = 'USA' place = 'Denver, CO'         latitude = '39.739236' longitude = '-104.990251' )
    ( zipcode = '32801'  country_code = 'USA' place = 'Orlando, FL'        latitude = '28.538336' longitude = '-81.379234' )
    ( zipcode = '48201'  country_code = 'USA' place = 'Detroit, MI'        latitude = '42.331427' longitude = '-83.045754' )
  ).

  " Delete and insert test data
  DELETE FROM zmaster_zip.
  INSERT zmaster_zip FROM TABLE @lt_master_zip.
  out->write( |{ sy-dbcnt } USA entries inserted into zmaster_zip| ).



      COMMIT WORK.
  CATCH cx_uuid_error.

  ENDTRY.



  ENDMETHOD.
ENDCLASS.
