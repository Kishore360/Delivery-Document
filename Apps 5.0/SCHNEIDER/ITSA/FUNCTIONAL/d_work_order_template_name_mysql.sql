SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order.template_name ' 
ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.woi_workorder_final  
SRC JOIN schneider_mdwdb.d_work_order TRGT 
ON (SRC.request_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
where  SRC.templatename <> TRGT.template_name ;
