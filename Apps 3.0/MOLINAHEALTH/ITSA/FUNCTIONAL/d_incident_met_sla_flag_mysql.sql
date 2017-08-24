SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.met_sla_flag' ELSE 'SUCCESS' END as Message from (
 select a13.dimension_name,met_sla_flag,a11.open_to_resolve_duration
, CASE 
WHEN a13.dimension_name='Sev1' and a11.open_to_resolve_duration <(2*3600) THEN 'Y'
WHEN a13.dimension_name='Sev2' and a11.open_to_resolve_duration <(4*3600) THEN 'Y' 
WHEN a13.dimension_name='Sev3' and a11.open_to_resolve_duration <(8*3600) THEN 'Y' 
WHEN a13.dimension_name='Sev4' and a11.open_to_resolve_duration <(24*3600) THEN 'Y'
WHEN a13.dimension_name='Sev5' and a11.open_to_resolve_duration <(72*3600) THEN 'Y'
END
from molinahealth_mdwdb.f_incident a11
join molinahealth_mdsdb.incident_final a12 on a11.row_id = a12.sys_id and a11.source_id = a12.sourceinstance
join molinahealth_mdwdb.d_incident a12 on a11.incident_key = a12.row_key
JOIN molinahealth_mdwdb.d_lov a13 on a11.priority_src_key = a13.row_key
-- group by 1,2
where a12.met_sla_flag <> CASE 
WHEN a13.dimension_name='Sev1' and a11.open_to_resolve_duration <(2*3600) THEN 'Y'
WHEN a13.dimension_name='Sev2' and a11.open_to_resolve_duration <(4*3600) THEN 'Y' 
WHEN a13.dimension_name='Sev3' and a11.open_to_resolve_duration <(8*3600) THEN 'Y' 
WHEN a13.dimension_name='Sev4' and a11.open_to_resolve_duration <(24*3600) THEN 'Y'
WHEN a13.dimension_name='Sev5' and a11.open_to_resolve_duration <(72*3600) THEN 'Y'
END
)a

