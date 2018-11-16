SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_program.PROGRAM_RISK_SRC_KEY' ELSE 'SUCCESS' END as Message

from (select * from  fidelity_mdsdb.hp_pgm_programs_final) SRC
left join fidelity_mdwdb.d_program TRGT
on SRC.program_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id

left join  fidelity_mdwdb.d_lov lkp
on concat('Program~Risk~',SRC.RISK_HEALTH)=lkp.row_id and SRC.sourceinstance=lkp.source_id
where coalesce(lkp.row_key,'')<>coalesce(TRGT.PROGRAM_RISK_SRC_KEY,'') 