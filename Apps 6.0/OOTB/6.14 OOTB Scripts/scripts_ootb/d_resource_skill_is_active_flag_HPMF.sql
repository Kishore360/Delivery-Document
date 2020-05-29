SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_skill.is_active_flag' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_rsc_skills_nls_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_resource_skill TRGT
on SRC.skill_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.IS_ENABLED_FLAG,'') <> COALESCE(TRGT.is_active_flag ,'');