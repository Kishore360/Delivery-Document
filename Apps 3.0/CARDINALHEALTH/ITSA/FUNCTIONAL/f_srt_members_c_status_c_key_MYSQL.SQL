 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.u_srt_members_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_srt_members_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
join cardinalhealth_mdwdb.d_lov lkp
on lkp.row_id=UPPER(CONCAT('STATUS_C~SRT_MEMBERS~~~',SRC.u_status)) and SRC.sourceinstance=lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN SRC.u_status IS NULL THEN 0 else -1 end) <> TRGT.status_c_key)temp;


