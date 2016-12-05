SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (SELECT count(1) cnt
FROM 
tjx_mdsdb.incident_final incf
inner join 
(select documentkey,user,sys_created_on,newvalue,oldvalue , fieldname from tjx_mdsdb.sys_audit_final  
where fieldname = ('assignment_group') and tablename='incident') src 
on src.documentkey=incf.sys_id
inner join ( select documentkey,user,sys_created_on,newvalue,oldvalue , fieldname from tjx_mdsdb.sys_audit_final  
where fieldname in ('priority') and tablename='incident' ) asg
on asg.documentkey=src.documentkey
left join (select sys_id,user_name from tjx_mdsdb.sys_user_final) sf 
on  sf.user_name = asg.user 
inner join tjx_mdwdb.d_incident TGT1 on TGT1.row_id=incf.sys_id and incf.sourceinstance=TGT1.source_id
where TGT1.new_priority_value_c <> asg.newvalue or
TGT1.old_priority_value_c <>asg.oldvalue or
TGT1.priority_downgraded_c_flag <> case when (asg.newvalue is not null and asg.oldvalue is not null) then 
case when  asg.newvalue > asg.oldvalue then 'Y' else 'N' END END
and src.sys_created_on <= asg.sys_created_on )b


