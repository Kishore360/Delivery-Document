SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0
 THEN 'MDS to DWH data validation failed for kb_knowledge_c_key' ELSE 'SUCCESS' END as Message

from(
select count(1) cnt  from
keybank_mdwdb.f_incident_templates_factless_c inci
left JOIN keybank_mdwdb.d_incident a 

on inci.templates_incident_c_key=a.row_key
 left join keybank_mdsdb.incident_final b
 on a.row_id=b.sys_id and 
a.source_id=b.sourceinstance
 left join keybank_mdwdb.d_sys_template_c c on c.row_key=inci.sys_template_c_key 

left join keybank_mdsdb.sys_template_final d on d.sys_id=c.row_id and c.source_id=d.sourceinstance
where
 inci.soft_deleted_flag='N' and inci.templates_incident_c_key <> coalesce(a.row_key,case when b.u_templates_used is
 null then 0 else -1 end)
and b.cdctype<>'D')a





