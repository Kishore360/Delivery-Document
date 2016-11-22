SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM (
select row_key
from tivo_mdwdb.d_lov_map 
where (src_rowId not like '%PROJECT%' and src_rowId<>concat(coalesce(dimension_class,''),'~',coalesce(dimension_type,''),'~','~',ucase(coalesce(dimension_code))))
  or 
  (wh_rowid not like '%PROJECT%' and 
  wh_rowid <> concat(coalesce(wh_dimension_class,''),'~',coalesce(wh_dimension_type,''),'~','~',ucase(coalesce(dimension_wh_code,''))) )
)a;
