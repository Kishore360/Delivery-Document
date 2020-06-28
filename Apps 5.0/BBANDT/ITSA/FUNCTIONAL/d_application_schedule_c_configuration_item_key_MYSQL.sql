


SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application_schedule_c_configuration_item_key' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdsdb.us_application_schedule_c_final SRC
JOIN bbandt_mdwdb.d_application_schedule_c TRGT ON (SRC.row_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN bbandt_mdwdb.d_configuration_item lkp ON SRC.row_id=lkp.row_id and SRC.sourceinstance=lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN SRC.sys_id is NULL THEN 0 ELSE -1 END)<> TRGT.configuration_item_key;