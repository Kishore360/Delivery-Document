SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem.changed_on' ELSE 'SUCCESS' END as Message 
FROM (SELECT count(1) as CNT
FROM (select * from <<tenant>>_mdsdb.problem_final where cdctype<>'D') SRC  LEFT JOIN <<tenant>>_mdwdb.d_problem TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and convert_tz(SRC.sys_updated_on,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)<> TRGT.changed_on ) temp;
 
