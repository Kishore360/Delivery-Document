SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.met_sla_flag' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from whirlpool_mdsdb.u_ad_hoc_request_final  SRC 
 join whirlpool_mdwdb.d_ad_hoc_request_c TRGT
 on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where case when SRC.made_sla=1 then 'Y' else 'N' end<>TRGT.met_sla_flag and SRC.CDCTYPE='X')ma