SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,
(case when known_error  is  null  then 0 
when known_error in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or known_error is null 
	 or known_error='' or known_error=' ' then 0 
   else 1 end 
)  
from  mcdonalds_mdsdb.problem_final incident
left join  mcdonalds_mdwdb.f_problem tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.Known_Error_dq_c<>(case when known_error  is  null  then 0
when known_error in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or known_error is null 
	 or known_error='' or known_error=' ' then 0  
   else 1 end 
)  

 )a
 
 