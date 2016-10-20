SELECT distinct CASE WHEN cnt > 0 THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN cnt > 0 THEN 'Data Matched' 
ELSE 'Data did not Match' END AS Message 
FROM (
select dd_position,product_name,module_name,placeholder_type,count(*) as cnt from ldb.f_landing_page
group by 1,2,3,4
)a