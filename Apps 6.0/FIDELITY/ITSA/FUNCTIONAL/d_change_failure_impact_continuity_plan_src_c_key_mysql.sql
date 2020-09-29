SELECT 
CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.impact_continuity_plan_src_c_key' ELSE 'SUCCESS' END as Message 

FROM (select count(1) as cnt 
from fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  

LEFT JOIN fidelity_mdwdb.d_lov LKP 
ON (COALESCE(CONCAT('U_IMPACT_CONTINUITY_PLAN~CHANGE_REQUEST~',SRC.u_impact_continuity_plan),'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 

WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_impact_continuity_plan IS NULL THEN 0 else -1 end) <> (TRGT.impact_continuity_plan_src_c_key)and (
coalesce(SRC.work_start,SRC.start_date,SRC.closed_at)>'2019-01-01'
and SRC.u_environment='Production'
and TRGT.current_flag='Y'
and SRC.cdctype<>'D')  ) temp;
