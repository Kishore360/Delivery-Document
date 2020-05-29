SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project.PORTFOLIO_KEY' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype <> 'D') SRC1
left join (select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC2
on SRC1.PROJECT_ID=SRC2.PRJ_PROJECT_ID and SRC1.sourceinstance=SRC2.sourceinstance
left join (select * from #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')SRC11
on SRC11.STAFFING_PROFILE_ID=SRC2.PRJ_STAFF_PROF_ID and SRC11.sourceinstance=SRC2.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN')SRC4
ON SRC1.PROJECT_ID=SRC4.PROJECT_ID AND SRC1.sourceinstance=SRC4.sourceinstance
left join #DWH_TABLE_SCHEMA.f_project TRGT
on SRC1.project_id=TRGT.row_id
and SRC1.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_portfolio SRC3
on SRC2.PRJ_PORTFOLIO_ID = SRC3.row_id
and SRC2.sourceinstance=SRC3.source_id
WHERE COALESCE(SRC3.row_key,CASE WHEN SRC2.PRJ_PORTFOLIO_ID IS NULL THEN 0 else '-1' end)
<> COALESCE(TRGT.PORTFOLIO_KEY ,'');
