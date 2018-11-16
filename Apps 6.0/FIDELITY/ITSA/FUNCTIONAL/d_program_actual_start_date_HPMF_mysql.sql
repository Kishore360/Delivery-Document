SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_program.ACTUAL_START_DATE' ELSE 'SUCCESS' END as Message
from (select *from  fidelity_mdsdb.hp_pgm_programs_final) SRC
inner join (select * from fidelity_mdsdb.hp_kcrt_fg_pfm_program_final)SRC1
on SRC.pgm_request_id = SRC1.request_id
left join  fidelity_mdwdb.d_program TRGT
on SRC.program_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(convert_tz(SRC1.PGM_ACTUAL_START_DATE,'GMT','America/New_York'),'')
<> coalesce(TRGT.ACTUAL_START_DATE,'') 