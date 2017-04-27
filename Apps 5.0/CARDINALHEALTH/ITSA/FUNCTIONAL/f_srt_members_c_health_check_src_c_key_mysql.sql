 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.u_srt_members_final SRC 
 LEFT JOIN 
 cardinalhealth_mdwdb.f_srt_members_c TRGT
on TRGT.row_id=SRC.sys_id and SRC.sourceinstance=TRGT.source_id
join cardinalhealth_mdwdb.d_lov LKP
on c.row_id=COALESCE( CONCAT('HEALTH_CHECK_C','~','U_SRT_MEMBERS','~','~','~',UPPER(SRC.u_health_check )),'UNSPECIFIED')
and a.sourceinstance=c.source_id
where  COALESCE(LKP.row_key , CASE WHEN SRC.u_health_check is null then 0 else -1 END) <> TRGT.health_check_src_c_key)temp;







	