SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ssl_certificate_c.ssl_certificate_expiry_date_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.u_cmdb_ci_ssl_certificate_final  SRC 
JOIN rogers6_mdwdb.d_ssl_certificate_c TRGT ON 
SRC.SYS_ID = TRGT.row_id 
WHERE   COALESCE(SRC.u_valid_to,'UNSPECIFIED')<> (TRGT.ssl_certificate_expiry_date_c) and TRGT.soft_deleted_flag ='N';
