SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.last_resolved_on' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final SRC
left join #DWH_TABLE_SCHEMA.d_case TRGT
on TRGT.row_id = SRC.sys_id and TRGT.source_id = SRC.sourceinstance
left join
(
select audit.documentkey, audit.sourceinstance, max(audit.sys_created_on) resolve_date,LOVMAP.dimension_wh_code as dimension_wh_code
from #MDS_TABLE_SCHEMA.sys_audit_final audit
left join #DWH_TABLE_SCHEMA.d_lov_map LOVMAP
on coalesce(concat('STATE~CASE~',audit.newvalue),'UNSPECIFIED') = LOVMAP.src_rowid
where LOVMAP.dimension_wh_code in ('RESOLVED') and audit.fieldname = 'state'
group by audit.documentkey, audit.sourceinstance
)SQ
on TRGT.row_id = SQ.documentkey and TRGT.source_id = SQ.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map lm
on lm.src_key = TRGT.state_src_key
where TRGT.soft_deleted_flag = 'N' and lm.dimension_wh_code in ('RESOLVED','CLOSED')
and convert_tz(coalesce(SQ.resolve_date,SRC.sys_updated_on), '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>') <> coalesce(TRGT.last_resolved_on,''); 	