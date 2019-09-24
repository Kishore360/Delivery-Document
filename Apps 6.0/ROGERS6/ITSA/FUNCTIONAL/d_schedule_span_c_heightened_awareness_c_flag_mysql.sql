SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_schedule_span_c.heightened_awareness_c_flag' ELSE 'SUCCESS' END as Message
-- select distinct SRC1.name,CASE WHEN SRC1.name='Freeze' THEN 'Y' ELSE 'N' end,TRGT.heightened_awareness_c_flag,SRC.cdctype
 FROM rogers6_mdsdb.cmn_schedule_span_final  SRC  
left join rogers6_mdsdb.cmn_schedule_blackout_final SRC1
on SRC.schedule=SRC1.sys_id
JOIN rogers6_mdwdb.d_schedule_span_c TRGT 
ON SRC.sys_id= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
 WHERE  CASE WHEN SRC1.name='Freeze' THEN 'Y' ELSE 'N' end<>TRGT.heightened_awareness_c_flag
and SRC.CDCTYPE='X' and SRC1.CDCTYPE='X';