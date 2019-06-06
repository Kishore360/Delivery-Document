SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,assignment_group ,subcategory_dq_c,
(case when problem.u_subcategory  is  null  then 0 
when problem.u_subcategory  is not  null  and  u_subcategory.sys_id is null then 0 
when u_subcategory.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or name is null 
	 or name='' or name=' ' then 0
   else 1 end 
)  
from  mcdonalds_mdsdb.problem_final problem
left join mcdonalds_mdsdb.u_subcategory_final u_subcategory    
on problem.u_subcategory =u_subcategory.sys_id
left join  mcdonalds_mdwdb.f_problem tgt
on problem.sys_id=tgt.row_id and problem.sourceinstance=tgt.source_id
where  tgt.subcategory_dq_c<>(case when problem.u_subcategory  is  null  then 0 
when problem.u_subcategory  is not  null  and  u_subcategory.sys_id is null then 0 
when u_subcategory.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or name is null 
	 or name='' or name=' ' then 0
   else 1 end 
)  

 )a
 
 
 
 
 
 
 