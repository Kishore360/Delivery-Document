SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message ,cnt
FROM (
select count(*) as cnt from tjx_mdwdb.d_incident TGT 
inner join  tjx_mdsdb.incident_final incf on TGT.row_id=incf.sys_id and TGT.source_id = incf.sourceinstance
left join (select a.sourceinstance,a.documentkey,a.newvalue,a.oldvalue,a.user from  tjx_mdsdb.sys_audit_final a 
                                                join (select documentkey, max(sys_created_on) as sys_created_on from tjx_mdsdb.sys_audit_final where tablename='incident' and fieldname = 'priority' 
                                                group by documentkey) rec on a.documentkey = rec.documentkey and  a.sys_created_on = rec.sys_created_on
                                where  tablename='incident' and fieldname = 'priority' ) as pon
on  pon.documentkey=TGT.row_id and pon.sourceinstance = TGT.source_id
left join (select a.sys_id,a.user_name,a.sourceinstance from tjx_mdsdb.sys_user_final a join (select max(sys_updated_on) sys_updated_on,user_name from tjx_mdsdb.sys_user_final group by user_name) as b 
on a.sys_updated_on = b.sys_updated_on  and a.user_name = b.user_name) pcu on  pcu.user_name = pon.user
left join tjx_mdwdb.d_internal_contact LKP on LKP.row_id = coalesce(concat('INTERNAL_CONTACT~',pcu.sys_id),'UNSPECIFIED') AND LKP.source_id=pcu.sourceinstance
where TGT.priority_change_by_use_c_key <> coalesce(LKP.row_key,case when pcu.sys_id is null then 0 else -1 end)
) b;
