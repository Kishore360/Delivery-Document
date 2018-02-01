SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM 
(select count(1) as cnt from
 aon_mdwdb.f_incident trgt 
join aon_mdsdb.incident_final inc on trgt.row_id  = inc.sys_id and trgt.source_id = inc.sourceinstance
left join (select a.documentkey, a.sourceinstance , a.oldvalue 
from aon_mdsdb.sys_audit_final a
join (select a.documentkey, a.sourceinstance, min(a.sys_created_on) as sys_created_on
from aon_mdsdb.sys_audit_final a
where a.tablename = 'incident' and a.fieldname = 'assignment_group'
group by 1,2) sa on a.documentkey = sa.documentkey and a.sourceinstance = sa.sourceinstance and a.sys_created_on = sa.sys_created_on
where a.tablename = 'incident' and a.fieldname = 'assignment_group') inc_ft on inc.sys_id = inc_ft.documentkey and inc.sourceinstance = inc_ft.sourceinstance
left join aon_mdwdb.d_internal_organization lkp on CONCAT('GROUP~',(case when inc_ft.documentkey is null then inc.assignment_group else inc_ft.oldvalue end)) = lkp.row_id and inc.sourceinstance = lkp.source_id and lkp.group_flag = 'Y'
where coalesce((case when (case when inc_ft.documentkey is null then inc.assignment_group else inc_ft.oldvalue end) is null then 0 else lkp.row_key end),-1) <>  trgt.opened_by_group_c_key)a ;
