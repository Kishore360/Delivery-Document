select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_geography' ELSE 'SUCCESS' END as Message
from app_test.ds_geography SRC
join <<tenant>>_mdwdb.d_geography TRGT
on(SRC.row_id=TRGT.row_id
and SRC.source_id=TRGT.source_id)
where concat(
coalesce(SRC.row_id,''),coalesce(SRC.source_id,''),coalesce(SRC.parent_row_id,''),coalesce(SRC.geo_id,''),coalesce(SRC.city_code,''),coalesce(SRC.state_code,''),coalesce(SRC.postal_code,''),coalesce(cast(SRC.longitude AS DECIMAL(20,10)),''),coalesce(cast(SRC.latitude AS DECIMAL(20,10)),''),coalesce(SRC.country_code,''),coalesce(SRC.continent_code,''),coalesce(SRC.city_name,''),coalesce(SRC.state_name,''),coalesce(SRC.country_name,''),coalesce(SRC.continent_name,''),coalesce(SRC.created_by,''),coalesce(SRC.changed_by,''),coalesce(SRC.created_on,''),coalesce(SRC.changed_on,'')
 ) 
<>  concat(
coalesce(TRGT.row_id,''),coalesce(TRGT.source_id,''),coalesce(TRGT.parent_row_id,''),coalesce(TRGT.geo_id,''),coalesce(TRGT.city_code,''),coalesce(TRGT.state_code,''),coalesce(TRGT.postal_code,''),coalesce(TRGT.longitude,''),coalesce(TRGT.latitude,''),coalesce(TRGT.country_code,''),coalesce(TRGT.continent_code,''),coalesce(TRGT.city_name,''),coalesce(TRGT.state_name,''),coalesce(TRGT.country_name,''),coalesce(TRGT.continent_name,''),coalesce(TRGT.created_by,''),coalesce(TRGT.changed_by,''),coalesce(TRGT.created_on,''),coalesce(TRGT.changed_on,'')
) ;

