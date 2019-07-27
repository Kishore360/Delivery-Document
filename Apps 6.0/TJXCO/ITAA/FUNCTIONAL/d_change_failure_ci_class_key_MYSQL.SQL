SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.ci_class_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left outer join (SELECT * FROM tjxco_mdsdb.cmdb_ci_final WHERE CDCTYPE<>'D') SRC1
on (SRC.cmdb_ci=SRC1.sys_id and SRC.sourceinstance=SRC1.sourceinstance)
left outer join tjxco_mdwdb.d_lov LKP
ON ( concat('CLASS~CMDB_CI~',SRC1.sys_class_name) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id ) 

left join (SELECT * FROM tjxco_mdwdb.d_change_failure where year(effective_to)=2999) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.sys_class_name IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.ci_class_key,'')
