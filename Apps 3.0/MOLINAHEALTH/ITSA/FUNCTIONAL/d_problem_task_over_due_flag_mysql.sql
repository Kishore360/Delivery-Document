SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message

 FROM  molinahealth_mdwdb.d_problem_task REQ_ITM 
WHERE  REQ_ITM.over_due_flag <> CASE WHEN (REQ_ITM.active_flag = 'Y') && (REQ_ITM.due_on < (SELECT MAX(lastupdated) AS lastupdated
FROM molinahealth_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')) THEN 'Y' ELSE 'N' END