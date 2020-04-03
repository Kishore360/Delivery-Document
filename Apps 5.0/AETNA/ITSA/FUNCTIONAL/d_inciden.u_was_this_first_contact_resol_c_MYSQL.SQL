SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.u_was_this_first_contact_resol_c' ELSE 'SUCCESS' END as Message 
FROM( 


select count(1) cnt from (
select (case when src.u_was_this_first_contact_resol=1 then 'Y' else 'N' end )abc , trgt.u_was_this_first_contact_resol_c def from  
(select sys_id, sourceinstance, u_was_this_first_contact_resol,cdctime from aetna_mdsdb.incident_final where CDCTYPE<>'D') src
join (select source_id,max(lastupdated) as lastupdated from aetna_mdwdb.d_o_data_freshness group by source_id) f1 on
 (f1.source_id = src.sourceinstance) and  (src.cdctime<=f1.lastupdated)
 join aetna_mdwdb.d_incident trgt on src.sys_id=trgt.row_id and src.sourceinstance = trgt.source_id)a
where abc <>def
)ma