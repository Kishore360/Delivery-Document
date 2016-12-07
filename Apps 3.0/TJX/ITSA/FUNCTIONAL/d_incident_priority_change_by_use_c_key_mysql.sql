SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from 
 tjx_mdsdb.incident_final incf
inner join (select documentkey,user,sys_created_on,newvalue,oldvalue , fieldname from tjx_mdsdb.sys_audit_final  
where fieldname = ('assignment_group') and tablename='incident') src on src.documentkey=incf.sys_id
inner join ( select documentkey,user,sys_created_on,newvalue,oldvalue , fieldname from tjx_mdsdb.sys_audit_final  
where fieldname in ('priority') and tablename='incident' ) asg
on asg.documentkey=src.documentkey
left join (select sys_id,user_name from tjx_mdsdb.sys_user_final) sf on  sf.user_name = asg.user 
left join tjx_mdwdb.d_internal_contact TGT1
on TGT1.row_id = coalesce(concat('INTERNAL_CONTACT~',sf.sys_id),'UNSPECIFIED')
inner join tjx_mdwdb.d_incident TGT on TGT.row_id=incf.sys_id and incf.sourceinstance=TGT.source_id
where priority_change_by_use_c_key <> coalesce(TGT.row_key,case when sf.sys_id is null then 0 else -1 end  )
and src.sys_created_on <= asg.sys_created_on )b


