SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from 
  tjx_mdsdb.incident_final incf
inner join tjx_mdwdb.d_incident TGT
on TGT.row_id=incf.sys_id
inner join (select documentkey,user,sys_created_on,newvalue,oldvalue , fieldname from tjx_mdsdb.sys_audit_final  
where fieldname = ('assignment_group') and tablename='incident') src on src.documentkey=incf.sys_id
inner join ( select documentkey,user,sys_created_on,newvalue,oldvalue , fieldname from tjx_mdsdb.sys_audit_final  
where fieldname in ('priority') and tablename='incident' ) asg
on asg.documentkey=src.documentkey
left join (select sys_id,user_name,sourceinstance from tjx_mdsdb.sys_user_final) sf on  sf.user_name = asg.user 
join tjx_mdwdb.d_internal_contact dic on  coalesce(concat('INTERNAL_CONTACT~',sf.sys_id),'UNSPECIFIED') =dic.row_id and sf.sourceinstance=dic.source_id
where priority_change_by_use_c_key <> TGT.row_key
and src.sys_created_on <= asg.sys_created_on )b