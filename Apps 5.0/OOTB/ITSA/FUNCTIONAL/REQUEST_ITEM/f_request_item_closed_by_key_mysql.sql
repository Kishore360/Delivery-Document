 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.closed_by_key' ELSE 'SUCCESS' END as Message
FROM (SELECT  count(1) as CNT 
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC
JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
      JOIN <<tenant>>_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND TRGT.pivot_date
BETWEEN LKP.effective_from AND LKP.effective_to)
LEFT JOIN <<tenant>>_mdwdb.d_internal_contact ic ON (SRC.sys_updated_by = ic.user_name AND SRC.sourceinstance = ic.source_id)
WHERE 
  TRGT. closed_by_key <>case when (coalesce(LKP.row_key,case when closed_by is null then 0 end ))=0 
then coalesce(ic.row_key,-1) else coalesce(LKP.row_key,case when closed_by is null then 0 else -1 end) end
and dlm.dimension_wh_code ='CLOSED' ) temp;

 
