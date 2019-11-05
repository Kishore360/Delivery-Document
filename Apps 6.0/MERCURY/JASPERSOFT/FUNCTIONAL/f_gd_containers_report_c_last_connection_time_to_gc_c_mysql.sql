SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_gd_containers_report_c.last_connection_time_to_gc_c' 
ELSE 'SUCCESS' END as Message 
FROM 
( select 
count(1) as CNT
 from mercury_mdsdb.gd_containers_report_final SRC
 join mercury_mdwdb.f_gd_containers_report_c TRGT on SRC.container_ID=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where STR_TO_DATE(substring((SRC.Last_connection_time_to_GC),1,19), '%m/%d/%Y %H:%i:%s') <>TRGT.last_connection_time_to_gc_c)a;