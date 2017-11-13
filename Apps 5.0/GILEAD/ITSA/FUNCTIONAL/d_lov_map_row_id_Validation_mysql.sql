SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM (
select row_key
,src_rowId,concat(coalesce(dimension_class,''),'~',coalesce(dimension_type,''),'~',coalesce(dimension_subtype,''),'~',ucase(coalesce(dimension_code))),
wh_rowid , concat(coalesce(wh_dimension_class,''),'~',coalesce(wh_dimension_type,''),'~',coalesce(dimension_subtype,''),'~',ucase(coalesce(dimension_wh_code,''))) 
from gilead_mdwdb.d_lov_map 
where 
(src_rowId<>concat(coalesce(dimension_class,''),'~',coalesce(dimension_type,''),'~',coalesce(dimension_subtype,''),'~',ucase(coalesce(dimension_code)))
  or 
  wh_rowid <> concat(coalesce(wh_dimension_class,''),'~',coalesce(wh_dimension_type,''),'~',coalesce(dimension_subtype,''),'~',ucase(coalesce(dimension_wh_code,''))) )
AND wh_rowid <>'UNSPECIFIED'
 
)a;
