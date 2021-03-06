SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,requested_by ,department_dq_c,
case when incident.requested_by  is  null   then 0 
  when incident.requested_by  is not  null  and  cmn.sys_id is null then 0 
when cmn.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or cmn.name is null 
	 or cmn.name='' or cmn.name=' ' then 0
   else 1 end 

 
from  mcdonalds_mdsdb.change_request_final incident
left join mcdonalds_mdsdb.sys_user_final suf on incident.requested_by =suf.sys_id
left join  mcdonalds_mdsdb.cmn_department_final cmn on suf.department =cmn.sys_id
left join  mcdonalds_mdwdb.f_change_request tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.department_dq_c<>(case when incident.requested_by  is  null  then 0 
when incident.requested_by  is not  null  and  cmn.sys_id is null then 0 
when cmn.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or cmn.name is null 
	 or cmn.name='' or cmn.name=' ' then 0
   else 1 end 
)  

 )a
 
 
 
 
 
 