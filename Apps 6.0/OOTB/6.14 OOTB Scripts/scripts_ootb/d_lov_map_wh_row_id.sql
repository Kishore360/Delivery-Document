
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_map.wh_row_id' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.d_lov_map TRGT 
WHERE upper(concat(ifnull(us_d_aux_lov_map.wh_dimension_class,''),'~',IFNULL(us_d_aux_lov_map.wh_dimension_type,''),'~',IFNULL(us_d_aux_lov_map.wh_dimension_subtype,''),'~',IFNULL(us_d_aux_lov_map.dimension_wh_code,''))) <> COALESCE(TRGT.wh_row_id,'')
