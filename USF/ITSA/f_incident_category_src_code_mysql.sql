select count(*) from
usf_mdwdb.f_incident a  INNER JOIN usf_mdsdb.incident_final  b  ON a.row_id =b.sys_id 
LEFT OUTER JOIN usf_mdsdb.sc_category_final c ON (b.u_csi_category=c.sys_id)
 
where a.category_src_code<>CASE WHEN b.opened_at<'2014-08-14 00:00:00' THEN b.u_category ELSE c.title END