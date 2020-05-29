SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.is_in_schedule_flag' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.blz_project_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_project TRGT
on SRC.id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where COALESCE(TRGT.is_in_schedule_flag,'')<>'N'