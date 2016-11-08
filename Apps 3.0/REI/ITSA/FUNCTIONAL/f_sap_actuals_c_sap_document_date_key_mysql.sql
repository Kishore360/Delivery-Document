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
join
rei_mdwdb.d_sap_document_date lkp
on COALESCE(DATE_FORMAT(a.document_date,'%Y%m%d'),'UNSPECIFIED') =lkp.row_id
where  COALESCE(lkp.row_key,case when a.document_date is null then 0  else -1 end )<> b.sap_document_date_key)a;

