SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_program.row_id' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_pgm_programs_final) SRC
left join  #DWH_TABLE_SCHEMA.d_program TRGT
on SRC.program_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.program_id,'')<>coalesce(TRGT.row_id,'')