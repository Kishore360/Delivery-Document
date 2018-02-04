SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.f_work_order TRGT ON (SRC.request_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
LEFT JOIN schneider_mdwdb.d_lov L  
ON ( floor(TRGT.age/(3600*24)) BETWEEN L.lower_range_value AND L.upper_range_value) and L.dimension_class='AGEBUCKET_WH~WORK_ORDER' 
WHERE  TRGT.age_key <> coalesce(L.row_key,-1)) temp

