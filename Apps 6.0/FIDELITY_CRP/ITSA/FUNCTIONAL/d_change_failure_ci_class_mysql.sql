SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.ci_class' ELSE 'SUCCESS' END as Message
from (SELECT * FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN fidelity_mdwdb.d_configuration_item LKP 
ON (SRC.cmdb_ci =LKP.row_id 
AND SRC.sourceinstance =LKP.source_id )
WHERE COALESCE(LKP.class,'UNSPECIFIED')<> COALESCE(TRGT.ci_class,'')
