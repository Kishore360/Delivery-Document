SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_task_c.source_url' ELSE 'SUCCESS' END as Message
  from 
 (select SRC.sys_id,TRGT.source_url,CONCAT('<a href=\"https://molina.service-now.com/nav_to.do?uri=u_hr_case.do?sys_id=',SRC.sys_id,'\" target=\"_blank\">',SRC.number,'</a>') as src_url,
case when CONCAT('<a href=\"https://molina.service-now.com/u_hr_case.do?sys_id=',SRC.sys_id,'\" target=\"_blank\">',SRC.number,'</a>') =  source_url then 1
when CONCAT('<a href=\"https://molina.service-now.com/nav_to.do?uri=u_hr_case.do?sys_id=',SRC.sys_id,'\" target=\"_blank\">',SRC.number,'</a>') = source_url then 1 else 0 end as fail_cnt
FROM molinahealth_mdsdb.u_hr_case_final SRC
LEFT JOIN molinahealth_mdwdb.d_hr_case_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) ) fnl
where fail_cnt = 0;
