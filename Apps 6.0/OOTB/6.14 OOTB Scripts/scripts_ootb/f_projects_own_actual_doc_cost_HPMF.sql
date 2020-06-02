SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project.project_key' ELSE 'SUCCESS' END as Message
from (select * from   #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype <> 'D') SRC

left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final SRC6
on SRC.PROJECT_ID = SRC6.PRJ_PROJECT_ID and SRC.sourceinstance = SRC6.sourceinstance
left join (select * from #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')SRC5
on SRC5.STAFFING_PROFILE_ID=SRC6.PRJ_STAFF_PROF_ID and SRC5.sourceinstance=SRC6.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN')SRC3 
ON SRC.PROJECT_ID=SRC3.PROJECT_ID 
AND SRC.sourceinstance=SRC3.sourceinstance

left join   #DWH_TABLE_SCHEMA.f_project TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join (select * from  #DWH_TABLE_SCHEMA.d_project) SRC2
on SRC2.row_id = SRC.project_id 
and SRC2.source_id = SRC.sourceinstance
where (case when SRC2.is_leaf_flag='Y' then TRGT.total_actual_doc_cost 
when SRC2.is_leaf_flag='N' then 0 end)<>COALESCE(TRGT.own_actual_doc_cost,0)



