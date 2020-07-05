

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result
, CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message  
FROM (select count(1) as cnt from truist_mdsdb.cmdb_ci_final SRC 
 LEFT JOIN truist_mdwdb.d_configuration_item TRGT  ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id ) 
WHERE DATE_FORMAT(CONVERT_TZ(COALESCE(SRC.sys_created_on,'19700101'),'GMT','America/New_York'),'%Y%m%d') <> TRGT.created_on_c_key
and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma;
