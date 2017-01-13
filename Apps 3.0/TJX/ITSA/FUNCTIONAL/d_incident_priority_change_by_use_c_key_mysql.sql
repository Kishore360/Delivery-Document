SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from tjx_mdwdb.d_incident TGT
inner join  tjx_mdsdb.incident_final incf
on TGT.row_id=incf.sys_id
inner join (select documentkey,user,max(sys_created_on) as sys_created_on,newvalue,oldvalue , fieldname from tjx_mdsdb.sys_audit_final  
where fieldname = ('assigned_to') and tablename='incident' group by documentkey) src1 on src1.documentkey=incf.sys_id
inner join (select documentkey,user,max(sys_created_on) as sys_created_on,newvalue,oldvalue , fieldname from tjx_mdsdb.sys_audit_final  
where fieldname = ('assignment_group') and tablename='incident' group by documentkey) src on src.documentkey=incf.sys_id
inner join ( select documentkey,user,max(sys_created_on) as sys_created_on,newvalue,oldvalue , fieldname from tjx_mdsdb.sys_audit_final  
where fieldname in ('priority') and tablename='incident' group by documentkey) asg
on asg.documentkey=src.documentkey 
where priority_change_by_use_c_key <> coalesce(TGT.row_key,case when coalesce(src.oldvalue,incf.assigned_to) is null then 0 else -1 end  ) 
and src.sys_created_on <= asg.sys_created_on )b

