SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for f_pm_rca_duration_c.vendor_end_date_c' ELSE 'SUCCESS' END as Message
-- select distinct ONVERT_TZ (SRC.u_pending_end,'GMT','America/New_York'),TRGT.vendor_end_date_c,SRC.cdctype
 FROM rogers6_mdsdb.u_pm_rca_duration_final  SRC  
JOIN rogers6_mdwdb.f_pm_rca_duration_c TRGT 
ON SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
 WHERE  CONVERT_TZ (SRC.u_pending_end,'GMT','America/New_York')<>TRGT.vendor_end_date_c
and SRC.CDCTYPE='X';