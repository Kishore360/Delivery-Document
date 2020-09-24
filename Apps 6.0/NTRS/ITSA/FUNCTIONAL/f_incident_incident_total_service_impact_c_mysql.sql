SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.incident_final SRC
LEFT JOIN ntrust_mdwdb.f_incident TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
where 
CASE WHEN (SRC.u_service_impact_start is null or SRC.u_service_impact_end is null) THEN NULL   WHEN TIMESTAMPDIFF(SECOND,SRC.u_service_impact_start,SRC.u_service_impact_end) < 0 THEN NULL ELSE TIMESTAMPDIFF(SECOND,SRC.u_service_impact_start,SRC.u_service_impact_end) end
<> TRGT2.incident_total_service_impact_c and SRC.cdctype='X') temp;


