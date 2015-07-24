SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(

select count(1) as cnt
from rei_mdsdb.us_sap_actuals_final a
left join rei_mdwdb.f_sap_actuals_c b
on
a.sourceinstance=b.source_id
and MD5(a.row_id) = b.row_id
where  a.document_header_text<> b.sap_document_header_text)a;