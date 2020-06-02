SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'f_ci_relationship is having more records than the Source table' ELSE 'SUCCESS' END as Message
FROM 
(select * from #STG_TABLE_SCHEMA.ci_rel_final_base SRC
where concat(SRC.start_node_key, SRC.end_node_key) not in 
(
select concat(TRGT.start_node_key, TRGT.end_node_key) from #DWH_TABLE_SCHEMA.f_ci_relationship TRGT where TRGT.soft_deleted_flag = 'N'
)) base;