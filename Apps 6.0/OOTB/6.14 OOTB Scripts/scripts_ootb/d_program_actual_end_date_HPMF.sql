SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_program.ACTUAL_END_DATE' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_pgm_programs_final) SRC
inner join (select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_program_final)SRC1
on SRC.pgm_request_id = SRC1.request_id
left join  #DWH_TABLE_SCHEMA.d_program TRGT
on SRC.program_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(convert_tz(SRC1.PGM_ACTUAL_FINISH_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')
<> coalesce(TRGT.ACTUAL_END_DATE,'') 