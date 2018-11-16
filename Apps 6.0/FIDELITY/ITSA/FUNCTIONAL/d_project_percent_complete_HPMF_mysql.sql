SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.percent_complete' ELSE 'SUCCESS' END as Message
from (select * from  fidelity_mdsdb.hp_pm_projects_final) SRC
inner join (select * from  fidelity_mdsdb.hp_kcrt_requests_final)SRC1
on SRC1.request_id=SRC.pfm_request_id
left join  fidelity_mdwdb.d_project TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.percent_complete,'')<>coalesce(TRGT.percent_complete,'')