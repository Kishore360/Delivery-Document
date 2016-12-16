 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.survey_response_final a
JOIN  cardinalhealth_mdwdb.f_response b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
join cardinalhealth_mdwdb.d_lov lkp
on COALESCE( CONCAT('CALCULATION_TYPE_C','~','RESPONSE','~','~','~',UPPER(a.u_calculation_type )),'UNSPECIFIED') = lkp.row_id
where coalesce(lkp.row_key,case when f.u_calculation_type is null then 0 else -1 end)<>b.calculation_type_c_key)c

