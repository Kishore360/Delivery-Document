SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_risk_src_id' ELSE 'SUCCESS' END as Message
FROM ( select * from itpa_l_dev_mdsdb.hp_pm_projects_final where cdctype='D')SRC1
left join (select * from itpa_l_dev_mdsdb.hp_pm_project_rollup_final) SRC2
on SRC1.rollup_id=SRC2.rollup_id
and SRC1.sourceinstance=SRC2.sourceinstance
left join (select * from itpa_l_dev_mdsdb.hp_kcrt_fg_pfm_project_final )SRC3
on SRC2.overall_health_indicator=SRC3.project_health_code
left join itpa_l_dev_mdwdb.d_project TRGT
on SRC1.project_id=TRGT.row_id
and SRC1.sourceinstance=TRGT.source_id
left join itpa_l_dev_mdwdb.d_lov LKP
on concat('Project~Risk~',SRC3.PROJECT_HEALTH_CODE)=LKP.row_id
and SRC1.sourceinstance=LKP.source_id
where coalesce(LKP.row_key,CASE WHEN SRC.status IS NULL THEN 0 else '-1' end)<>coalesce(TRGT.PROJECT_RISK_SRC_KEY,'')