SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nypres_mdsdb.change_request_final a
join nypres_mdwdb.f_change_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join nypres_mdwdb.d_incident c
on a.u_related_to_incident =c.row_id and a.sourceinstance=c.source_id
where coalesce(c.row_key,case when u_related_to_incident  is null then 0 else -1 end) <>b.related_to_incident_c_key;

