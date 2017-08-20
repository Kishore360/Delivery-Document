

 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM intuit_mdsdb.sc_req_item_final SRC 
 LEFT JOIN intuit_mdwdb.f_request_item TRGT
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  left join intuit_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key 
 LEFT JOIN intuit_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.closed_by)= LKP.row_id
AND SRC.sourceinstance= LKP.source_id 
AND COALESCE(CONVERT_TZ (SRC.opened_at,"GMT","America/Los_Angeles"), 
CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/Los_Angeles")) 
BETWEEN LKP.effective_from AND LKP.effective_to

)
 WHERE TRGT.soft_deleted_flag ='N' and case when p.dimension_wh_code = 'CLOSED' then (lkp.row_key) else null end <> (TRGT.closed_by_key);