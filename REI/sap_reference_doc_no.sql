SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(

select count(1) as cnt
from rei_mdsdb.us_sap_actuals_final a
inner join rei_mdwdb.f_sap_actuals_c b
on
MD5(a.row_id) = b.row_id
and a.sourceinstance=b.source_id
where  a.ref_document_number<> b.sap_reference_doc_no)a;