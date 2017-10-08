
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select lov.dimension_code lov_dimension_code,lov.row_key lov_row_key,map.src_key lov_map_src_key,map.dimension_code lov_map_dimension_code,lov.dimension_class as lov_dimension_class,map.dimension_class as map_dimension_class from  gogo_mdwdb.d_lov_map map
left join gogo_mdwdb.d_lov lov on lov.dimension_class=map.dimension_class and lov.dimension_code=map.dimension_code  
where lov.row_id is null and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1) )a
UNION ALL
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select lov.dimension_code lov_dimension_code,lov.row_key lov_row_key,map.src_key lov_map_src_key,map.dimension_code lov_map_dimension_code,lov.dimension_class as lov_dimension_class,map.dimension_class as map_dimension_class from  netflix_mdwdb.d_lov_map map
left join netflix_mdwdb.d_lov lov on lov.dimension_class=map.dimension_class and lov.dimension_code=map.dimension_code  
where lov.row_id is null and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1) )a
union all
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select lov.dimension_code lov_dimension_code,lov.row_key lov_row_key,map.src_key lov_map_src_key,map.dimension_code lov_map_dimension_code,lov.dimension_class as lov_dimension_class,map.dimension_class as map_dimension_class from  pgi_mdwdb.d_lov_map map
left join pgi_mdwdb.d_lov lov on lov.dimension_class=map.dimension_class and lov.dimension_code=map.dimension_code  
where lov.row_id is null and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1) )a
union all
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select lov.dimension_code lov_dimension_code,lov.row_key lov_row_key,map.src_key lov_map_src_key,map.dimension_code lov_map_dimension_code,lov.dimension_class as lov_dimension_class,map.dimension_class as map_dimension_class from  redbull_mdwdb.d_lov_map map
left join redbull_mdwdb.d_lov lov on lov.dimension_class=map.dimension_class and lov.dimension_code=map.dimension_code  
where lov.row_id is null and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1) )a
union all
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select lov.dimension_code lov_dimension_code,lov.row_key lov_row_key,map.src_key lov_map_src_key,map.dimension_code lov_map_dimension_code,lov.dimension_class as lov_dimension_class,map.dimension_class as map_dimension_class from  rei_mdwdb.d_lov_map map
left join rei_mdwdb.d_lov lov on lov.dimension_class=map.dimension_class and lov.dimension_code=map.dimension_code  
where lov.row_id is null and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1) )a
union all
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select lov.dimension_code lov_dimension_code,lov.row_key lov_row_key,map.src_key lov_map_src_key,map.dimension_code lov_map_dimension_code,lov.dimension_class as lov_dimension_class,map.dimension_class as map_dimension_class from  uclahealth_mdwdb.d_lov_map map
left join uclahealth_mdwdb.d_lov lov on lov.dimension_class=map.dimension_class and lov.dimension_code=map.dimension_code  
where lov.row_id is null and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1) )a
union all
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select lov.dimension_code lov_dimension_code,lov.row_key lov_row_key,map.src_key lov_map_src_key,map.dimension_code lov_map_dimension_code,lov.dimension_class as lov_dimension_class,map.dimension_class as map_dimension_class from  usf_mdwdb.d_lov_map map
left join usf_mdwdb.d_lov lov on lov.dimension_class=map.dimension_class and lov.dimension_code=map.dimension_code  
where lov.row_id is null and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1) )a
union all
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select lov.dimension_code lov_dimension_code,lov.row_key lov_row_key,map.src_key lov_map_src_key,map.dimension_code lov_map_dimension_code,lov.dimension_class as lov_dimension_class,map.dimension_class as map_dimension_class from  weillcornell_mdwdb.d_lov_map map
left join weillcornell_mdwdb.d_lov lov on lov.dimension_class=map.dimension_class and lov.dimension_code=map.dimension_code  
where lov.row_id is null and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1) )a