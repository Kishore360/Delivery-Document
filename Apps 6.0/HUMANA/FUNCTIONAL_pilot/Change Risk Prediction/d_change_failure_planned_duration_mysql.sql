SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_failure.count_of_affected_cis' ELSE 'SUCCESS' END as Message
from humana_mdsdb.change_request_final change_request  
join
humana_mdwdb.d_change_failure TRGT
on  change_request.sys_id=TRGT.row_id and change_request.sourceinstance=TRGT.source_id
where case 
when change_request.end_date  < change_request.start_date  then  -1  
else coalesce(TIMESTAMPDIFF(SECOND, change_request.start_date,change_request.end_date), -1)  end <>TRGT.planned_duration