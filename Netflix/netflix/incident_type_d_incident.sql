
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from netflix_mdwdb.d_incident di join netflix_mdwdb.f_brand_protect_phishing_c phis on di.row_key = phis.incident_key and di.row_key not  in ( 0,-1) and di.incident_type = 'PHISHING') c
