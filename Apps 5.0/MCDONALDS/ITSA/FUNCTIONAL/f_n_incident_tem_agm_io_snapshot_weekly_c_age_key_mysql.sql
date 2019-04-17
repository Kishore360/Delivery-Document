SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE  'SUCCESS'  END as Result, 
CASE WHEN count(1)>0  THEN  'Age_key not populated correctly' ELSE  'SUCCESS'  END as Message 
from (
 select distinct age_key,floor((age/86400)/ending_backlog),l.lower_range_value,l.upper_range_value 
 ,l.row_key 
 from  mcdonalds_mdwdb.f_n_incident_agm_io_snapshot_weekly_c
join  mcdonalds_mdwdb.d_lov l on lower_range_value<=floor((age/86400)/ending_backlog) and  upper_range_value>=floor((age/86400)/ending_backlog) 
 where dimension_class='ASGMT_AGEBUCKET_WH~INCIDENT' and l.row_key<>age_key)a;
	 