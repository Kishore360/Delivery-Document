SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from schneider_mdsdb.hpd_help_desk_final s
left join schneider_mdwdb.f_incident t
on s.incident_number=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN schneider_mdwdb.d_lov L  
ON ( floor(t.dormancy_age/(3600*24)) BETWEEN L.lower_range_value AND L.upper_range_value)
WHERE L.dimension_class='DORMANCYBUCKET_WH~INCIDENT' and t.dormancy_age_key <> coalesce(L.row_key,case when t.dormancy_age is null then 0 else -1 end)) temp

