SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for d_iteration' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.dimiteration_final SRC
left join #DWH_TABLE_SCHEMA.d_iteration TRGT 
ON (SRC.iterationsk=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(case when SRC.cdctype='D' THEN 'Y' ELSE 'N' END, '') <> COALESCE(TRGT.soft_deleted_flag, '');