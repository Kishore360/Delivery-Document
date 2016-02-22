select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) cnt
from <<tenant>>_mdwdb.f_incident f
 join <<tenant>>_mdwdb.d_lov_map d on src_key=state_src_key
 join <<tenant>>_mdwdb.d_lov lov on lov.dimension_class=d.dimension_class and lov.dimension_code=d.dimension_code 
and d.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
 and d.src_key not in(-1) 
where f.closed_on_key is null	and dimension_wh_code ='CLOSED')a


