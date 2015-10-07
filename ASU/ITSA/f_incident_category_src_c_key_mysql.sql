
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from asu_mdsdb.incident_final a
 left join asu_mdwdb.d_lov b on 
COALESCE(CONCAT('U_CATEGORY~INCIDENT~~~',a.u_category),'UNSPECIFIED')=b.src_rowid
left join asu_mdwdb.f_incident c on a.sourceinstance=c.source_id and a.sys_id=c.row_id
<<<<<<< HEAD
where COALESCE(b.row_key,-1)<>c.category_src_key
=======
where (b.row_key)<>c.category_src_c_key
>>>>>>> f1878cfb2afcb1d94d52ba7409b1c9d0aed87eff

)i; 
