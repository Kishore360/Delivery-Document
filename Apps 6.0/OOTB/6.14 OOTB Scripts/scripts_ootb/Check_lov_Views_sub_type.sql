select * from (
SELECT lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class
 , COALESCE(lov.dimension_type, 'DEFAULT') AS source_dimension_type
 , COALESCE(lov.dimension_subtype, 'DEFAULT') AS source_dimension_subtype
 , lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name
 , wh_lov.row_id AS wh_row_id, COALESCE(wh_lov.dimension_type, 'DEFAULT') AS wh_dimension_type, COALESCE(wh_lov.dimension_subtype, 'DEFAULT') AS wh_dimension_subtype, wh_lov.dimension_code AS wh_dimension_code, wh_lov.dimension_name AS wh_dimension_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND 
    br.dimension_class = #DIMENSION_CLASS AND br.dimension_type = #DIMENSION_TYPE AND br.dimension_subtype = #DIMENSION_SUB_TYPE
UNION 
SELECT
lov.row_key, lov.row_dn_key, lov.row_current_key, lov.source_id, lov.row_id, lov.dimension_class
 , COALESCE(lov.dimension_type, 'DEFAULT') AS source_dimension_type
 , COALESCE(lov.dimension_subtype, 'DEFAULT') AS source_dimension_subtype
 , lov.dimension_code AS source_dimension_code, lov.dimension_name AS source_dimension_name
 , lov.row_id AS wh_row_id, COALESCE(lov.dimension_type, 'DEFAULT') AS wh_dimension_type, COALESCE(lov.dimension_subtype, 'DEFAULT') AS wh_dimension_subtype, lov.dimension_code AS wh_dimension_code, lov.dimension_name AS wh_dimension_name
FROM #DWH_TABLE_SCHEMA.d_lov lov
WHERE row_key = -1 OR row_key = 0
) A order by row_key

