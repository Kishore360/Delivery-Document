SELECT 
CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from
cardinalhealth_mdwdb.f_change_request a
LEFT JOIN cardinalhealth_mdwdb.d_lov x ON (x.dimension_class='AGEBUCKET_WH~CHANGE_REQUEST'OR x.row_key IN (0,-1))
AND  floor(a.change_request_age/(24*3600))>= x.lower_range_value
AND floor(a.change_request_age/(24*3600)) <= x.upper_range_value
WHERE a.change_request_age_wh_code <> x.dimension_code )a;