
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from bbandt_mdsdb.incident_final SRC 
left join bbandt_mdsdb.sys_user_group_final lkp 
on SRC.assignment_group = lkp.sys_id 
and SRC.sourceinstance = lkp.sourceinstance
 LEFT JOIN bbandt_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> TRGT.changed_by
 and ((lkp.name not like 'ITSM-LOB-Branchinfo%' and lkp.name not like 'ITSM-LOB-HumanSystems%' and lkp.name not like 'ITSM-LOB-CPS%'
and lkp.name not like 'ITSM-LOB-LoanServices%' and lkp.name not like 'ITSM-LOB-Wealth%') or lkp.name is null)
and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma;