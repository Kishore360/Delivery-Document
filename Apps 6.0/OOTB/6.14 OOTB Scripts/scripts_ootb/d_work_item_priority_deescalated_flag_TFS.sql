SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.priority_deescalated_flag' ELSE 'SUCCESS' END as Message

/*select SRC.system_id,
coalesce(case when SRC.final_de_flg like '%Y%' then 'Y' else 'N' end, 'N'), coalesce(TRGT.priority_deescalated_flag,'')*/
from 
(
select SRC_LKP.system_id, SRC_LKP.teamprojectsk, SRC_LKP.sourceinstance,
group_concat(SRC_LKP.de_flg separator ',') final_de_flg
from
(
select base.system_id, base.teamprojectsk, base.sourceinstance, base.microsoft_vsts_common_priority base_prio, next.microsoft_vsts_common_priority nxt_prio,
case when base.microsoft_vsts_common_priority > next.microsoft_vsts_common_priority then 'Y' else 'N' end de_flg
from
(
select SR.system_id, SR.teamprojectsk, SR.sourceinstance, SR.microsoft_vsts_common_priority, SR.System_Rev sys_rev
from #MDS_TABLE_SCHEMA.dimworkitem_final SR
) base
left join 
(
select SR.system_id, SR.teamprojectsk, SR.sourceinstance, SR.microsoft_vsts_common_priority, SR.System_Rev sys_rev
from #MDS_TABLE_SCHEMA.dimworkitem_final SR
) next
on base.system_id = next.system_id and base.teamprojectsk = next.teamprojectsk 
and base.sourceinstance = next.sourceinstance and base.sys_rev + 1 = next.sys_rev
) SRC_LKP
group by SRC_LKP.system_id, SRC_LKP.teamprojectsk, SRC_LKP.sourceinstance
) SRC
left join #DWH_TABLE_SCHEMA.d_work_item TRGT
ON CONCAT(SRC.System_Id, '~', SRC.TeamProjectSK)=TRGT.row_id 
and SRC.sourceinstance=TRGT.source_id
where coalesce(case when SRC.final_de_flg like '%Y%' then 'Y' else 'N' end, 'N') <> coalesce(TRGT.priority_deescalated_flag,'')