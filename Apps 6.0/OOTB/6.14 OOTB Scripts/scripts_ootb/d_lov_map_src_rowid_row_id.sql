select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'SRC_ROW_ID and ROW_ID are not same in d_lov_map' ELSE 'SUCCESS' END as Message
 from #DWH_TABLE_SCHEMA.d_lov_map
 where src_rowid<>row_id