SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.go_live_outcome_c' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_change_request trgt
RIGHT JOIN (select * from mcd_mdsdb.change_request_final where cdctype<>'D') src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and src.u_go_live_outcome <>go_live_outcome_c
;