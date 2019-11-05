SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for f_pm_rca_duration_c.vendor_c' ELSE 'SUCCESS' END as Message
-- select distinct SRC.u_vendor,TRGT.vendor_c,SRC.cdctype
 FROM rogers_mdsdb.u_pm_rca_duration_final  SRC  
JOIN rogers_mdwdb.f_pm_rca_duration_c TRGT 
ON SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
 WHERE  coalesce(SRC.u_vendor,
                'UNSPECIFIED')<>TRGT.vendor_c
and SRC.CDCTYPE='X';