select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_change_request.met_sla_flag' ELSE 'SUCCESS' END as Message from 
ingrammicro_mdsdb.change_request_final SRC
left join  ingrammicro_mdwdb.d_change_request TRGT 
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where case when SRC.made_sla= 1 then 'Y' else 'N' end <>TRGT. met_sla_flag