SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select incident.number,incident.u_business_impact_of_not_implementing_change,incident.sys_id,tgt.row_id,CASE WHEN length(incident.u_business_impact_of_not_implementing_change)<=20 or incident.u_business_impact_of_not_implementing_change is null 
or incident.u_business_impact_of_not_implementing_change in ('UNSPECIFIED','UNKNOWN','UNALLOCATED','UNDEFINED','',' ','UNSPECIFED','UNKONWN','NULL')then 0
ELSE 1 end as derived_col,tgt.business_impact_of_not_implementing_change_dq_c
from  mcdonalds_mdsdb.change_request_final incident
left join  mcdonalds_mdwdb.f_change_request tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where tgt.business_impact_of_not_implementing_change_dq_c<>(CASE WHEN length(incident.u_business_impact_of_not_implementing_change)<=20 or incident.u_business_impact_of_not_implementing_change is null 
or incident.u_business_impact_of_not_implementing_change in ('UNSPECIFIED','UNKNOWN','UNALLOCATED','UNDEFINED','',' ','UNSPECIFED','UNKONWN','NULL')then 0
ELSE 1 end))a;

 
 