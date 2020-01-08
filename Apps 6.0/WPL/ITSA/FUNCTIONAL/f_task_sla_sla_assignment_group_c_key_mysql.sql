SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_task_sla.sla_assignment_group_c_key' ELSE 'SUCCESS' END as Message 
 FROM (

 

select 
count(1) cnt
                         FROM wpl_mdsdb.task_sla_final SRC 
 LEFT JOIN wpl_mdwdb.f_task_sla TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 
 where COALESCE((CASE WHEN (COALESCE(concat('GROUP~',
                SRC.u_sla_assignment_group),
                'UNSPECIFIED')) = 'UNSPECIFIED'
                            THEN 0
                            ELSE (
                                    SELECT row_key
                                    FROM wpl_mdwdb.d_internal_organization
                                    WHERE row_id =  (COALESCE(concat('GROUP~',
                SRC.u_sla_assignment_group),
                'UNSPECIFIED'))  AND source_id =  TRGT.source_id 
                                        AND DATE_FORMAT(TRGT.pivot_date, '%Y-%m-%d %H:%i:%s') 
                                    BETWEEN effective_from AND effective_to
                                    )
                            END
                        ), - 1) <> TRGT.sla_assignment_group_c_key and SRC.cdctype <>'D') a