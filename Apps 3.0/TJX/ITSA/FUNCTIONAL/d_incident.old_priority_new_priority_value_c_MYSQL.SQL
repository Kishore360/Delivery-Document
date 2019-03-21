select case when cnt > 0 then 'failure' else 'success' end as result
,case when cnt > 0 then 'data did not match.' 
else 'data matched' end as message 
from (select count(1) as cnt from tjx_mdsdb.incident_final incf
inner join   tjx_mdwdb.d_incident tgt on tgt.row_id=incf.sys_id and tgt.source_id=incf.sourceinstance
left join (select a.sourceinstance,a.documentkey,a.newvalue,a.oldvalue,a.user from  tjx_mdsdb.sys_audit_final a 
   join (select documentkey, max(sys_created_on) as sys_created_on from tjx_mdsdb.sys_audit_final where tablename='incident' 
   and fieldname = 'priority' 
group by documentkey) rec on a.documentkey = rec.documentkey and  a.sys_created_on = rec.sys_created_on
where  tablename='incident' and fieldname = 'priority') as pon
on  pon.documentkey=tgt.row_id and pon.sourceinstance = tgt.source_id                             
where tgt.new_priority_value_c <>  coalesce(pon.newvalue,incf.priority,'unspecified') or
tgt.old_priority_value_c <> coalesce(pon.oldvalue,'unspecified') and tgt.soft_deleted_flag<>'Y')b;
