select 
case 

when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),' ; Target Count : ',sum(trgt_not_null_count)) end Result

from 
(select 
case when timestampdiff(second,src.reviewed_on,src.published) is not null then 1 else 0 end as src_not_null_count,

case when trgt.review_to_publish_duration is not null then 1 else 0 end as trgt_not_null_count,

case when COALESCE(CASE WHEN timestampdiff(second,src.reviewed_on,src.published)<=0 then 0 else timestampdiff(second,src.reviewed_on,src.published) end ,0) <> COALESCE(trgt.review_to_publish_duration,0) then src.sys_id else '' end as failures,

case when COALESCE(CASE WHEN timestampdiff(second,src.reviewed_on,src.published) <= 0 then 0 else timestampdiff(second,src.reviewed_on,src.published) end ,0) <> COALESCE(trgt.review_to_publish_duration,0) then 1 else 0 end as failures_cnt
from 
(select sys_id,sourceinstance,COALESCE(drafted_on,convert_tz(kb.sys_created_on,'UTC','America/Los_Angeles')) as drafted,reviewed_on,provisional_published_on,COALESCE(published_on,kb.published) as published,COALESCE(retired_on,kb.retired) as retired_on
from molinahealth_mdsdb.kb_knowledge_final kb 
left join 
(select documentkey,
max(case when sc.label = 'Review' then CONVERT_TZ(sa.sys_created_on,'UTC','America/Los_Angeles') else null end)  as reviewed_on,
max(case when sc.label = 'Draft' then CONVERT_TZ(sa.sys_created_on,'UTC','America/Los_Angeles') else null end)  as drafted_on,
max(case when sc.label = 'Provisionally Published' then CONVERT_TZ(sa.sys_created_on,'UTC','America/Los_Angeles') else null end)  as provisional_published_on,
max(case when sc.label = 'Published' then CONVERT_TZ(sa.sys_created_on,'UTC','America/Los_Angeles') else null  end)  as published_on,
max(case when sc.label = 'Retired' then CONVERT_TZ(sa.sys_created_on,'UTC','America/Los_Angeles') else null end) as retired_on
from 
(select documentkey,oldvalue,newvalue,sys_created_on 
from molinahealth_mdsdb.sys_audit_final
where tablename = 'kb_knowledge' and fieldname = 'workflow_state' )sa
join molinahealth_mdsdb.sys_choice_final sc on sa.newvalue = sc.value and sc.name = 'kb_knowledge' and sc.element = 'workflow_state'
group by documentkey) src_sa on kb.sys_id = src_sa.documentkey ) src
left join molinahealth_mdwdb.f_kb_knowledge_c trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance) fnl ;