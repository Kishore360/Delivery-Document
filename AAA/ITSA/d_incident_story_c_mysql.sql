SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aaa_mdsdb.incident_final a
left join aaa_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join aaa_mdsdb.rm_story_final d
on a.u_story=d.sys_id and d.sourceinstance=a.sourceinstance
where b.story_c<>coalesce(d.short_description,'No story found');