SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.change_trigger_c' ELSE 'SUCCESS' END as Message 

FROM (select count(1) as cnt  from (select * from fidelity_mdsdb.change_request_final where cdctype<>'D')  SRC 

JOIN fidelity_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 

LEFT JOIN ( SELECT value,label from fidelity_mdsdb.sys_choice_final where element ='u_change_trigger' and name ='change_request' and language ='en') chg 

ON SRC.u_change_trigger = chg.value
 
WHERE  TRGT.current_flag ='Y' and COALESCE(chg.label,'UNSPECIFIED') <> (TRGT.change_trigger_c) ) temp;