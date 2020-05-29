SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_program.program_status_src_key' ELSE 'SUCCESS' END as Message
 from (select * from  #MDS_TABLE_SCHEMA.hp_pgm_programs_final) SRC
left join #DWH_TABLE_SCHEMA.d_program TRGT
on SRC.program_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_lov lkp
on concat('Program~Status~',SRC.STATE)= lkp.row_id and SRC.sourceinstance=lkp.source_id
where coalesce(lkp.row_key, case when SRC.STATE is null then 0 else -1 end, 0) <> coalesce(TRGT.program_status_src_key,0)