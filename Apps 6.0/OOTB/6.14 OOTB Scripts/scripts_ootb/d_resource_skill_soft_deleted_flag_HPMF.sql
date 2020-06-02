SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_skill.soft_deleted_flag' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_rsc_skills_nls_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_resource_skill TRGT
on SRC.skill_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(case when SRC.cdctype='D' then 'Y' else 'N' end,'')<>coalesce(TRGT.soft_deleted_flag,'')