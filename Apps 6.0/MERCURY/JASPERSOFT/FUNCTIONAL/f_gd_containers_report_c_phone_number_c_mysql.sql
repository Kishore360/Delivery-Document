 SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_gd_containers_report_c.phone_number_c' 
ELSE 'SUCCESS' END as Message 
FROM 
(select 
count(1) as CNT
 from meritsa_mdsdb.gd_containers_report_final SRC
 join meritsa_mdwdb.f_gd_containers_report_c TRGT on SRC.container_ID=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where coalesce(SRC.Phone_Number,'UNSPECIFIED') <>TRGT.phone_number_c)a;