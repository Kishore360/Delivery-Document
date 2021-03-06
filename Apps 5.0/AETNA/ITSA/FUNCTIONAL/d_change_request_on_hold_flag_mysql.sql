SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM aetna_mdsdb.change_request_final SRC 
 LEFT JOIN aetna_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id and SRC.CDCTYPE<>'D' )
join (select source_id,max(lastupdated) as lastupdated from aetna_mdwdb.d_o_data_freshness group by source_id) f1 on
 (f1.source_id = SRC.sourceinstance)
and  (SRC.cdctime<=f1.lastupdated)
 WHERE TRGT.on_hold_flag <> case when SRC.on_hold=1 then 'Y' else 'N' end