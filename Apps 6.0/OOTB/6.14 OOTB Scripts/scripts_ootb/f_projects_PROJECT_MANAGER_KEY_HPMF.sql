SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project.PROJECT_MANAGER_KEY' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype <> 'D') SRC1
left join (select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC2
on SRC1.PROJECT_ID=SRC2.PRJ_PROJECT_ID and SRC1.sourceinstance=SRC2.sourceinstance

left join (select * from #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')SRC5
on SRC5.STAFFING_PROFILE_ID=SRC2.PRJ_STAFF_PROF_ID and SRC5.sourceinstance=SRC2.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN')SRC7
ON SRC1.PROJECT_ID=SRC7.PROJECT_ID AND SRC1.sourceinstance=SRC7.sourceinstance

left join #DWH_TABLE_SCHEMA.f_project TRGT
on SRC1.project_id=TRGT.row_id
and SRC1.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_internal_contact SRC3
on COALESCE(CONCAT('INTERNAL_CONTACT~',
IF(POSITION('#' IN SRC2.PRJ_PROJECT_MANAGER_USER_ID) = 0, SRC2.PRJ_PROJECT_MANAGER_USER_ID, 
	SUBSTRING(SRC2.PRJ_PROJECT_MANAGER_USER_ID,1,POSITION('#' IN SRC2.PRJ_PROJECT_MANAGER_USER_ID)-1))
),'UNSPECIFIED') = SRC3.row_id
and SRC2.sourceinstance=SRC3.source_id
WHERE COALESCE(SRC3.row_key,CASE WHEN SRC2.PRJ_PROJECT_MANAGER_USER_ID IS NULL THEN 0 else '-1' end)
<> COALESCE(TRGT.PROJECT_MANAGER_KEY ,'');