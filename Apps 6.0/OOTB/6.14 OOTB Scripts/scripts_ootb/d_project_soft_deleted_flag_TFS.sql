SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for d_project' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.dimteamproject_final SRC
left join #DWH_TABLE_SCHEMA.d_project TRGT 
ON (SRC.projectnodesk=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(case when SRC.cdctype = 'D' then 'Y' else 'N' end, 'N') <> COALESCE(TRGT.soft_deleted_flag ,'');