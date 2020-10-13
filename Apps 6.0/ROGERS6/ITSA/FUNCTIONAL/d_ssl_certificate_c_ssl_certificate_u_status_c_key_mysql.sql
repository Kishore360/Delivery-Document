SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ssk_certificate_c.ssl_certificate_u_status_c_key' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.u_cmdb_ci_ssl_certificate_final SRC 
JOIN rogers6_mdwdb.d_ssl_certificate_c TRGT ON 
SRC.SYS_ID = TRGT.row_id 
LEFT OUTER JOIN rogers6_mdwdb.d_lov LKP 
ON   CONCAT('U_STATUS~SSL_CERTIFICATE~',SRC.U_STATUS) = LKP.row_id and LKP.source_id =  SRC.sourceinstance
WHERE  CASE WHEN SRC.U_STATUS IS NULL THEN 0 ELSE COALESCE(LKP.row_key,-1) END  <> (TRGT.ssl_certificate_u_status_c_key) and TRGT.soft_deleted_flag ='N';

