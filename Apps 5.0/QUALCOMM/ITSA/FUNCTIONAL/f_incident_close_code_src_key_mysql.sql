SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
qualcomm_mdsdb.incident_final x LEFT join qualcomm_mdwdb.d_lov y on  y.dimension_class  like 'CLOSE_CODE~INCIDENT%' and
CONCAT('CLOSE_CODE~INCIDENT~~~',x.close_code)=y.row_id
left join qualcomm_mdwdb.f_incident B on x.sourceinstance=B.source_id AND B.ROW_ID=x.sys_id
WHERE y.row_key<> B.close_code_src_key
)E;

