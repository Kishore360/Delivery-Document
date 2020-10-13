
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ssk_certificate_c.certificate_director_c_key' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.u_cmdb_ci_ssl_certificate_final SRC 
JOIN rogers6_mdwdb.d_ssl_certificate_c TRGT ON 
SRC.SYS_ID = TRGT.row_id 
LEFT OUTER JOIN rogers6_mdwdb.d_internal_contact LKP 
ON    CONCAT('INTERNAL_CONTACT~',
                SRC.u_certificate_director) = LKP.row_id and LKP.source_id =  SRC.sourceinstance
WHERE  CASE WHEN SRC.u_certificate_director IS NULL THEN 0 ELSE COALESCE(LKP.row_key,-1) END  <> (TRGT.certificate_director_c_key) and TRGT.soft_deleted_flag ='N';
