SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from cardinalhealth_workdb.dwh_f_incident f
left outer join cardinalhealth_workdb.dwh_d_lov l on f.state_src_code = l.dimension_code
and l.dimension_class ='STATE~INCIDENT' 
where case when f.state_src_code is null then '0' else
case when  l.dimension_code is null then '-1' else l.row_key end end<>f.state_src_key 
) c;

