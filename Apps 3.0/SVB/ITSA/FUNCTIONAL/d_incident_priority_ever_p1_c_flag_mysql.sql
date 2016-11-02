SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message from (
select case when (major_incident_flag='Y'  or saf.oldvalue=1 or saf.newvalue=1) then 'Y'  else 'N'  END as src, priority_ever_p1_c_flag trgt
 FROM svb_mdsdb.incident_final inc
  left join (select oldvalue,newvalue,documentkey from svb_mdsdb.sys_audit_final where tablename='incident' and fieldname='priority' )saf on saf.documentkey=inc.sys_id
 join svb_mdwdb.d_incident on sys_id=row_id and sourceinstance=source_id)a
 where src<>trgt
 

 