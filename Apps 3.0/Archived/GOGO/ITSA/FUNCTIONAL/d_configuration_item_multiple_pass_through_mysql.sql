SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM 
gogo_mdwdb.d_configuration_item ds left join gogo_mdsdb.u_aircraft_tails_final f on (ds.row_id =f.sys_id AND ds.source_id=f.sourceinstance) 
where ds.airline_c <>f.u_airline or 
ds.nose_number_c <>f.u_nose_number or 
ds.airline_owner_c <>f.u_owner