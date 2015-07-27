select count(*) from netflix_worksdb.d_malware_tracking_c;
select count(*) FROM netflix_mdsdb.u_malware_tracking_delta;




select count(*) as cnt from netflix_mdwdb.fs_incident dfi join (SELECT sys_id, sourceinstance, TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',business_duration) from netflix_mdsdb.incident_delta) incf on dfi.row_id = incf.sys_id and dfi.source_id= incf.sourceinstance and dfi.open_to_resolve_duration <> incf.business_duration




select count(*) from netflix_mdwdb.f_malware_tracking_c;
select count(*) FROM netflix_mdsdb.u_malware_tracking_delta

select count(*) from netflix_worksdb.ds_netflix_mdwdbt f where  reassignment_count > 1 and f.multiple_assignment_flag='Y';

select count(*) from netflix_mdwdb.fs_incident dfi join (SELECT sys_id, sourceinstance, closed_at, closed_by from netflix_mdsdb.incident_delta) incf on dfi.row_id = incf.sys_id and dfi.source_id= incf.sourceinstance and dfi.last_resolved_on_id <> COALESCE(DATE_FORMAT(CONVERT_TZ(incf.closed_at,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#'),'%Y%m%d'),'UNSPECIFIED') and
dfi.last_resolved_by_id <> case when incf.closed_by is null then 'UNSPECIFIED' else concat('INTERNAL_CONTACT~',incf.closed_by) end ;



select count(*) from netflix_mdwdb.ds_netflix_mdwdbt a    WHERE  TIMESTAMPDIFF(MINUTE,a.opened_on,a.closed_on)<30 and a.first_call_resolution_flag <> 'Y';



select count(*) from netflix_mdwdb.d_incident;
select count(*) FROM netflix_mdsdb.incident_delta i
LEFT JOIN netflix_mdsdb.incident_final parent_i
ON i.u_parent_incident=parent_i.sys_id