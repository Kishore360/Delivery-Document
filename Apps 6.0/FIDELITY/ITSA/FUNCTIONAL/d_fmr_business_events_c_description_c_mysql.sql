SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_fmr_business_events_c.description_c' ELSE 'SUCCESS' END as Message
 FROM fidelity_mdsdb.u_fmr_business_events_final SRC 
 LEFT JOIN fidelity_workdb.d_fmr_business_events_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id and TRGT.soft_deleted_flag = 'N' )
 WHERE SRC.u_description<> COALESCE(TRGT.description_c);