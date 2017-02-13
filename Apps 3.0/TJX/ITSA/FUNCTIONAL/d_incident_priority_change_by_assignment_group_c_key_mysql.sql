SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.'
ELSE 'Data Matched' END AS Message ,cnt
FROM (
select count(*) as cnt
from tjx_mdwdb.d_incident TGT
inner join  tjx_mdsdb.incident_final incf on TGT.row_id=incf.sys_id and TGT.source_id = incf.sourceinstance
left join (select saf.documentkey,saf.sourceinstance,saf.newvalue,saf.oldvalue,saf.sys_created_on
from   (select asg.documentkey, max(asg.sys_created_on) sys_created_on
from   (select documentkey,max(sys_created_on) mxsys_created_on from tjx_mdsdb.sys_audit_final
where  tablename = 'incident' and fieldname = 'priority'
group  by documentkey) prt
join (select documentkey, sys_created_on,oldvalue,newvalue from tjx_mdsdb.sys_audit_final
 where  tablename = 'incident' and fieldname = 'assignment_group') asg
on prt.documentkey = asg.documentkey and prt.mxsys_created_on > asg.sys_created_on
group  by asg.documentkey) tmp
join tjx_mdsdb.sys_audit_final saf
on saf.documentkey = tmp.documentkey and tmp.sys_created_on = saf.sys_created_on
where  saf.tablename = 'incident' and saf.fieldname = 'assignment_group') as pasg
on pasg.documentkey=TGT.row_id and pasg.sourceinstance = TGT.source_id
left join tjx_mdwdb.d_internal_organization LKP on LKP.row_id = coalesce(concat('GROUP~',coalesce(pasg.newvalue,pasg.oldvalue,incf.assignment_group)),'UNSPECIFIED') AND LKP.source_id=TGT.source_id
where TGT.priority_change_by_assignment_group_c_key <> coalesce(LKP.row_key,case when coalesce(pasg.newvalue,pasg.oldvalue,incf.assignment_group) is null then 0 else -1 end)
) b;
