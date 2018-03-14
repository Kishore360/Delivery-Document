SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' ELSE 'SUCCESS' END as Message  
 FROM (select count(1) as cnt
 FROM
 aetna_mdwdb.d_change_request d_cr
join aetna_mdwdb.f_change_request f_cr 
on d_cr.row_key=f_cr.change_request_key
join aetna_mdwdb.d_lov lov 
on f_cr.review_status_src_key = lov.row_key 
where d_cr.failure_flag <> CASE WHEN lov.dimension_name in
('Unsuccessful', 'Unsuccessful - Created an Incident','Backed Out') THEN 'Y' ELSE 'N' END)b;
