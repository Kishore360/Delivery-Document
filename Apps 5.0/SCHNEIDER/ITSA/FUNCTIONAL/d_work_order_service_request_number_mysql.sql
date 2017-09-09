

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order.service_request_number' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.woi_workorder_final  SRC
join schneider_mdsdb.srm_request_final SR on  SRC.srinstanceid = SR.instanceid AND SRC.sourceinstance = SR.sourceinstance 
JOIN schneider_mdwdb.d_work_order TRGT ON (SRC.work_order_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SR.srd_number <> (TRGT.service_request_number) 


