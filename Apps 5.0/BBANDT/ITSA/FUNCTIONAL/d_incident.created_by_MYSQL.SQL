SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM 
 (SELECT   count(1) cnt
 FROM (select sys_id,sourceinstance,name from bbandt_mdsdb.sys_user_group_final  
 ) lkp
 join bbandt_mdsdb.incident_final SRC 
on SRC.assignment_group = lkp.sys_id 
and SRC.sourceinstance = lkp.sourceinstance
  JOIN bbandt_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE    lkp.name not like 'ITSM-LOB-Branchinfo%' and lkp.name not like 'ITSM-LOB-HumanSystems%' and lkp.name not like 'ITSM-LOB-CPS%'
and lkp.name not like 'ITSM-LOB-LoanServices%' and lkp.name not like 'ITSM-LOB-Wealth%' and SRC.sys_created_by<> TRGT.created_by and SRC.CDCTYPE<>'D'
and TRGT.soft_deleted_flag='N')a;
