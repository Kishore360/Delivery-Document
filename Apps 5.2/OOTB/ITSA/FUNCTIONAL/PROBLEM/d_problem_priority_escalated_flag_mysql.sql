 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.priority_escalated_flag' ELSE 'SUCCESS' END as Message
 -- select SRC.sys_id,TA1.newvalue , TA.oldvalue

 FROM <<tenant>>_mdsdb.problem_final SRC 

left join 

(
select 
TA.documentkey, TA.sourceinstance,TA.tablename ,TA.fieldname,min(TA.sys_created_on) as mini,max(TA.sys_created_on)  as maxi
from  <<tenant>>_mdsdb.sys_audit_final  TA
where TA.tablename = 'problem' 
AND TA.fieldname =  'priority' 
group by TA.documentkey, TA.sourceinstance,TA.tablename ,TA.fieldname
)base
on SRC.sys_id  =base.documentkey  
 AND SRC.sourceinstance = base.sourceinstance  

LEFT JOIN <<tenant>>_mdsdb.sys_audit_final TA 
 ON (base.documentkey  =TA.documentkey  
 AND base.sourceinstance = TA.sourceinstance 
 and base.tablename=TA.tablename
 and base.fieldname=TA.fieldname
 and base.mini=TA.sys_created_on
  )

LEFT JOIN <<tenant>>_mdsdb.sys_audit_final TA1 
 ON (base.documentkey  =TA1.documentkey  
 AND base.sourceinstance = TA1.sourceinstance 
 and base.tablename=TA1.tablename
  and base.fieldname=TA1.fieldname
  and base.maxi=TA1.sys_created_on
  )
  
  LEFT JOIN <<tenant>>_mdwdb.d_problem TRGT 
 ON (SRC.sys_id  =TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  )
where coalesce(CASE WHEN TA.oldvalue IS NOT NULL AND TA1.newvalue IS NOT NULL   
AND  TA1.newvalue < TA.oldvalue
THEN 'Y' ELSE 'N' end,'N' )<>coalesce(TRGT.priority_escalated_flag,'');