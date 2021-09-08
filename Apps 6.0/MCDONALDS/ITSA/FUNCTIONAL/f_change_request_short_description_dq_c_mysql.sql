SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select incident.number,incident.short_description,incident.sys_id,tgt.row_id,CASE WHEN length(incident.short_description)<=20 or incident.short_description is null 
or incident.short_description in ('UNSPECIFIED','UNKNOWN','UNALLOCATED','UNDEFINED','',' ','UNSPECIFED','UNKONWN','NULL')then 0
ELSE 1 end as derived_col,tgt.short_description_dq_c
from  mcd_mdsdb.change_request_final incident
left join  mcd_mdwdb.f_change_request tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where tgt.short_description_dq_c<>(CASE WHEN length(incident.short_description)<=20 or incident.short_description is null 
or incident.short_description in ('UNSPECIFIED','UNKNOWN','UNALLOCATED','UNDEFINED','',' ','UNSPECIFED','UNKONWN','NULL')then 0
ELSE 1 end))a;

 