SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
from
equifax_mdsdb.cmdb_ci_final a
join
equifax_mdwdb.f_configuration_item_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
join
equifax_mdwdb.d_configuration_item c
on a.sys_id=c.row_id
where  coalesce(c.row_key,case when a.sys_id is null then 0 else -1 end ) <> b.configuration_item_key)b