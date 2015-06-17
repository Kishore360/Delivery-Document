SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from rei_mdwdb.d_internal_organization a join 
rei_mdwdb.d_internal_contact b on a.director_c_key=b.row_key
and a.director_name_c<>COALESCE(concat(b.first_name,' ',b.last_name),'UNKNOWN') 
and a.director_name_c  not like '%UNSPE%')c