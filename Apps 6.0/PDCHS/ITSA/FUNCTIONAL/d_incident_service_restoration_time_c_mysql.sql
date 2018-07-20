
 SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_incident.service_outage_time_c' ELSE 'SUCCESS' END as Message 
FROM (select sys_id,sourceinstance,u_service_restoration_time from pdchs_mdsdb.incident_final where CDCTYPE<>'D') src

JOIN  pdchs_mdwdb.d_incident trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where convert_tz(u_service_restoration_time,'GMT','America/Los_Angeles') <>
 trgt.service_restoration_time_c 
;
