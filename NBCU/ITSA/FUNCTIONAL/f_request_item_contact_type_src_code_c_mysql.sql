SELECT *
 FROM nbcu_mdsdb.sc_req_item_final SRC 
 JOIN nbcu_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.contact_type<> TRGT.contact_type_src_code_c