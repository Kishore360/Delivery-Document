SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.PROJECT_RISK_SRC_KEY' ELSE 'SUCCESS' END as Message
from (select * from #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D')SRC1
left join (select * from #MDS_TABLE_SCHEMA.hp_pm_project_rollup_final) SRC2
on SRC1.rollup_id=SRC2.rollup_id
and SRC1.sourceinstance=SRC2.sourceinstance
left join (select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final )SRC3
on SRC2.overall_health_indicator=SRC3.project_health_code
and SRC2.sourceinstance=SRC3.sourceinstance
inner join #DWH_TABLE_SCHEMA.d_project TRGT
on SRC1.project_id=TRGT.row_id
and SRC1.sourceinstance=TRGT.source_id
inner join #DWH_TABLE_SCHEMA.d_lov LKP
on concat('PROJECT~RISK','~',SRC3.PROJECT_HEALTH_CODE)=LKP.row_id
and SRC1.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC3.PROJECT_HEALTH_CODE IS NULL THEN 0 else '-1' end)
<> COALESCE(TRGT.PROJECT_RISK_SRC_KEY ,'');