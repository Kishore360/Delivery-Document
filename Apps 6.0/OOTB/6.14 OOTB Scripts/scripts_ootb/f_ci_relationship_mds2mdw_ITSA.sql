SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for behavior, start_node_key, lev_0_rel_key, lev_1_key, lev_1_rel_key, lev_2_key, lev_2_rel_key, lev_3_key, 
lev_3_rel_key, lev_4_key, lev_4_rel_key, lev_5_key, lev_5_rel_key, lev_6_key, end_node_key columns of f_ci_relationship' ELSE 'SUCCESS' END as Message
from (
select SRC.behavior, SRC.start_node_key, SRC.lev_0_rel_key, SRC.lev_1_key, SRC.lev_1_rel_key, SRC.lev_2_key, SRC.lev_2_rel_key, SRC.lev_3_key, 
SRC.lev_3_rel_key, SRC.lev_4_key, SRC.lev_4_rel_key, SRC.lev_5_key, SRC.end_node_key 
from #STG_TABLE_SCHEMA.ci_rel_final_base SRC
left join #DWH_TABLE_SCHEMA.f_ci_relationship TRGT
on SRC.path = TRGT.path and SRC.source_id = TRGT.source_id
where concat(SRC.behavior, SRC.start_node_key, SRC.lev_0_rel_key, SRC.lev_1_key, SRC.lev_1_rel_key, SRC.lev_2_key, SRC.lev_2_rel_key, SRC.lev_3_key, 
SRC.lev_3_rel_key, SRC.lev_4_key, SRC.lev_4_rel_key, SRC.lev_5_key, SRC.end_node_key) <> 
concat(TRGT.behavior, TRGT.start_node_key, TRGT.lev_0_rel_key, TRGT.lev_1_key, TRGT.lev_1_rel_key, TRGT.lev_2_key, TRGT.lev_2_rel_key, TRGT.lev_3_key, 
TRGT.lev_3_rel_key, TRGT.lev_4_key, TRGT.lev_4_rel_key, TRGT.lev_5_key, TRGT.end_node_key)
) SQ;