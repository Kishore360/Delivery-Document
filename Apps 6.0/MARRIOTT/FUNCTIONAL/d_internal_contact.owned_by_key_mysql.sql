select CASE WHEN count(1)>1  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)>1
THEN 'MDS to DWH data validation failed for d_internal_contact.owned_by_key' ELSE 'SUCCESS' END as Message
from   marriott_mdsdb.cmdb_ci_final sg 
left join marriott_mdwdb.d_configuration_item t  on t.row_id=sg.sys_id and t.source_id=sg.sourceinstance
left join marriott_mdwdb.d_internal_contact d on concat('INTERNAL_CONTACT~',sg.owned_by)=d.row_id 
where sg.cdctype<>'D' and 
owned_by_key<>coalesce(d.row_key,case when sg.owned_by is null then 0 else -1 end);