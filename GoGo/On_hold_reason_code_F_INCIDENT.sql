gogo_mdsdb.incident_final s
inner join gogo_mdwdb.f_incident i on s.sys_id collate utf8_unicode_ci=i.row_id 
and s.sourceinstance = i.source_id
where coalesce(s.u_on_hold_reason collate utf8_unicode_ci ,' ')=coalesce(i.on_hold_reason_src_code_c ,' ')
