SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'd_h_all_hierarchies is having more records than the Source table' ELSE 'SUCCESS' END as Message
FROM 
(select TRGT.behavior, TRGT.start_node_key, TRGT.lev_0_rel_key, TRGT.lev_1_key, TRGT.lev_1_rel_key, TRGT.lev_2_key, TRGT.lev_2_rel_key, TRGT.lev_3_key, 
TRGT.lev_3_rel_key, TRGT.lev_4_key, TRGT.lev_4_rel_key, TRGT.lev_5_key, TRGT.lev_5_rel_key, TRGT.lev_6_key, TRGT.end_node_key , TRGT.soft_deleted_flag, TRGT.etl_run_number from #DWH_TABLE_SCHEMA.f_ci_relationship TRGT
where concat(TRGT.start_node_key, TRGT.end_node_key) not in 
(
select concat(TRGT.start_node_key, TRGT.end_node_key) from #STG_TABLE_SCHEMA.ci_rel_final_base
)
and TRGT.soft_deleted_flag = 'N') base;