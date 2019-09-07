SELECT
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.kb_knowledge_c_key' ELSE 'SUCCESS' END as Message
from(
select count(1) cnt  from
keybank_mdwdb.f_incident inci
JOIN keybank_mdsdb.incident_final ci
on ci.sys_id  = inci.row_id and ci.sourceinstance  = inci.source_id
left join keybank_mdwdb.d_kb_knowledge_c d
on COALESCE(ci.u_knowledge_used,'UNSPECIFIED')=d.row_id
where d.soft_deleted_flag='N' and inci.kb_knowledge_c_key <> coalesce(d.row_key,case when ci.u_knowledge_used is null then 0 else -1 end)
and ci.cdctype<>'D')a


