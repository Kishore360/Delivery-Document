select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select lov.dimension_code lov_dimension_code,lov.row_key lov_row_key,map.src_key lov_map_src_key,map.dimension_code lov_map_dimension_code,lov.dimension_class as lov_dimension_class,map.dimension_class as map_dimension_class from  <<tenant>>_mdwdb.d_lov_map map
left join <<tenant>>_mdwdb.d_lov lov on lov.row_key=map.src_key  
where lov.row_id is null and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1) )a