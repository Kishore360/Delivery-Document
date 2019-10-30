SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_syseng_server_inv_history_fact_c.count_c' ELSE 'SUCCESS' END as Message

FROM  meritsa_mdsdb.syseng_server_inv_history_final SRC
join meritsa_mdwdb.f_syseng_server_inv_history_fact_c TRGT on 
concat(SRC.date_time,'~',SRC.server_type,'~',SRC.platform,'~',SRC.environment)=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where count<>count_c