SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.cost_center_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT SRC_P.sys_id, SRC_P.cost_center as cost_center_id, SRC_P.sourceinstance, C1.row_key as cost_center_key 
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_final WHERE CDCTYPE<>'D') SRC_P
LEFT OUTER JOIN #DWH_TABLE_SCHEMA.d_cost_center C1
ON (C1.cost_center_id=SRC_P.cost_center)
) SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
	ON (CONCAT('INTERNAL_CONTACT~',SRC.sys_id) = TRGT.row_id
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE( case when SRC.cost_center_id IS NULL THEN 0
				WHEN SRC.cost_center_id is not null and SRC.cost_center_key IS NULL THEN -1 
				ELSE SRC.cost_center_key END,'')<> COALESCE(TRGT.cost_center_key,'')



