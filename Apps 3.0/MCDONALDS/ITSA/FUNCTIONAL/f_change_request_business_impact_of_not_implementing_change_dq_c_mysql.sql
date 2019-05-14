SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,
(case when u_business_impact_of_not_implementing_change  is  null  then 0 
   else 1 end 
)  
from  mcdonalds_mdsdb.change_request_final incident
left join  mcdonalds_mdwdb.f_change_request tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.business_impact_of_not_implementing_change_dq_c<>(case when u_business_impact_of_not_implementing_change  is  null  then 0 
   else 1 end 
)  

 )a
 
 
 