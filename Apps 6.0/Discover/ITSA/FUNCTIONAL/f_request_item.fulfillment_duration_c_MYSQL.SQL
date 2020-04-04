SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_request_item.fulfillment_duration_c' ELSE 'SUCCESS' END as Message FROM discover_mdsdb.sc_req_item_final  SRC JOIN discover_mdwdb.f_request_item TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE COALESCE(
CASE WHEN (SRC.closed_at is null or SRC.approval_set is null) THEN NULL    
     WHEN TIMESTAMPDIFF(SECOND,SRC.approval_set,SRC.closed_at) < 0 THEN NULL     
     ELSE TIMESTAMPDIFF(SECOND,SRC.approval_set,SRC.closed_at) end,-1)  <> (TRGT.fulfillment_duration_c) 