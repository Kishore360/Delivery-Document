SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.soft_deleted_flag' ELSE 'SUCCESS' END as Message
from (select *from  fidelity_mdsdb.hp_pm_projects_final) SRC
left join  fidelity_mdwdb.d_project TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END,'') <> COALESCE(TRGT.soft_deleted_flag ,'')