 -- Introduced as part of credit scrore
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.major_incident_numerify_flag' ELSE 'SUCCESS' END as Message
 -- select TRG.row_id,coalesce(case when lov_map.dimension_wh_code in ('HIGH','CRITICAL') then 'Y' else 'N' end, ''),lov_map.dimension_wh_code
-- , coalesce(TRG.major_incident_numerify_flag,'')
from ( SELECT * FROM fidelity_mdsdb.incident_final WHERE CDCTYPE<>'D') SRC 
left join fidelity_mdwdb.d_incident TRG 
on (SRC.sys_id=TRG.row_id  AND SRC.sourceinstance=TRG.source_id )
where coalesce(case when SRC.priority in (1) then 'Y' else 'N' end)  
<> coalesce(TRG.major_incident_numerify_flag);
 
 