SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_keyword.colum_name' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_work_item_keyword TRGT
where concat(TRGT.column_name, ' - ', TRGT.table_name) not in ('description - d_work_item', 'short_description - d_work_item', 'comments - work_item_comments'); 
