

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,cmdb_ci ,configuration_item_location_dq_c,
case when cmdb.sys_id is null or incident.cmdb_ci  is  null  then 0 
when incident.cmdb_ci  is not  null  and  cmdb.u_site_location is null then 0 
when s1.u_site_short_name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or s1.u_site_short_name is null 
                 or s1.u_site_short_name='' or s1.u_site_short_name=' ' then 0
   else 1 end 


from  mcdonalds_mdsdb.change_request_final incident
left join mcdonalds_mdsdb.cmdb_ci_final cmdb on incident.cmdb_ci=cmdb.sys_id
left join mcdonalds_mdsdb.u_cmdb_location_final s1 
on cmdb.u_site_location=s1.sys_id and incident.sourceinstance= s1.sourceinstance
left join  mcdonalds_mdwdb.f_change_request tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.configuration_item_location_dq_c<>(case when cmdb.sys_id is null or incident.cmdb_ci  is  null  then 0 
when incident.cmdb_ci  is not  null  and  cmdb.u_site_location is null then 0 
when s1.u_site_short_name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or s1.u_site_short_name is null 
                 or s1.u_site_short_name='' or s1.u_site_short_name=' ' then 0
   else 1 end 
)  

)a

 
