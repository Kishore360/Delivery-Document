
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.pcie_status_c' ELSE 'SUCCESS' END as Message
 from  ibmwatson_mdwdb.f_incident a
JOIN ibmwatson_mdsdb.incident_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance
JOIN ( SELECT documentkey,sourceinstance,min(sys_created_on) as min_created_on from 
ibmwatson_mdsdb.sys_audit_final 
where tablename ='incident' and fieldname ='u_status' and (oldvalue ='20' or newvalue ='20')
group by 1,2
) min
ON a.row_id = min.documentkey and a.source_id = min.sourceinstance
where  a.pcie_status_c <>timestampdiff(SECOND, b.opened_at, min.min_created_on)
and b.cdctype='X'