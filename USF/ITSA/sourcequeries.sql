select count(*) from
usf_mdwdb.f_incident a  INNER JOIN usf_mdsdb.incident_final  b  ON a.row_id =b.sys_id 
LEFT OUTER JOIN usf_mdsdb.sc_category_final c ON (b.u_csi_category=c.sys_id)
 
where a.category_src_code<>CASE WHEN b.opened_at<'2014-08-14 00:00:00' THEN b.u_category ELSE c.title END
***********************
 
select count(*) from usf_mdwdb.f_incident fi JOIN
usf_mdsdb.incident_final f ON fi.row_id = f.sys_id where
fi.close_code_src_code = f.u_closure_code
or fi.close_code_src_code = COALESCE( CONCAT('CLOSE_CODE','~','INCIDENT','~','~','~',UPPER(f.u_closure_code )),'UNSPECIFIED');
 
 
********************************
select count(*) from usf_mdwdb.f_incident fi
JOIN usf_mdsdb.incident_final f ON (fi.row_id =f.sys_id)
where
fi.sub_category_src_code = f.u_service_desk
*************
select count(*) from usf_mdwdb.f_incident fi
JOIN usf_mdsdb.incident_final f ON (fi.row_id =f.sys_id)
where fi.reported_type_src_code = f.u_source
 *************************
select count(*) from usf_mdwdb.f_incident a
join  usf_mdwdb.d_incident b on  a.source_id = b.source_id and a.row_id = b.row_id
where open_to_resolve_duration <> open_to_close_duration or
resolve_to_close_duration <> TIMESTAMPDIFF(SECOND,last_resolved_on,closed_on);
 
********************************************