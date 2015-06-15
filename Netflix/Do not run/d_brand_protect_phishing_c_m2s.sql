SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN concat('Data did not Match: ',cnt) 
ELSE 'Data Matched' END AS Message 
FROM (
select a.cnt1-b.cnt2 as cnt from 
(select count(*) as cnt1 from netflix_mdwdb.d_brand_protect_phishing_c where source_id in(0,2) and row_id not in (0,-1))a,
(select count(*) as cnt2 FROM netflix_mdsdb.u_brandprotectphishing_final  bpp
WHERE bpp.sourceinstance IN(0,2) )b) c;
