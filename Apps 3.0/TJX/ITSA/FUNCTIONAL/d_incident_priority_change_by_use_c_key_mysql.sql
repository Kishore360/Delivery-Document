SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from 
tjx_mdsdb.incident_final incf
inner join tjx_mdwdb.d_incident TGT
on TGT.row_id=incf.sys_id
left join (select a.documentkey,user,newvalue,oldvalue , fieldname,a.sys_created_on from  tjx_mdsdb.sys_audit_final a 
 join (select documentkey , max(sys_created_on) as sys_created_on
from tjx_mdsdb.sys_audit_final 
 where fieldname in ('assignment_group') and tablename='incident'
group by 1) max
on max.sys_created_on = a.sys_created_on and a.documentkey = max.documentkey
where  fieldname in ('assignment_group') and tablename='incident') src on src.documentkey=incf.sys_id
left join ( select a.documentkey,user,newvalue,oldvalue , fieldname,a.sys_created_on from  tjx_mdsdb.sys_audit_final a 
 join (select documentkey , max(sys_created_on) as sys_created_on
from tjx_mdsdb.sys_audit_final 
 where fieldname in ('priority') and tablename='incident'
group by 1) max
on max.sys_created_on = a.sys_created_on and a.documentkey = max.documentkey
where  fieldname in ('priority') and tablename='incident') asg
on asg.documentkey=src.documentkey left 
join (select sys_id,user_name,sourceinstance from tjx_mdsdb.sys_user_final) sf on  sf.user_name = asg.user 
join tjx_mdwdb.d_internal_contact dic on  coalesce(concat('INTERNAL_CONTACT~',sf.sys_id),'UNSPECIFIED') =dic.row_id and sf.sourceinstance=dic.source_id
where priority_change_by_use_c_key <> TGT.row_key)b