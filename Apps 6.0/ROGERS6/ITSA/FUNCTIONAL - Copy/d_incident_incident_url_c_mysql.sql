SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.incident_url_c' ELSE 'SUCCESS' END as Message 
FROM rogers_mdwdb.d_incident d 
join rogers_mdwdb.f_incident f 
on d.row_key=f.incident_key AND d.source_id=f.source_id
 JOIN rogers_mdwdb.d_lov dl on f.priority_src_key=dl.row_key AND dl.source_id=f.source_id
WHERE (CASE WHEN dl.dimension_name in ('Priority 1','Priority 2','Priority 3') then 
CONCAT('<a href=\"https://majorincident.rci.rogers.com/',d.incident_number,'\" target=\"_blank\">',d.incident_number,'</a>')
ELSE 'UNSPECIFIED' end)<>d.incident_url_c
 and dl.soft_deleted_flag='N' and d.soft_deleted_flag='N' and f.soft_deleted_flag='N';