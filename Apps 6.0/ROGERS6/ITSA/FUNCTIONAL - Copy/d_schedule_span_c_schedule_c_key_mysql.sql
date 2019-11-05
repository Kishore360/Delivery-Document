SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_schedule_span_c.schedule_c_key' ELSE 'SUCCESS' END as Message
-- select distinct SRC.schedule,coalesce(LKP.row_key,case when SRC.schedule is null then -1 else 0 end),TRGT.schedule_c_key,SRC.cdctype
 FROM rogers_mdsdb.cmn_schedule_span_final  SRC  
JOIN rogers_mdwdb.d_schedule_span_c TRGT 
ON SRC.sys_id= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
join rogers_mdwdb.d_schedule_c LKP
on COALESCE(SRC.schedule,'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.row_id
 WHERE  coalesce(LKP.row_key,case when SRC.schedule is null then -1 else 0 end)<>TRGT.schedule_c_key
and SRC.CDCTYPE='X' and LKP.soft_deleted_flag='N';
