SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 
fidelity_mdsdb.change_request_final  SRC 

JOIN fidelity_mdwdb.d_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 
WHERE TRGT.soft_deleted_flag='N'  and (CASE WHEN SRC.outside_maintenance_schedule = 1 then 'Y' else 'N' END) <> (TRGT.outside_maintenance_schedule_flag) ) temp;


