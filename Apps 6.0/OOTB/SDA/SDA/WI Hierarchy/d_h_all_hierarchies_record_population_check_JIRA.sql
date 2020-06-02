SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'd_h_all_hierarchies is having more records than the Source table' ELSE 'SUCCESS' END as Message
FROM 
(select * from #STG_TABLE_SCHEMA.hier_base
where sys_id not in 
(
select row_id from #DWH_TABLE_SCHEMA.d_h_all_hierarchies TRGT where TRGT.row_id like '%WORK_ITEM' and TRGT.soft_deleted_flag = 'N'
)) base;