SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.numerify_change_failure_flag' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM humana_mdsdb.change_request_final SRC 
JOIN humana_mdwdb.d_change_failure TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN humana_mdsdb.incident_final INC ON (SRC.sys_id=INC.caused_by)
JOIN humana_mdwdb.d_lov lov ON lov.row_id = concat('STATE~CHANGE_REQUEST~' , SRC.state) AND SRC.sourceinstance=lov.source_id
WHERE (case when (SRC.close_code is null or lov.dimension_name <> 'Closed') and (INC.caused_by is null or INC.problem_id is null) then 'X' 
when SRC.close_code = 'unsuccessful' or INC.caused_by is not null or INC.problem_id is not null then 'Y' else 'N' end
)<>TRGT.numerify_change_failure_flag ) temp;

