SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.resolve_to_close_duration' ELSE 'SUCCESS' END as Message
/*SELECT TRGT.row_key, L.dimension_wh_code, SRC.resolved_at, coalesce(SRC.closed_at,SRC.sys_updated_on),
case when SRC.resolved_at is null then null
  when L.dimension_wh_code in ('CLOSED') and SRC.resolved_at is not null THEN
		CASE WHEN coalesce(SRC.resolved_at,0) <= coalesce(SRC.closed_at,SRC.sys_updated_on) 
        then COALESCE( TIMESTAMPDIFF(SECOND, SQ.resolve_date,
			COALESCE( SRC.closed_at,SRC.sys_updated_on)) ,0) else '' end
	  else '' end sr,
COALESCE(TRGT.resolve_to_close_duration ,'') tg*/
FROM  (SELECT * FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_case TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
left join (select audit.documentkey, audit.sourceinstance, max(audit.sys_created_on) resolve_date
from #MDS_TABLE_SCHEMA.sys_audit_final audit
left join #DWH_TABLE_SCHEMA.d_lov_map  LOVMAP
on coalesce(concat('STATE~CASE~',audit.newvalue),'UNSPECIFIED') = LOVMAP.src_rowid
where LOVMAP.dimension_wh_code = 'RESOLVED'
group by audit.documentkey, audit.sourceinstance ) SQ
on SQ.documentkey = TRGT.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L
ON (concat('STATE~CASE~',upper(SRC.state))=L.src_rowid
 AND SRC.sourceinstance=L.source_id )
WHERE case when SRC.resolved_at is null then null
  when L.dimension_wh_code in ('CLOSED') and SRC.resolved_at is not null THEN
		CASE WHEN coalesce(SRC.resolved_at,0) <= coalesce(SRC.closed_at,SRC.sys_updated_on) 
        then COALESCE( TIMESTAMPDIFF(SECOND, SQ.resolve_date,
			COALESCE( SRC.closed_at,SRC.sys_updated_on)) ,0) else '' end
	  else '' end
<> COALESCE(TRGT.resolve_to_close_duration ,'');