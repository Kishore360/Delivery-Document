 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.u_srt_members_final SRC 
 LEFT JOIN 
 cardinalhealth_mdwdb.d_srt_members_c TRGT
on TRGT.row_id=SRC.sys_id and SRC.sourceinstance=TRGT.source_id
where COALESCE(SRC.sys_mod_count,'') <> TRGT.mod_count_c)temp;





