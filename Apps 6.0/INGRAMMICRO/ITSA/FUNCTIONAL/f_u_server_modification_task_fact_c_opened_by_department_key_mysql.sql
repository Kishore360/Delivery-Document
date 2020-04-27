SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message  
 
 --  select SRC.number, COALESCE(LKP.row_key,CASE WHEN (scu.department is  null ) THEN 0 else -1 end), (TRGT.opened_by_department_key) ,
  -- concat('DEPARTMENT~',scu.department), LKP.row_id 
 FROM  ingrammicro_mdsdb.u_server_modification_task_final SRC 
 left join    ingrammicro_mdsdb.sys_user_final scu on SRC.opened_by = scu.sys_id and SRC.sourceinstance=scu.sourceinstance and SRC.cdctype<>'D'and scu.cdctype<>'D'
 left join ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  left join   ingrammicro_mdwdb.d_internal_organization LKP
 ON ( concat('DEPARTMENT~',scu.department)= LKP.row_id 
 AND scu.sourceinstance= LKP.source_id )

 WHERE COALESCE(LKP.row_key,CASE WHEN (scu.department is  null ) THEN 0 else -1 end)<> (TRGT.opened_by_department_key) 
;

