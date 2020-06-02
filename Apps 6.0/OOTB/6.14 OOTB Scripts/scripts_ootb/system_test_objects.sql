USE app_test;
DROP PROCEDURE IF EXISTS `SP_SYSTEM_TEST`;
DELIMITER ##
CREATE PROCEDURE `SP_SYSTEM_TEST`(IN in_tenant_name VARCHAR(255),in_scenario varchar(100)
,in_filter_list text,in_testlevel VARCHAR(100))
BEGIN
DECLARE v_table_id INTEGER;
DECLARE v_module VARCHAR(100);
DECLARE v_tablename VARCHAR(255);
DECLARE v_columnname VARCHAR(255);
DECLARE v_table_scd_capable VARCHAR(100);

DECLARE v_sqlscript text;
DECLARE temp text;
DECLARE v_cur_done BOOLEAN DEFAULT FALSE;
DECLARE v_has_error INT DEFAULT FALSE;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cur_done = TRUE;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET v_has_error = 1;


SELECT @v_sqlscript:=TRIM(sqlscript)
FROM test_scenarios
WHERE TRIM(in_scenario)=TRIM(scenario) LIMIT 1;


IF LOWER(in_testlevel) = 'table' THEN
BEGIN
	DROP TABLE IF EXISTS table_list_temp;
    SET @temp=CONCAT('CREATE TABLE table_list_temp AS SELECT id, TRIM(module) as module,TRIM(tablename) as tablename,TRIM(table_scd_capable) as table_scd_capable'
		,' FROM test_objects WHERE enabled = ''Y'' AND ',in_filter_list,';');
	-- select @temp;
    PREPARE stmt1 FROM @temp;
    EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;    
END;
ELSE
BEGIN
	DROP TABLE IF EXISTS table_list_temp;
    SET @temp=CONCAT('CREATE TABLE table_list_temp AS SELECT  id, TRIM(module)  as module,TRIM(tablename) as tablename,TRIM(columnname) as columnname,TRIM(table_scd_capable) as table_scd_capable'
		,' FROM test_objects WHERE enabled = ''Y'' AND ',in_filter_list,';');
	-- select @temp;
	PREPARE stmt1 FROM @temp;
    EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;            
     
END;
END IF;
select * from table_list_temp;
-- SELECT v_cur_done,@v_testlevel ;

select @v_test_run_id:=test_run_id
FROM test_summary
WHERE test_suite_name like concat('%',in_tenant_name,'%') ORDER BY start_time DESC LIMIT 1;

IF LOWER(in_testlevel) = 'table' THEN
BEGIN
        
	DECLARE table_cursor CURSOR FOR SELECT DISTINCT module,tablename,table_scd_capable
		FROM table_list_temp order by id;
	OPEN table_cursor;
	
    read_table_loop: LOOP
	FETCH table_cursor INTO  v_module,v_tablename,v_table_scd_capable;

-- select v_cur_done,v_table_id, v_module,v_tablename,v_table_scd_capable;
    IF v_cur_done THEN
		CLOSE table_cursor;
		LEAVE read_table_loop;
    END IF;
	
    DROP TABLE IF EXISTS result_temp1;
   
    SET v_sqlscript=@v_sqlscript;
	SET v_has_error = 0;
	/*SET @temp=CONCAT('CREATE TABLE result_temp1 AS '
            ,REPLACE(REPLACE(REPLACE(v_sqlscript,'#TABLE_NAME',v_tablename),'#DWH_TABLE_SCHEMA',CONCAT(in_tenant_name,'_mdwdb')),'#MDS_TABLE_SCHEMA',CONCAT(in_tenant_name,'_mdsdb')),';');
	*/
    SET @temp=REPLACE(
			REPLACE(REPLACE(REPLACE(v_sqlscript,'#TABLE_NAME',v_tablename),'#DWH_TABLE_SCHEMA'
            ,CONCAT(in_tenant_name,'_mdwdb')),'#MDS_TABLE_SCHEMA'
            ,CONCAT(in_tenant_name,'_mdsdb')),'SELECT CASE WHEN ','CREATE TABLE result_temp1 AS SELECT CASE WHEN ');
	-- SELECT @temp;
	PREPARE stmt FROM @temp;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
    
	-- select * from result_temp1;
    
	IF v_has_error = 1 THEN 
		INSERT INTO system_test_results(test_run_id,scenario,tablename,sqlscript,result,message)
		SELECT  @v_test_run_id,in_scenario,v_tablename,replace(@temp,'CREATE TABLE result_temp1 AS ',''),'FAILURE','SQL Exception. Check sqlscript in system_test_results'  FROM result_temp1 ;
		SET v_has_error = 0;
	ELSE
    	INSERT INTO system_test_results(test_run_id,scenario,tablename,sqlscript,result,message)
		SELECT  @v_test_run_id,in_scenario,v_tablename,replace(@temp,'CREATE TABLE result_temp1 AS ',''),result,message FROM result_temp1;
	END IF;
    
	END LOOP read_table_loop;
	-- CLOSE table_cursor;
    
END;

ELSE
      
BEGIN
	
	DECLARE col_cursor CURSOR FOR SELECT DISTINCT module,tablename,columnname,table_scd_capable
		FROM table_list_temp order by id;
	OPEN col_cursor;
    
	-- SELECT v_cur_done ;
    read_col_loop: LOOP
	FETCH col_cursor INTO  v_module,v_tablename,v_columnname,v_table_scd_capable;

-- select v_cur_done,v_table_id, v_module,v_tablename,v_columnname,v_table_scd_capable;
    IF v_cur_done THEN
		CLOSE col_cursor;
		LEAVE read_col_loop;
    END IF;
	
    DROP TABLE IF EXISTS result_temp1;
   
    SET v_sqlscript=@v_sqlscript;
	SET v_has_error = 0;
	SET @temp=REPLACE(
            REPLACE(REPLACE(REPLACE(REPLACE(v_sqlscript,'#COLUMN_NAME',v_columnname),'#TABLE_NAME',v_tablename),'#DWH_TABLE_SCHEMA'
            ,CONCAT(in_tenant_name,'_mdwdb')),'#MDS_TABLE_SCHEMA'
            ,CONCAT(in_tenant_name,'_mdsdb')),'SELECT CASE WHEN ','CREATE TABLE result_temp1 AS SELECT CASE WHEN ');
	
    /*SET @temp=CONCAT('CREATE TABLE result_temp1 AS '
            ,REPLACE(REPLACE(REPLACE(REPLACE(v_sqlscript,'#COLUMN_NAME',v_columnname),'#TABLE_NAME',v_tablename),'#DWH_TABLE_SCHEMA',CONCAT(in_tenant_name,'_mdwdb')),'#MDS_TABLE_SCHEMA',CONCAT(in_tenant_name,'_mdsdb')),';');
	*/
    -- select @temp;
	PREPARE stmt FROM @temp;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
    
	IF v_has_error = 1 THEN 
		INSERT INTO system_test_results(test_run_id,scenario,tablename,sqlscript,result,message)
		SELECT  @v_test_run_id,in_scenario,CONCAT(v_tablename,'.',v_columnname),replace(@temp,'CREATE TABLE result_temp1 AS ',''),'FAILURE','SQL Exception. Check sqlscript in system_test_results'  FROM result_temp1 ;
		SET v_has_error = 0;
	ELSE
		INSERT INTO system_test_results(test_run_id,scenario,tablename,sqlscript,result,message)
		SELECT  @v_test_run_id,in_scenario,CONCAT(v_tablename,'.',v_columnname),replace(@temp,'CREATE TABLE result_temp1 AS ',''),result,message FROM result_temp1;

	END IF;
    
	END LOOP read_col_loop;
	-- CLOSE col_cursor;
    
END;

END IF;



END##
DELIMITER ;


CREATE TABLE IF NOT EXISTS `system_test_results` (
  `test_run_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tablename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sqlscript` text COLLATE utf8_unicode_ci,
  `test_run_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `result` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `test_scenarios` (
  `scenario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sqlscript` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `test_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tablename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `columnname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_scd_enable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_scd_capable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `columnscd` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_tabname` (`tablename`),
  KEY `ind_name` (`columnname`)
) ENGINE=InnoDB AUTO_INCREMENT=8192 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
