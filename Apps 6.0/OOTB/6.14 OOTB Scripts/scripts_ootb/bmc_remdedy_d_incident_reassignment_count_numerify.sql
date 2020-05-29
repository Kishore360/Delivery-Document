SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.reassignment_count_numerify' ELSE 'SUCCESS' END as Message

FROM #DWH_TABLE_SCHEMA.d_incident TGT
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=TGT.state_src_key)
left join #MDS_TABLE_SCHEMA.bmc_hpd_help_desk_sys_audit_final SRC
on (TGT.row_id = SRC.documentkey 
and TGT.source_id = SRC.sourceinstance)
where  tablename='hpd_help_desk' and fieldname='Assigned Group'  
and oldvalue is not NULL and (SRC.cdctype <> 'D' )
and case when LM.dimension_wh_code<>'OPEN' then coalesce(TGT.last_resolved_on,TGT.closed_on) else now() end > SRC.sys_created_on 
group by TGT.row_id,TGT.reassignment_count_numerify
having  coalesce(TGT.reassignment_count_numerify,'0') <>  count(1)