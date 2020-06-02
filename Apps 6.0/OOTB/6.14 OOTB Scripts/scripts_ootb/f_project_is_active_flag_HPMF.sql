SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project.is_active_flag' ELSE 'SUCCESS' END as Message
from (select * from   #MDS_TABLE_SCHEMA.hp_pm_projects_final) SRC

left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final SRC6
on SRC.PROJECT_ID = SRC6.PRJ_PROJECT_ID and SRC.sourceinstance = SRC6.sourceinstance
left join (select * from #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')SRC5
on SRC5.STAFFING_PROFILE_ID=SRC6.PRJ_STAFF_PROF_ID and SRC5.sourceinstance=SRC6.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN')SRC2 
ON SRC.PROJECT_ID=SRC2.PROJECT_ID 
AND SRC.sourceinstance=SRC2.sourceinstance

left join  #DWH_TABLE_SCHEMA.f_project TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map LKP
on TRGT.project_state_src_key = LKP.src_key and LKP.source_id=TRGT.source_id
 WHERE COALESCE(case when  LKP.dimension_wh_code IN ('IN PROGRESS') then 'Y'  else 'N' end,'')  <>COALESCE(TRGT.is_active_flag ,'')
