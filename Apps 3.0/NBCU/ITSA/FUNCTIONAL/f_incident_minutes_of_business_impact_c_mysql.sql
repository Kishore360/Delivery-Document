


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdwdb.f_incident TRGT
 join  nbcu_mdsdb.incident_final SRC
 on TRGT.row_id = SRC.sys_id
 where SRC.u_minutes_b<> TRGT.minutes_of_business_impact_c
