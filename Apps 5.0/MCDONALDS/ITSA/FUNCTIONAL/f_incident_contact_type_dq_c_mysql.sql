SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,assignment_group ,close_code_dq_c,
(case when close_code  is  null  then 0 
   else 1 end 
)  
from  mcdonalds_mdsdb.incident_final incident
left join  mcdonalds_mdwdb.f_incident tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.contact_type_dq_c<>(case when contact_type  is  null  then 0 
   else 1 end 
)  

 )a
 
 
 
 
 