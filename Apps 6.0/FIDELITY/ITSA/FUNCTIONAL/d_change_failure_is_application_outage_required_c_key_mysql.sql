SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.is_application_outage_required_src_c_key' ELSE 'SUCCESS' END as Message 

FROM (select count(1) as cnt 
from fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  

LEFT JOIN fidelity_mdwdb.d_lov LKP 
ON (COALESCE(CONCAT('U_IS_APPLICATION_OUTAGE_REQUIRED~CHANGE_REQUEST~',SRC.u_is_application_outage_required),'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 

WHERE  CDCTYPE<>'D'and year(TRGT.effective_to)=2999 and TRGT.soft_deleted_flag='N' and TRGT.current_flag='Y'  and COALESCE(LKP.row_key,CASE WHEN SRC.u_is_application_outage_required IS NULL THEN 0 else -1 end) <> (TRGT.is_application_outage_required_src_c_key) and SRC.cdctype<>'D') temp; 
