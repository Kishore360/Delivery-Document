SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_outage.audience_outage_c_key' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt 
from 
fidelity_mdsdb.problem_final  SRC 
JOIN fidelity_mdwdb.d_problem TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
WHERE COALESCE(SRC.description,'Unspecified') <> (TRGT.description)  and SRC.cdctype<>'D') temp;


