SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,
(case when known_error  is  null  then 0 
when upper(known_error) in ('UNSPECIFIED','UNKNOWN','UNALLOCATED','UNDEFINED','',' ','UNSPECIFED','UNKONWN','NULL') 
 then 0 
   else 1 end 
)  
from  mcd_mdsdb.problem_final incident
left join  mcd_mdwdb.f_problem tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.Known_Error_dq_c<>(case when known_error  is  null  then 0
when upper(known_error) in ('UNSPECIFIED','UNKNOWN','UNALLOCATED','UNDEFINED','',' ','UNSPECIFED','UNKONWN','NULL') 
 then 0  
   else 1 end 
)  

 )a
 
 