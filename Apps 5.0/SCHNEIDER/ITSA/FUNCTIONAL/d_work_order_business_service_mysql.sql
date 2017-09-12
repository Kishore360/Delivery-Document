

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order.business_service' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.d_work_order TRGT ON (SRC.work_order_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.business_service <> (TRGT.business_service) 


