SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(

select count(1) as cnt
from rei_mdsdb.us_sap_actuals_final a
left JOIN rei_mdwdb.f_sap_actuals_c b
on a.sourceinstance=b.source_id
and MD5(a.row_id) = b.row_id
join rei_mdwdb.d_lov c
on concat('SAP_ACTUALS~COST_ELEMENT','~~~',a.cost_element)= c.row_id 
where c.row_key<>b.sap_cost_element_key)a;