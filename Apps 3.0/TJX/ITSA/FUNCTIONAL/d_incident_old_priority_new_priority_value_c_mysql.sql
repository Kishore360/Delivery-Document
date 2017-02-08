SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from tjx_mdsdb.incident_final incf
inner join   tjx_mdwdb.d_incident TGT
on TGT.row_id=incf.sys_id and TGT.source_id=incf.sourceinstance
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
on asg.documentkey=src.documentkey
 
where TGT.new_priority_value_c <>  COALESCE(asg.newvalue,incf.priority,'UNSPECIFIED') or
TGT.old_priority_value_c <>COALESCE(asg.oldvalue,'UNSPECIFIED') )b



