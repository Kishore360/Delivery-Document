SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ssl_certificate_c.ssl_certificate_name_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.u_cmdb_ci_ssl_certificate_final  SRC 
JOIN rogers6_mdwdb.d_ssl_certificate_c TRGT ON 
SRC.SYS_ID = TRGT.row_id 
WHERE   COALESCE(SRC.u_certificate_name,'UNSPECIFIED')<> (TRGT.ssl_certificate_name_c) and TRGT.soft_deleted_flag ='N';