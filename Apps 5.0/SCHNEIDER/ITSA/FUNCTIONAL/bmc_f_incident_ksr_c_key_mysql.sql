SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_key' 
ELSE 'MDS to DWH data validation passed for f_incident.ksr_c_key' END as Message from 
(select count(1) cnt 
from schneider_mdsdb.hpd_help_desk_final src 
inner join schneider_mdwdb.f_incident trgt on src.entry_id = trgt.row_id and src.sourceinstance = trgt.source_id 
left join schneider_mdwdb.d_ksr_c lkp on src.srid = lkp.row_id and src.sourceinstance = lkp.source_id
where coalesce(lkp.row_key,if(src.srid is null,0,-1)) <> trgt.ksr_c_key)a; 
