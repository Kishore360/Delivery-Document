SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for d_internal_contact' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.dimperson_final SRC
left join #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
ON (concat('INTERNAL_CONTACT~',SRC.personsk)=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(case when SRC.cdctype = 'D' THEN 'Y' ELSE 'N' END, 'N') <> COALESCE(TRGT.soft_deleted_flag, '');