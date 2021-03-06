
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task_sla.sla_category' ELSE 'SUCCESS' END as Message
-- select  distinct TRGT.sla_category

from ( SELECT * FROM #MDS_TABLE_SCHEMA.contract_sla_final WHERE CDCTYPE<>'D') SRC

left join   #DWH_TABLE_SCHEMA.d_task_sla TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

where convert( case when lower(SRC.name) like '%resolution%' then  'Resolution' 
when  lower(SRC.name) like '%response%' then 'Response' ELSE NULL END 
 using latin1 )COLLATE latin1_bin  <> convert( TRGT.sla_category using latin1)COLLATE latin1_bin ;
 