
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_cost_center.cost_center_name' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM truist_mdsdb.us_d_cost_center_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN truist_mdwdb.d_cost_center TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.cost_center_name,'')<> COALESCE(TRGT.cost_center_name,'')
