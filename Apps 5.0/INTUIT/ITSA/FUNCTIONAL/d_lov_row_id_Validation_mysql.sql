SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_request_item.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM (
select count(1) as cnt
from intuit_mdwdb.d_lov
where 
row_id <> concat(dimension_class,'~',dimension_type,'~',dimension_subtype,'~',dimension_code)
and dimension_class not in ('LANDING_PAGE','TENANT_INFORMATION')
and row_key not in (-1,0) and row_id not in (
'CHANGE_REQUEST~3530152c6ff8b10021570ee9ea3ee4d7',
'CHANGE_REQUEST~07017c716f61e10021573ee9ea3ee4bf',
'CHANGE_REQUEST~7e3313026fa42d00f5db57ee2c3ee4b5',
'CHANGE_REQUEST~f4c530836f2e2500afdb33d9ea3ee4db',
'CHANGE_REQUEST~38ae20ef6fe1210021573ee9ea3ee4b8',
'CHANGE_REQUEST~089e7feb6ff92500afdb33d9ea3ee40e',
'CHANGE_REQUEST~62769cdf6f80820821570ee9ea3ee498',
'CHANGE_REQUEST~5f4c791c6f6cf50051a1da0cbb3ee415',
'CHANGE_REQUEST~143715126f15de88afdb33d9ea3ee499',
'CHANGE_REQUEST~4e6e52296fb1da00afdb33d9ea3ee445',
'CHANGE_REQUEST~1a1a405a6fb8220851a1da0cbb3ee4db'
)
)a;
