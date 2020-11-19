SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_outage.audience_outage_c_key' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt 
from 
fidelity_mdsdb.task_ci_final  SRC 
JOIN fidelity_mdwdb.f_affected_ci TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
join fidelity_mdwdb.d_configuration_item LKP
 on COALESCE(SRC.ci_item, 'UNSPECIFIED') = LKP.row_id
WHERE COALESCE(LKP.row_key,case when SRC.ci_item is null then 0 else -1 end ) <> (TRGT.affected_ci_key)  and SRC.cdctype<>'D') temp;


