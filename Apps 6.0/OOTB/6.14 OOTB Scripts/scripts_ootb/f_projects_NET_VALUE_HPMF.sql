SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project.NET_VALUE' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype <> 'D') SRC1
left join (select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC2
ON SRC1.PROJECT_ID=SRC2.PRJ_PROJECT_ID and SRC1.sourceinstance=SRC2.sourceinstance

left join (select * from #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')SRC5
on SRC5.STAFFING_PROFILE_ID=SRC2.PRJ_STAFF_PROF_ID and SRC5.sourceinstance=SRC2.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN')SRC3 
ON SRC1.PROJECT_ID=SRC3.PROJECT_ID AND SRC1.sourceinstance=SRC3.sourceinstance

left join #DWH_TABLE_SCHEMA.f_project TRGT
on SRC1.project_id=TRGT.row_id
and SRC1.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC2.PRJ_NET_PRESENT_VALUE,0)
<> COALESCE(TRGT.NET_VALUE ,'');