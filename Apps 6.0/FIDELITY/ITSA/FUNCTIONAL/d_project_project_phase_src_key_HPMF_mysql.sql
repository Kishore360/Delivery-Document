SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.PROJECT_PHASE_SRC_KEY' ELSE 'SUCCESS' END as Message
from (select * from  fidelity_mdsdb.hp_pm_projects_final) SRC
inner join (select * from  fidelity_mdsdb.hp_kcrt_fg_pfm_project_final)SRC1
on SRC1.prj_project_id = SRC.project_id
left join  fidelity_mdwdb.d_project TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.PRJ_PHASE_CODE,'')<>coalesce(TRGT.PROJECT_PHASE_SRC_KEY,'')