SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
ucsf_mdsdb.incident_final a
join ucsf_mdsdb.u_location_room_final b
on b.sys_id=a.u_room_ref and a.sourceinstance=b.sourceinstance
left join ucsf_mdwdb.d_incident c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
where c.room_ref_desc_c<>b.u_room_use_desc;
