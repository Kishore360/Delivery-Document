SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select a.cnt1-b.cnt2 as cnt from 
(select count(*) as cnt1 from netflix_mdwdb.f_brand_protect_phishing_c where source_id in(0,2))a,
(select count(*) as cnt2 FROM netflix_mdsdb.u_brandprotectphishing_final  bpp
WHERE bpp.sourceinstance IN(0,2))b)c; 
