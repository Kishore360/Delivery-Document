select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for PROBLEM' ELSE 'SUCCESS' END as Message

from
(
select case when reopened_flag='N'  and reassignee_count=0 and timestampdiff(minute,opened_on,last_resolved_on)<=480 then 'Y' else 'N' end as fpcr,
first_point_of_contact_resolution_flag
from molinahealth_mdwdb.d_incident d  
join molinahealth_mdwdb.f_incident f on f.incident_key=d.row_key
join molinahealth_mdwdb.d_lov_map map on f.state_src_key=map.src_key
where  map.dimension_wh_code in ('RESOLVED','CLOSED')
)a where 
first_point_of_contact_resolution_flag<>fpcr;
