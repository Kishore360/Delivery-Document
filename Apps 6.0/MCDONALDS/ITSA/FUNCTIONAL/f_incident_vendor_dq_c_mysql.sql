SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,assignment_group ,subcategory_dq_c,
(case when incident.u_vendor  is  null  then 0 
when incident.u_vendor in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or incident.u_vendor is null 
	 or incident.u_vendor='' or incident.u_vendor=' ' then 0
   else 1 end 
)  
from  mcd_mdsdb.incident_final incident
left join  mcd_mdwdb.f_incident tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.vendor_dq_c<>(case when incident.u_vendor  is  null  then 0 
when incident.u_vendor in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or incident.u_vendor is null 
	 or incident.u_vendor='' or incident.u_vendor=' ' then 0
   else 1 end 
)  

 )a
 
 
 
 
 
 