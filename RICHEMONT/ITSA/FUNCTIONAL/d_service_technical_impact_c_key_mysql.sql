SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_service.technical_impact_c_key' ELSE 'SUCCESS' END as Message
from (
select Count(1) as cnt
from richemontdev_mdwdb.d_service TRGT 
left join richemont_mdsdb.cmdb_ci_service_final SRC
ON (concat('BUSINESS_SERVICE~',SRC.sys_id)) =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id
LEFT JOIN richemontdev_mdwdb.d_lov LKP 
 ON ( concat('IMPACT~SERVICE~~~',upper(SRC.u_technical_scope)))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_technical_scope IS NULL THEN 0 else -1 end)<> (TRGT.technical_impact_c_key))a
