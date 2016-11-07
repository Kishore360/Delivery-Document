SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(

select count(1) as cnt
from rei_mdsdb.us_sap_actuals_final a
inner join rei_mdwdb.f_sap_actuals_c b
on
a.sourceinstance=b.source_id
and MD5(a.row_id) = b.row_id
where  a.posted_unit_of_measure<> b.sap_posted_unit_of_measure)a;
