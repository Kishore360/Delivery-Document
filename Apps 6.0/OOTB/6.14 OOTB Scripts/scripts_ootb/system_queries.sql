TRUNCATE TABLE app_test.test_scenarios;

INSERT INTO app_test.test_scenarios VALUES('Check_Effective_From_To','SELECT @row_num := 0, @row_num2 := 0;
SELECT CASE WHEN COUNT(1) > 0 THEN ''FAILURE'' ELSE ''SUCCESS'' END AS Result
, CASE WHEN COUNT(1) > 0 THEN CONCAT(''effective_from and effective_to have overlap or gap for '',count(1), ''records in #DWH_TABLE_SCHEMA.#TABLE_NAME'')
ELSE ''No gap or overlap found in #DWH_TABLE_SCHEMA.#TABLE_NAME'' END AS Message 

FROM (SELECT @row_num := @row_num + 1 as row_number,row_key,row_id,source_id,effective_from,effective_to
FROM #DWH_TABLE_SCHEMA.#TABLE_NAME 
ORDER BY row_id,source_id,effective_from,effective_to) A
JOIN
(SELECT @row_num2 := @row_num2 + 1 as row_number,row_key,row_id,source_id,effective_from,effective_to
FROM #DWH_TABLE_SCHEMA.#TABLE_NAME 
ORDER BY row_id,source_id,effective_from,effective_to) B

ON( A.row_id = B.row_id AND A.source_id = B.source_id 
AND A.row_number +1 = B.row_number )

AND (B.effective_from > DATE_ADD(A.effective_to , INTERVAL 1 SECOND) 
OR B.effective_from <=  A.effective_to );');
INSERT INTO app_test.test_scenarios VALUES('Unique_ROW_SOURCE_EFFECTIVE','SELECT CASE WHEN COUNT(1) > 0 THEN ''FAILURE'' ELSE ''SUCCESS'' END AS Result,CASE WHEN COUNT(1) > 0 THEN ''Multiple records exists for row_id,source_id,effective_from '' ELSE ''Unique records exists for row_id,source_id,effective_from '' END AS Message FROM (SELECT COUNT(1),row_id,source_id,effective_from FROM #DWH_TABLE_SCHEMA.#TABLE_NAME GROUP BY row_id,source_id,effective_from HAVING COUNT(1)>1) R');
INSERT INTO app_test.test_scenarios VALUES('Check_UNSPECIFIED_UNKNOWN','SELECT CASE WHEN count(1) <> 2 then ''FAILURE'' else ''SUCCESS'' end as Result,case when count(1) <> 2 then ''UNSPECIFIED, UNKNOWN entries not present in #DWH_TABLE_SCHEMA.#TABLE_NAME'' else ''UNSPECIFIED, UNKNOWN entries present in #DWH_TABLE_SCHEMA.#TABLE_NAME'' end as Message
from (select * from #DWH_TABLE_SCHEMA.#TABLE_NAME where row_key in (-1,0) and row_id in (''UNSPECIFIED'',''UNKNOWN'') ) A');
INSERT INTO app_test.test_scenarios VALUES('IsEmpty_Domain','SELECT CASE WHEN COUNT(1) = 0 THEN ''FAILURE'' ELSE ''SUCCESS'' END AS Result,
CASE WHEN COUNT(1) = 0 THEN ''#DWH_TABLE_SCHEMA.#TABLE_NAME has no records'' ELSE '''' END AS Message 
FROM #DWH_TABLE_SCHEMA.#TABLE_NAME
WHERE row_key NOT IN (0,-1)');
INSERT INTO app_test.test_scenarios VALUES('System_Column_Check_SCD2','SELECT CASE WHEN count(1) <> 13 then ''FAILURE'' ELSE ''SUCCESS'' end AS Result,case when count(1) <> 13 then ''One of column in (''''row_key'''',''''row_id'''',''''source_id'''',''''etl_run_number'''',''''soft_deleted_flag'''',''''created_by'''',''''changed_by'''',''''created_on'''',''''changed_on'''',''''dw_inserted_on''''
,''''dw_updated_on'''',''''row_dn_key'''',''''row_current_key'''') is missing'' ELSE ''All required columns are present'' 
end AS Message
from information_schema.columns
where column_name in (''row_key'',''row_id'',''source_id'',''etl_run_number'',''soft_deleted_flag'',''created_by'',''changed_by'',''created_on'',''changed_on'',''dw_inserted_on'',''dw_updated_on'',''row_dn_key'',''row_current_key'')and table_name = ''#TABLE_NAME'' and table_schema = ''#DWH_TABLE_SCHEMA''
');
INSERT INTO app_test.test_scenarios VALUES('System_Column_Check_Fact','SELECT CASE WHEN count(1) <> 11 then ''FAILURE'' ELSE ''SUCCESS'' end AS Result,case when count(1) <> 11 then ''One of column in (''''row_key'''',''''row_id'''',''''source_id'''',''''etl_run_number'''',''''soft_deleted_flag'''',''''created_by'''',''''changed_by'''',''''created_on'''',''''changed_on'''',''''dw_inserted_on'''',''''dw_updated_on'''') is missing'' ELSE ''All required columns are present'' end AS Message
from information_schema.columns
where column_name in (''row_key'',''row_id'',''source_id'',''etl_run_number'',''soft_deleted_flag'',''created_by'',''changed_by'',''created_on'',''changed_on'',''dw_inserted_on'',''dw_updated_on'')and table_name = ''#TABLE_NAME'' and table_schema = ''#DWH_TABLE_SCHEMA''');
INSERT INTO app_test.test_scenarios VALUES('Unique_ROW_SOURCE','SELECT CASE WHEN COUNT(1) > 0 THEN ''FAILURE'' ELSE ''SUCCESS'' END AS Result,CASE WHEN COUNT(1) > 0 THEN ''Multiple records exists for row_id,source_id '' ELSE ''Unique records exists for row_id,source_id'' END AS Message FROM (SELECT COUNT(1),row_id,source_id FROM #DWH_TABLE_SCHEMA.#TABLE_NAME GROUP BY row_id,source_id HAVING COUNT(1)>1) R');
INSERT INTO app_test.test_scenarios VALUES('IsEmpty','SELECT CASE WHEN COUNT(1) = 0 THEN ''FAILURE'' ELSE ''SUCCESS'' END AS Result,
CASE WHEN COUNT(1) = 0 THEN ''#DWH_TABLE_SCHEMA.#TABLE_NAME has no records'' ELSE '''' END AS Message 
FROM #DWH_TABLE_SCHEMA.#TABLE_NAME');
INSERT INTO app_test.test_scenarios VALUES('CheckAllNull','SELECT CASE WHEN ColCount = 0 AND TotalCount >0 THEN ''FAILURE'' ELSE ''SUCCESS'' END AS Result,CASE WHEN ColCount = 0 AND TotalCount >0 THEN '' #COLUMN_NAME is all NULL for #TABLE_NAME'' ELSE ''SUCCESS'' END AS Message FROM (SELECT COUNT(DISTINCT #COLUMN_NAME) AS ColCount , COUNT(*) TotalCount FROM #DWH_TABLE_SCHEMA.#TABLE_NAME) A');
INSERT INTO app_test.test_scenarios VALUES('Check_UNKNOWN_NotPresent','SELECT CASE WHEN case when CntTotal<>0 then (CntUnknown/CntTotal)*100 else 0 end > 90 THEN ''FAILURE'' ELSE ''SUCCESS'' END AS Result,
CASE WHEN case when CntTotal<>0 then (CntUnknown/CntTotal)*100 else 0 end > 90 THEN 
CONCAT(''#DWH_TABLE_SCHEMA.#TABLE_NAME has'',CAST(case when CntTotal<>0 then (CntUnknown/CntTotal)*100 else 100 end  AS CHAR(10)), ''% #COLUMN_NAME as -1 out of ''
, CAST(CntTotal AS CHAR(10)),'' records'' ) 
ELSE ''#DWH_TABLE_SCHEMA.#TABLE_NAME has no #COLUMN_NAME -1'' END AS Message
FROM (SELECT COUNT(1) CntUnknown 
FROM #DWH_TABLE_SCHEMA.#TABLE_NAME 
WHERE #COLUMN_NAME = -1 AND row_id NOT IN (''UNKNOWN'',''UNSPECIFIED'')) A
,(SELECT COUNT(1) CntTotal 
FROM #DWH_TABLE_SCHEMA.#TABLE_NAME) B');
INSERT INTO app_test.test_scenarios VALUES('CheckNULL','SELECT CASE WHEN COUNT(#COLUMN_NAME) <> 0 THEN ''FAILURE'' ELSE ''SUCCESS'' END AS Result,
CASE WHEN  COUNT(#COLUMN_NAME) <> 0 THEN ''#COLUMN_NAME has NULL values'' ELSE ''SUCCESS'' END AS Message 
FROM #DWH_TABLE_SCHEMA.#TABLE_NAME 
WHERE #COLUMN_NAME IS NULL');
