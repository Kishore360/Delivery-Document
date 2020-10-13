SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ssl_certificate_c.cost_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.u_cmdb_ci_ssl_certificate_final  SRC 
JOIN rogers6_mdwdb.d_ssl_certificate_c TRGT ON 
SRC.SYS_ID = TRGT.row_id 
JOIN rogers6_mdwdb.f_ssl_certificate_c LKP ON TRGT.row_key=LKP.ssl_certificate_c_key
WHERE   COALESCE(SRC.u_costnew,'UNSPECIFIED')<> (LKP.cost_c) and LKP.soft_deleted_flag ='N';
