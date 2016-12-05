select 
case 

when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),' ; Target Count : ',sum(trgt_not_null_count)) end Result

from 
(select 
case when src.age is not null then 1 else 0 end as src_not_null_count,

case when trgt.age is not null then 1 else 0 end as trgt_not_null_count,

case when COALESCE(src.age,0) <> COALESCE(trgt.age,0) then src.sys_id else '' end as failures,

case when COALESCE(src.age,0) <> COALESCE(trgt.age,0) then 1 else 0 end as failures_cnt
from 
(select 
kb.sys_id,kb.sourceinstance,
case 
when sc_kb.label = 'Retired' then COALESCE(case when timestampdiff(second,kb.sys_created_on,COALESCE(src_sa.retired_on,kb.retired)) <= 0 then 0 else timestampdiff(second,kb.sys_created_on,COALESCE(src_sa.retired_on,kb.retired)) end ,0)
when sc_kb.label <> 'Retired' then COALESCE(case when timestampdiff(second,kb.sys_created_on,lastupdated) <=0 then 0 else timestampdiff(second,kb.sys_created_on,lastupdated) end ,0)
else 0 end as age
from molinahealth_mdsdb.kb_knowledge_final kb
join molinahealth_mdsdb.sys_choice_final sc_kb on kb.workflow_state = sc_kb.value and sc_kb.name = 'kb_knowledge' and sc_kb.element = 'workflow_state'
left join 
(select documentkey,
max(case when sc.label = 'Retired' then sa.sys_created_on else null end) as retired_on
from 
(select documentkey,oldvalue,newvalue,sys_created_on 
from molinahealth_mdsdb.sys_audit_final
where tablename = 'kb_knowledge' and fieldname = 'workflow_state' )sa
join molinahealth_mdsdb.sys_choice_final sc on sa.newvalue = sc.value and sc.name = 'kb_knowledge' and sc.element = 'workflow_state'
group by documentkey) src_sa on kb.sys_id = src_sa.documentkey 
left join (select source_id,convert_tz(max(lastupdated),'America/Los_Angeles','UTC') as lastupdated from molinahealth_mdwdb.d_o_data_freshness group by source_id) odf on kb.sourceinstance = odf.source_id ) src 
left join molinahealth_mdwdb.f_kb_knowledge_c trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance) fnl ;