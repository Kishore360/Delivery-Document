 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select case when locate('Y',b.res)>0 then 'Y' else 'N' end as priority_escalation,c.sys_id,
d.priority_escalated_flag as target from (
select group_concat(a.flag) as res,a.documentkey from (
select case when newvalue<oldvalue then 'Y' else 'N' end as flag,documentkey from weillcornell_mdsdb.sys_audit_final 
 where
tablename = 'incident' 
AND fieldname =  'priority' and oldvalue is not null and newvalue is not null
)a group by a.documentkey
)b
 join weillcornell_mdsdb.incident_final c on b.documentkey=c.sys_id and  c.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' ) 
join weillcornell_mdwdb.d_incident d on c.sys_id = d.row_id and c.sourceinstance = d. source_id
) e where priority_escalation<>target
 



