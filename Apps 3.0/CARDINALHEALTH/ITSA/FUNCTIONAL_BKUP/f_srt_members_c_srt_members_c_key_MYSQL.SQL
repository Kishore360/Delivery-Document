 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.u_srt_members_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_srt_members_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
join cardinalhealth_mdwdb.d_srt_members_c lkp
on lkp.row_id=SRC.sys_id and SRC.sourceinstance=lkp.source_id
where COALESCE(lkp.row_key) <> TRGT.srt_members_c_key)temp;





