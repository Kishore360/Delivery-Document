SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdwdb.f_hr_case_c f  
LEFT JOIN asu_mdwdb.d_lov L  
ON (f.dormancy_age BETWEEN L.lower_range_value AND L.upper_range_value)
AND L.dimension_class = 'DORMANCYAGE_C~HRCASE'
where L.row_key<> f.dormancy_age_key
) temp