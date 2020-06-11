SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.soft_deleted_flag' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.blz_project_final) SRC
left join  #DWH_TABLE_SCHEMA.d_project TRGT
on SRC.id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END,'') <> COALESCE(TRGT.soft_deleted_flag ,'')
