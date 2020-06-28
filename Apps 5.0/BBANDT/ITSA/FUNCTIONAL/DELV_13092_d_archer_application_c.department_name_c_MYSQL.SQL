select
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_archer_application_c.department_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM bbandt_mdsdb.app_vwarchertonumerifyfeed_final SRC 
LEFT JOIN bbandt_mdwdb.d_archer_application_c TRGT ON (SRC.application_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.department_name,'UNSPECIFIED')<>TRGT.department_name_c
) temp; 



 


 
  