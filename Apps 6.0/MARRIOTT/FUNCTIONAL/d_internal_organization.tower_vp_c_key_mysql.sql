select CASE WHEN count(1)>1  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)>1
THEN 'MDS to DWH data validation failed for d_internal_organization.tower_vp_c_key' ELSE 'SUCCESS' END as Message
from   marriott_mdsdb.sys_user_group_final sg 
left join marriott_mdwdb.d_internal_organization t  on t.row_id=concat('GROUP~',sg.sys_id) and t.source_id=sg.sourceinstance
left join marriott_mdwdb.d_internal_contact d on concat('INTERNAL_CONTACT~',sg.u_tower_vp)=d.row_id 
where sg.cdctype<>'D' and 
tower_vp_c_key<>coalesce(d.row_key,case when sg.u_tower_vp is null then 0 else -1 end);