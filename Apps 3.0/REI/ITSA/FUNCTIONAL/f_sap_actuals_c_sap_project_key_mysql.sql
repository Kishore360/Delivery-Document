SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(

select count(1) as cnt
from rei_mdsdb.us_sap_actuals_final a
join rei_mdwdb.d_project b
on a.project_id=b.project_id
and a.sourceinstance=b.source_id
join rei_mdwdb.f_sap_actuals_c c
on MD5(a.row_id)=c.row_id
and a.sourceinstance = c.source_id
where b.row_key<> c.sap_project_key)a;