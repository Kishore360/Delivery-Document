SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_was_this_first_contact_resol_c' ELSE 'SUCCESS' END as Message 
FROM 
(select sys_id, sourceinstance, u_was_this_first_contact_resol from aetna_mdsdb.incident_final where CDCTYPE<>'D') src
 left join aetna_mdwdb.d_incident trgt on src.sys_id=trgt.row_id and src.sourceinstance = trgt.source_id
where COALESCE(src.u_was_this_first_contact_resol,'UNSPECIFIED') <> trgt.u_was_this_first_contact_resol_c;