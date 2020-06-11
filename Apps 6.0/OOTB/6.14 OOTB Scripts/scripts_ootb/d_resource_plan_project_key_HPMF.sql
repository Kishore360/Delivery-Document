SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_plan.PROJECT_KEY' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_rsc_positions_final where cdctype<>'D') SRC
left join (select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC1
on SRC1.PRJ_STAFF_PROF_ID=SRC.STAFFING_PROFILE_ID
and SRC1.sourceinstance=SRC.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_resource_plan TRGT
on concat('POSITION~',SRC.position_id)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_project LKP
on SRC1.PRJ_PROJECT_ID=LKP.row_id
and SRC1.sourceinstance=LKP.source_id
where coalesce(LKP.row_key,case when SRC1.PRJ_PROJECT_ID is null then 0 else 1 end)<>coalesce(TRGT.PROJECT_KEY,0);