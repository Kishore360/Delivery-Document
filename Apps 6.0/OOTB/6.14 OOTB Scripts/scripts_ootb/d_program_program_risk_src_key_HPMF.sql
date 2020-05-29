SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_program.PROGRAM_RISK_SRC_KEY' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_pgm_programs_final) SRC
left join #DWH_TABLE_SCHEMA.d_program TRGT
on SRC.program_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_lov lkp
on concat('Program~Risk~',SRC.OVERALL_HEALTH)=lkp.row_id and SRC.sourceinstance=lkp.source_id
where coalesce(lkp.row_key, case when SRC.OVERALL_HEALTH is null then 0 else -1 end , '')<>coalesce(TRGT.PROGRAM_RISK_SRC_KEY,'');