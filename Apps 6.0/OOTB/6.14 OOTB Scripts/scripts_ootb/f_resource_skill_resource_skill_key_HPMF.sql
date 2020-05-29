SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_resource_skill.resource_skill_key' ELSE 'SUCCESS' END as Message
 from (select * from  #MDS_TABLE_SCHEMA.hp_rsc_skill_proficiency_final where PARENT_TYPE_CODE='RESOURCE' and cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_resource_skill TRGT
on SRC.skill_proficiency_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_resource_skill lkp
on SRC.skill_id=lkp.row_id  and SRC.sourceinstance=lkp.source_id
where coalesce(lkp.row_key, case when SRC.skill_id is null then 0 else -1 end,'')<>coalesce(TRGT.resource_skill_key,'')