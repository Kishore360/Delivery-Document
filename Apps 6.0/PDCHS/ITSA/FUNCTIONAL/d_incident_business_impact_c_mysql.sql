
 SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_incident.business_impact_c' ELSE 'SUCCESS' END as Message 
FROM (select sys_id,sourceinstance,u_business_impact from pdchs_mdsdb.incident_final where CDCTYPE<>'D') src

JOIN  pdchs_mdwdb.d_incident trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where COALESCE(src.u_business_impact,'UNSPECIFIED')<> trgt.business_impact_c
;
