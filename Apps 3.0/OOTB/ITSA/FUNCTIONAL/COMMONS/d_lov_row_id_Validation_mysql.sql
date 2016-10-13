SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM (
select count(1) as cnt
from <<tenant>>_mdwdb.d_lov
where 
row_id <> concat(dimension_class,'~',dimension_type,'~',dimension_subtype,'~',dimension_code)
and dimension_class <>'LANDING_PAGE'
and row_key not in (-1,0)
)a;
