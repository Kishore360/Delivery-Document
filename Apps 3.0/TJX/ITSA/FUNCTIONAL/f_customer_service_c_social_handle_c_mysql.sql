SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.location_key' ELSE 'SUCCESS' END as Message
 from tjx_mdsdb.u_customer_service_final SRC 
 left join tjx_mdwdb.f_customer_service_c TRGT
on (TRGT.row_id = SRC.sys_id 
	and TRGT.source_id= SRC.sourceinstance)
WHERE SRC.u_social_handle  <> TRGT.social_handle_c
