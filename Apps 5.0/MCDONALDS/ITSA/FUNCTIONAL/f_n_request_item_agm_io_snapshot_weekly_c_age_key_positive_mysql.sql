
  SELECT CASE WHEN count(1)<1  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)<1  THEN 'Age_key not populated correctly' ELSE 'SUCCESS' END as Message 
FROM ( 
       
            select priority_src_key,business_service_c_key,week_start_key,floor((age/86400)/ending_backlog) as  age_populated ,
case when floor((age/86400)/ending_backlog) between 0 and 1 then 71187
     when floor((age/86400)/ending_backlog)  between 2 and 4 then 71188
     when floor((age/86400)/ending_backlog)  between 5 and 7 then 71189
     when floor((age/86400)/ending_backlog)  between 8 and 14 then 71190
     when floor((age/86400)/ending_backlog)  between 15 and 28 then 71191
     when floor((age/86400)/ending_backlog)  between 29 and 60 then 71192
     when floor((age/86400)/ending_backlog)  between 61 and 1000000 then 71193  end  age_key_expected ,age_key age_key_actual
     from  mcdonalds_mdwdb.f_n_request_item_agm_io_snapshot_weekly_c
     where   case when floor((age/86400)/ending_backlog) between 0 and 1 then 71187
     when floor((age/86400)/ending_backlog)  between 2 and 4 then 71188
     when floor((age/86400)/ending_backlog)  between 5 and 7 then 71189
     when floor((age/86400)/ending_backlog)  between 8 and 14 then 71190
     when floor((age/86400)/ending_backlog)  between 15 and 28 then 71191
     when floor((age/86400)/ending_backlog)  between 29 and 60 then 71192
     when floor((age/86400)/ending_backlog)  between 61 and 1000000 then 71193  end  =age_key)a;