SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation
 failed for f_change_business_events_c.bussiness_event_c_key' ELSE 'SUCCESS' END as Message
 FROM fidelity_mdsdb.u_change_business_events_final SRC 
 LEFT JOIN fidelity_workdb.f_change_business_events_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id and TRGT.soft_deleted_flag = 'N' )
 left join fidelity_workdb.d_fmr_business_events_c ref on TRGT.bussiness_event_c_key=ref.row_key
 WHERE case when TRGT.bussiness_event_c_key=-1 then 'UNKNOWN' else ref.row_id end  <>COALESCE(ref.row_id);