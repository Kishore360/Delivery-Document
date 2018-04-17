 

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 
 FROM tjx_mdsdb.sc_req_item_final SRC 
 LEFT JOIN tjx_mdwdb.f_request_item TRGT
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  left join tjx_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key and dimension_wh_code='CLOSED'
 LEFT JOIN tjx_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.closed_by)= LKP.row_id
AND SRC.sourceinstance= LKP.source_id 
AND COALESCE(CONVERT_TZ (SRC.opened_at,'GMT','America/New_York'), 
CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),'GMT','America/New_York')) 
BETWEEN LKP.effective_from AND LKP.effective_to

)
  join tjx_mdwdb.d_request_item a19 on (TRGT.request_item_key = a19.row_key)  where category_name_c in ('ARMS') and TRGT.soft_deleted_flag ='N' and COALESCE(LKP.row_key,CASE WHEN SRC.closed_by  IS NULL THEN 0 ELSE -1 END )<> (TRGT.closed_by_key))temp;
 
 
