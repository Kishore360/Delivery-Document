TRUNCATE TABLE app_test.test_objects;
LOAD DATA LOCAL INFILE '.\\golden_jaguar\\#FILE_NAME'
INTO TABLE app_test.test_objects
FIELDS TERMINATED BY ',' 
IGNORE 1 ROWS
(module,tablename,columnname,table_scd_enable,table_scd_capable,columnscd,enabled);