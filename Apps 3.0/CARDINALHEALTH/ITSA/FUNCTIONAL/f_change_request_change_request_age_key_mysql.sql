SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from
cardinalhealth_mdwdb.f_change_request a
LEFT JOIN cardinalhealth_mdwdb.d_lov x ON (x.dimension_class = 'AGEBUCKET_WH~CHANGE_REQUEST'
                                                              OR x.row_key IN (0,-1))
AND a.change_request_age >= x.lower_range_value
AND a.change_request_age <= x.upper_range_value
WHERE a.change_request_age_key <> x.row_key)a;