SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order.wo_type_field_08_c ' 
ELSE 'SUCCESS' END as Message 
FROM  schneider_mdsdb.woi_workorder_final  
SRC JOIN  schneider_mdwdb.d_work_order TRGT 
ON (SRC.request_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
where  SRC.wo_type_field_08 <> TRGT.wo_type_field_08_c ;
