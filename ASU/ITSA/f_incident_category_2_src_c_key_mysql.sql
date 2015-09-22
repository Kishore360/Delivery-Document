
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from <<tenant>>_mdsdb.incident_final a
 left join <<tenant>>_mdwdb.d_lov b on 
COALESCE(CONCAT('U_CATEGORY~INCIDENT~~~',a.u_category_2),'UNSPECIFIED')=b.row_id
left join <<tenant>>_mdwdb.f_incident c on a.sourceinstance=c.source_id and a.sys_id=c.row_id
where COALESCE(b.row_key,-1)<>c.category_2_src_c_key

)i; 