SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.business_percentage_c' ELSE 'SUCCESS' END as Message
-- SELECT LKP.number,SRC.business_percentage,TRGT.business_percentage_c
FROM ingrammicro_mdsdb.task_sla_final SRC
JOIN ingrammicro_mdsdb.task_final LKP
ON  (SRC.task = LKP.sys_id AND SRC.sourceinstance = LKP.sourceinstance )
join ingrammicro_mdwdb.f_task_sla TRGT
on (SRC.sys_id=TRGT.row_id and SRC.sourceinstance =TRGT.source_id)
where SRC.business_percentage<>TRGT.business_percentage_c
and SRC.cdctype='X' and LKP.cdctype='X';


