SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for incident.locations_impacted_c ' ELSE 'SUCCESS' END as Message 
from (select location, sourceinstance, sys_id from pdchs_mdsdb.incident_final where CDCTYPE='D') src 
left join pdchs_mdwdb.d_location lkp on src.location=lkp.row_id and src.sourceinstance=lkp.source_id
join pdchs_mdwdb.d_incident trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id where coalesce(lkp.location_name, 'UNSPECIFIED')<>trgt.locations_impacted_c;
 