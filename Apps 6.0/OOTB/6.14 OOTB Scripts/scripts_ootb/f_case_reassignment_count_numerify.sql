select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.reassignment_count_numerify' ELSE 'SUCCESS' END as Messag
/*select TRGT.row_key, TRGT.row_id, TRGT.case_key,
COALESCE(SQ.reassignment_count,0) sr, COALESCE(TRGT.reassignment_count_numerify) tg */
from (SELECT * FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final WHERE CDCTYPE<>'D') SRC
left join (
select sys_audit.documentkey, sys_audit.sourceinstance, count(case when CONVERT_TZ(coalesce(D.last_resolved_on,D.closed_on), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') >= sys_audit.sys_created_on then sys_audit.sys_id else null end) as reassignment_count
from #MDS_TABLE_SCHEMA.sys_audit_final sys_audit
left join #DWH_TABLE_SCHEMA.d_case D 
ON (sys_audit.documentkey=D.row_id AND sys_audit.sourceinstance=D.source_id)
where sys_audit.fieldname = 'assignment_group'
group by sys_audit.documentkey, sys_audit.sourceinstance
) SQ
on SRC.sys_id = SQ.documentkey and SQ.sourceinstance = SRC.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_case TRGT 
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id )
where COALESCE(SQ.reassignment_count,0) <> COALESCE(TRGT.reassignment_count_numerify);
