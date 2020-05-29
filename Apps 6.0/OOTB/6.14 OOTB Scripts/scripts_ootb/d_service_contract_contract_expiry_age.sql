SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_contract.contract_expiry_age' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.d_service_contract d 
left join (select max(lastupdated) as lastupdated, source_id  from #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) o
on o.source_id=d.source_id
where d.row_key not in (0,-1) and
(
TIMESTAMPDIFF(second,convert_tz((o.lastupdated),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),
convert_tz(coalesce(d.renewal_end_on,d.contract_end_on),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))+86400  <>
coalesce(d.contract_expiry_age,'')
)
