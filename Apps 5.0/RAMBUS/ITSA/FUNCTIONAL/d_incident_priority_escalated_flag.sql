-- d_incident_priority_escalated_flag.sql
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.priority_escalated_flag' ELSE 'SUCCESS' END as Message 
FROM
(SELECT CASE WHEN fact.priority_src_code < audit_temp.original_pri THEN 'Y' ELSE 'N' END , trgt.priority_escalated_flag,fact.priority_src_code , audit_temp.original_pri 
FROM rambus_mdwdb.d_incident trgt
JOIN rambus_mdwdb.f_incident fact on fact.incident_key = trgt.row_key
RIGHT JOIN rambus_mdsdb.incident_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN (
SELECT a11.documentkey,a11.oldvalue as original_pri FROM
	(SELECT  documentkey,sys_created_on,oldvalue  from rambus_mdsdb.sys_audit_final a11
	where fieldname = 'priority' AND tablename='incident' and oldvalue is NOT NULL) a11
JOIN 
	(SELECT documentkey,MIN(sys_created_on) as sys_created_on  from rambus_mdsdb.sys_audit_final 
	where fieldname = 'priority' AND tablename='incident' and oldvalue is NOT NULL group by 1) a12
ON a11.documentkey = a12.documentkey and a11.sys_created_on = a12.sys_created_on
) audit_temp
ON src.sys_id = audit_temp.documentkey
WHERE CASE WHEN fact.priority_src_code < audit_temp.original_pri THEN 'Y' ELSE 'N' END <> trgt.priority_escalated_flag
) temp

;
