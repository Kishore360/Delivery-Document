
	 
	     SELECT CASE WHEN count(1)<1  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)<1  THEN 'Age_key not populated correctly' ELSE 'SUCCESS' END as Message 
FROM (   
            select assignment_group_key,priority_src_key,business_service_c_key,month_start_key,floor((age/86400)/ending_backlog) as  age_populated ,
case when floor((age/86400)/ending_backlog) between 0 and 1 then 71178
     when floor((age/86400)/ending_backlog)  between 2 and 4 then 71179
     when floor((age/86400)/ending_backlog)  between 5 and 7 then 71180
     when floor((age/86400)/ending_backlog)  between 8 and 14 then 71181
     when floor((age/86400)/ending_backlog)  between 15 and 28 then 71182
     when floor((age/86400)/ending_backlog)  between 29 and 60 then 71183
     when floor((age/86400)/ending_backlog)  between 61 and 1000000 then 71184 end age_key_expected  ,age_key age_key_actual
     from  mcdonalds_mdwdb.f_n_request_item_io_snapshot_monthly_c
     where   case when floor((age/86400)/ending_backlog) between 0 and 1 then 71178
     when floor((age/86400)/ending_backlog)  between 2 and 4 then 71179
     when floor((age/86400)/ending_backlog)  between 5 and 7 then 71180
     when floor((age/86400)/ending_backlog)  between 8 and 14 then 71181
     when floor((age/86400)/ending_backlog)  between 15 and 28 then 71182
     when floor((age/86400)/ending_backlog)  between 29 and 60 then 71183
     when floor((age/86400)/ending_backlog)  between 61 and 1000000 then 71184 end  =age_key)a ;
	 
	 