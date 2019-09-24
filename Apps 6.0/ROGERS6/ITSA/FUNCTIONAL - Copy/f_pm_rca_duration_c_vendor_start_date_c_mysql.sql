SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for f_pm_rca_duration_c.vendor_start_date_c' ELSE 'SUCCESS' END as Message
-- select distinct ONVERT_TZ (SRC.u_pending_start,'GMT','America/New_York'),TRGT.vendor_start_date_c,SRC.cdctype
 FROM rogers_mdsdb.u_pm_rca_duration_final  SRC  
JOIN rogers_mdwdb.f_pm_rca_duration_c TRGT 
ON SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
 WHERE  CONVERT_TZ (SRC.u_pending_start,'GMT','America/New_York')<>TRGT.vendor_start_date_c
and SRC.CDCTYPE='X';