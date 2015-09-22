

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.estimated_delivery_on_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid )
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
<<<<<<< HEAD
on (LKP.row_id = date_format(convert_tz(SRC.estimated_delivery,source_time_zone,target_time_zone),'%Y%m%d')  and LKP.source_id=0
)
=======
on (LKP.row_id = date_format(convert_tz(SRC.estimated_delivery,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),'%Y%m%d'))
>>>>>>> 47dbc02c9aeb39eddec22b5e1c59660a3ced7a66
WHERE COALESCE(LKP.row_key,case when SRC.estimated_delivery is null then 0 else -1 end) <> COALESCE(TRGT.estimated_delivery_on_key,'') 
