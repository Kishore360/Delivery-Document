SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_failure.count_of_affected_cis' ELSE 'SUCCESS' END as Message
from ge_mdsdb.change_request_final change_request  
join
ge_mdwdb.d_change_failure TRGT
on  change_request.sys_id=TRGT.row_id and change_request.sourceinstance=TRGT.source_id
where case 
when (change_request.start_date is null  and (COALESCE((SELECT  dimension_wh_code  FROM ge_mdwdb.d_lov_map 
	  WHERE d_lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
	  AND d_lov_map.dimension_code = change_request.state 
	  AND d_lov_map.source_id = change_request.sourceinstance), 'UNKNOWN') = 'OPEN')) 
then 'UNSPECIFIED' 
when (COALESCE((SELECT dimension_wh_code  FROM ge_mdwdb.d_lov_map 
      WHERE d_lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
      AND d_lov_map.dimension_code = change_request.state 
      AND d_lov_map.source_id = change_request.sourceinstance), 'UNKNOWN') = 'OPEN')  
then (DAYNAME(CONVERT_TZ(change_request.start_date, 'UTC', 'US/Central'))) 
when (change_request.work_start is null  and (COALESCE((SELECT dimension_wh_code  FROM ge_mdwdb.d_lov_map 
      WHERE d_lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
      AND d_lov_map.dimension_code = change_request.state 
      AND d_lov_map.source_id = change_request.sourceinstance), 'UNKNOWN') = 'CLOSED'))
then 'UNSPECIFIED'  
when (COALESCE((SELECT  dimension_wh_code  FROM ge_mdwdb.d_lov_map 
      WHERE d_lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
      AND d_lov_map.dimension_code = change_request.state 
      AND d_lov_map.source_id = change_request.sourceinstance), 'UNKNOWN') = 'CLOSED')
then (DAYNAME(CONVERT_TZ(change_request.work_start,'UTC', 'US/Central')))  
else 'UNSPECIFIED' 
end <>TRGT.planned_start_day_of_week