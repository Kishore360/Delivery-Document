 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select incident.number,incident.justification,incident.sys_id,tgt.row_id,CASE WHEN length(incident.justification)<=20 or incident.justification is null 
or incident.justification in ('UNSPECIFIED','UNKNOWN','UNALLOCATED','UNDEFINED','',' ','UNSPECIFED','UNKONWN','NULL')then 0
ELSE 1 end as derived_col,tgt.business_justification_dq_c
from  mcdonalds_mdsdb.change_request_final incident
left join  mcdonalds_mdwdb.f_change_request tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where tgt.business_justification_dq_c<>(CASE WHEN length(incident.justification)<=20 or incident.justification is null 
or incident.justification in ('UNSPECIFIED','UNKNOWN','UNALLOCATED','UNDEFINED','',' ','UNSPECIFED','UNKONWN','NULL')then 0
ELSE 1 end))a;

 