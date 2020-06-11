SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_resource_skill.row_count' ELSE 'SUCCESS' END as Message
from (select * from
 (select count(*) count_src,sourceinstance from #MDS_TABLE_SCHEMA.hp_rsc_skill_proficiency_final where PARENT_TYPE_CODE='RESOURCE' and cdctype<>'D') count_src,
 (select count(*) count_trgt,source_id from
 (select * from #MDS_TABLE_SCHEMA.hp_rsc_skill_proficiency_final where PARENT_TYPE_CODE='RESOURCE' and cdctype<>'D') sd
 left join (select count(*),source_id from  #DWH_TABLE_SCHEMA.f_resource_skill group by source_id)trgt
 on sd.sourceinstance=trgt.source_id)count_trgt
  where count_src.count_src <> count_trgt.count_trgt
   )SQ
 
 

 
 
 
