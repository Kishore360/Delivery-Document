SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
 FROM
rei_mdsdb.us_sap_actuals_final a
left join rei_mdwdb.d_calendar_date b
on b.row_id=date_format(a.document_date,'%Y%m%d')
left join rei_mdwdb.f_sap_actuals_c c
on MD5(a.row_id)=c.row_id
where b.row_key<>c.sap_document_date_key
;