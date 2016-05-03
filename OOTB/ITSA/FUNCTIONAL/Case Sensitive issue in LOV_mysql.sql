SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM (
select dimension_class , upper(dimension_class) 
from <<tenant>>_mdwdb.d_lov 
where dimension_class <> upper(dimension_class) )x