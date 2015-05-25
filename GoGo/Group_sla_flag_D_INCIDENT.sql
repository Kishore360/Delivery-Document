SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt from gogo_mdsdb.incident_final a
inner join gogo_mdwdb.d_incident  b on a.sys_id collate utf8_unicode_ci=b.row_id  #and b.row_key <100
where case when a.u_group_sla ='1' then 'Y' else 'N' end <> b.group_sla_c_flag
 ) c;
