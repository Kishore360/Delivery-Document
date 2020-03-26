SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.changed_by' ELSE 'SUCCESS' END as Message
 FROM aetna_mdsdb.sc_req_item_final SRC 
 LEFT JOIN aetna_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE TRGT.soft_deleted_flag = 'N' and COALESCE( SRC.sys_updated_by,'UNSPECIFIED')<>
 COALESCE(TRGT.changed_by)
 
 