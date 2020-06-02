SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_program.PROGRAM_MANAGER_KEY' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_pgm_programs_final) SRC
left join ( select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_program_final ) SRC1
on SRC.pgm_request_id = SRC1.request_id
left join #DWH_TABLE_SCHEMA.d_program TRGT
on SRC.program_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join(select * from #DWH_TABLE_SCHEMA.d_internal_contact)LKP
on  concat('INTERNAL_CONTACT~',SRC1.pgm_program_manager_user_id)=LKP.row_id
and SRC.sourceinstance=LKP.source_id
where COALESCE(LKP.row_key, case when SRC1.pgm_program_manager_user_id is null then 0 else -1 end) <> coalesce(TRGT.PROGRAM_MANAGER_KEY,0)