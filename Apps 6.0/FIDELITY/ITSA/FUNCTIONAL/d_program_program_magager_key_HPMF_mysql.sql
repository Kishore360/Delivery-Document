
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_program.PROGRAM_MANAGER_KEY' ELSE 'SUCCESS' END as Message
from (select * from  fidelity_mdsdb.hp_pgm_programs_final) SRC
left join ( select * from  fidelity_mdsdb.hp_kcrt_fg_pfm_program_final ) SRC1
on SRC.pgm_request_id = SRC1.request_id
left join fidelity_mdwdb.d_program TRGT
on SRC.program_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC1.pgm_program_manager_user_id,'') <> coalesce(TRGT.PROGRAM_MANAGER_KEY,'')