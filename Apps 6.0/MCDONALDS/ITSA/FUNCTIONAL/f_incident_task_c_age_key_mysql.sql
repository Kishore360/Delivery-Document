SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_task_c.age_key' ELSE 'SUCCESS' END as Message 

FROM mcd_mdwdb.f_incident_task_c trgt
RIGHT JOIN mcd_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
 JOIN mcd_mdwdb.d_lov lkp ON floor(trgt.age/86400) BETWEEN lkp.lower_range_value AND lkp.upper_range_value and lkp.dimension_class ='AGEBUCKET_WH~INCIDENT_TASK'
where  COALESCE(lkp.row_key,CASE WHEN trgt.age IS NULL THEN 0 else -1 end) <> trgt.age_key
;