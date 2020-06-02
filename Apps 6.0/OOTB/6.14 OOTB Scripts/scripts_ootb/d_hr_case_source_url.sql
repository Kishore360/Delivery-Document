
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_case.source_url' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hr_case_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_hr_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(CONCAT('<a href=\"#URL\/SRC.do?SRC.sys_id=',SRC.sys_id,'\" style=\"text-decoration:none;color:#f01a1a;\" target=\"_blank\" >',COALESCE(`number`,''),'</a>') ,'')<> COALESCE(TRGT.source_url ,'')
