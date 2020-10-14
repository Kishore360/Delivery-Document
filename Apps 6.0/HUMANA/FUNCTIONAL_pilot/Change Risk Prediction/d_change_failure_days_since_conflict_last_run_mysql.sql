SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_failure.count_of_affected_cis' ELSE 'SUCCESS' END as Message
from humana_mdsdb.change_request_final change_request  
join
humana_mdwdb.d_change_failure TRGT
on  change_request.sys_id=TRGT.row_id and change_request.sourceinstance=TRGT.source_id
where case 
when (COALESCE((SELECT dimension_wh_code FROM humana_mdwdb.d_lov_map WHERE
      d_lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
       AND d_lov_map.dimension_code = change_request.state 
        AND d_lov_map.source_id = change_request.sourceinstance), 'UNKNOWN') = 'OPEN') 
then (case  
      when (CONVERT_TZ ((SELECT  max(lastupdated) FROM humana_mdwdb.d_o_data_freshness 
            WHERE source_id=change_request.sourceinstance  and soft_deleted_flag = 'N'), 'US/Central', 'UTC') is null 
            or change_request.conflict_last_run is null) then -1 
            else (
			case 
            when (TIMESTAMPDIFF(SECOND, change_request.conflict_last_run, CONVERT_TZ((SELECT max(lastupdated) 
			      FROM humana_mdwdb.d_o_data_freshness 
				  WHERE source_id=change_request.sourceinstance  and soft_deleted_flag = 'N'), 'US/Central', 'UTC'))) > 0 
			then (TIMESTAMPDIFF(SECOND, change_request.conflict_last_run, CONVERT_TZ((SELECT  max(lastupdated) 
                  FROM humana_mdwdb.d_o_data_freshness   WHERE
                  source_id=change_request.sourceinstance  and soft_deleted_flag = 'N'), 'US/Central', 'UTC')))/(86400) 
            else -1  end) 
        end) 
when (COALESCE((SELECT dimension_wh_code  FROM humana_mdwdb.d_lov_map  WHERE
      d_lov_map.dimension_class = 'STATE~CHANGE_REQUEST' 
      AND d_lov_map.dimension_code = change_request.state 
      AND d_lov_map.source_id = change_request.sourceinstance), 'UNKNOWN') ='CLOSED') 
then (case  
      when (change_request.work_start is null  or change_request.conflict_last_run is null) then -1 
      else (case 
            when (TIMESTAMPDIFF(SECOND, change_request.work_start, change_request.conflict_last_run))> 0
			then (TIMESTAMPDIFF(SECOND, change_request.work_start, change_request.conflict_last_run))/(86400) 
            else -1   end) 
      end) 
else -1 
end <>TRGT.days_since_conflict_last_run