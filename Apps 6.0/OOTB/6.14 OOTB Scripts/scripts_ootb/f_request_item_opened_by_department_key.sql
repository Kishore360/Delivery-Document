-- Populated null as per ITSM-3976

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.opened_by_department_key' ELSE 'SUCCESS' END as Message
 
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_req_item_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (SRC.sys_id=TRGT.row_id) where 
-1 <> COALESCE(TRGT.opened_by_department_key ,'')

