SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM wpl_mdsdb.problem_final SRC 
LEFT JOIN wpl_mdwdb.f_problem TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE 
CASE 
 WHEN SRC.u_act_out_time  is null  THEN NULL   
 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_act_out_time ) < 0 THEN NULL    
 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_act_out_time ) > 214748364 THEN NULL     
 ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_act_out_time ) end <> actual_outage_time_c
<<<<<<< HEAD
 and SRC.CDCTYPE='X'
=======
 and SRC.cdctype='X'
>>>>>>> 9090f642d78b2876f16aceb3bf589190f5fc5da4
