 
 SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_gd_containers_report_c.device_model_name_c' 
ELSE 'SUCCESS' END as Message 
FROM 
( select 
count(1) as CNT
 from mercury_mdsdb.gd_containers_report_custom_final SRC
 join mercury_mdwdb.f_gd_containers_report_c TRGT on SRC.container_ID=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where coalesce(nullif(SRC.Device_Model_Name,''),'UNSPECIFIED')<>TRGT.device_model_name_c)a;