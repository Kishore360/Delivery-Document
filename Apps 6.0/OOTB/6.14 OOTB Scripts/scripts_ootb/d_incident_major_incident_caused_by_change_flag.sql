 -- Introduced as part of credit scrore
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.major_incident_flag' ELSE 'SUCCESS' END as Message
 -- select TRG.row_id,coalesce(case when lov_map.dimension_wh_code in ('HIGH','CRITICAL') then 'Y' else 'N' end, ''),lov_map.dimension_wh_code
-- , coalesce(TRG.major_incident_caused_by_change_flag,'')
from ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC 
 left join #DWH_TABLE_SCHEMA.d_lov_map lov_map
 on concat('PRIORITY~INCIDENT~',SRC.priority) = lov_map.src_rowid
 and SRC.sourceinstance = lov_map.source_id
left join #DWH_TABLE_SCHEMA.d_incident TRG 
on (SRC.sys_id=TRG.row_id  AND SRC.sourceinstance=TRG.source_id )
where coalesce(case when lov_map.dimension_wh_code in ('HIGH','CRITICAL') then 'Y' else 'N' end, '')  
<> coalesce(TRG.major_incident_caused_by_change_flag,'');
 
 