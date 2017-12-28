<<<<<<< HEAD
 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.closed_by_key' ELSE 'SUCCESS' END as Message
FROM (SELECT  count(1) as CNT 
 FROM qualcomm_mdsdb.sc_req_item_final SRC
JOIN qualcomm_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
      JOIN qualcomm_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
LEFT JOIN qualcomm_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND TRGT.pivot_date
BETWEEN LKP.effective_from AND LKP.effective_to)
WHERE   TRGT. closed_by_key  <> coalesce(LKP.row_key,case when closed_by is null then 0 else -1 end) and dlm.dimension_wh_code ='CLOSED' ) temp;

 
=======
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.sc_req_item_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  LEFT JOIN qualcomm_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
LEFT JOIN qualcomm_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to) 

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key) ;
>>>>>>> 173a273a5c9ca02e0c3aa4910136dbb1a4fc6c24
