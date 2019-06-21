SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,department ,department_dq_c,
case when suf.department  is  null   then 0 
  when suf.department  is not  null  and  cmn.sys_id is null then 0 
when cmn.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or cmn.name is null 
	 or cmn.name='' or cmn.name=' ' then 0
   else 1 end 

 -- select count(1)
from  mcdonalds_mdsdb.problem_final incident
 join mcdonalds_mdsdb.sys_user_final suf on incident.opened_by =suf.sys_id
 join  mcdonalds_mdsdb.cmn_department_final cmn on suf.department =cmn.sys_id
 join  mcdonalds_mdwdb.f_problem tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.department_dq_c<>(case when suf.department  is  null  then 0 
when suf.department  is not  null  and  cmn.sys_id is null then 0 
when cmn.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or cmn.name is null 
	 or cmn.name='' or cmn.name=' ' then 0
   else 1 end 
)  

 )a
 
 
 
 
 
 