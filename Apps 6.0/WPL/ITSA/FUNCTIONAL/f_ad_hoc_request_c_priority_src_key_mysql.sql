SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.priority_src_key' ELSE 'SUCCESS' END as Message 
FROM(select concat('PRIORITY~U_AD_HOC_REQUEST~' ,upper( SRC.priority)),LKP.row_id from  wpl_mdsdb.u_ad_hoc_request_final SRC 
 JOIN wpl_mdwdb.f_ad_hoc_request_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN wpl_mdwdb.d_lov LKP ON ( concat( 'PRIORITY~U_AD_HOC_REQUEST~' ,upper( SRC.priority)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<>(TRGT.priority_src_key) and SRC.cdctype='X')ma
