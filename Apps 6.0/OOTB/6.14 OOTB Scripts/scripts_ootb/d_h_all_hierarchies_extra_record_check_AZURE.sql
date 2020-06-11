SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'd_h_all_hierarchies is having more records than the Source table' ELSE 'SUCCESS' END as Message
FROM 
(select TRGT.row_id, TRGT.lev_0_id, TRGT.lev_1_id, TRGT.lev_2_id, TRGT.lev_3_id, TRGT.lev_4_id, 
TRGT.lev_5_id, TRGT.lev_6_id, TRGT.soft_deleted_flag, TRGT.etl_run_number from #DWH_TABLE_SCHEMA.d_h_all_hierarchies TRGT
where TRGT.row_id like '%WORK_ITEM' and 
(row_id, source_id) not in 
(
select sys_id,sourceinstance from #STG_TABLE_SCHEMA.hier_base
)
and TRGT.soft_deleted_flag = 'N') base;