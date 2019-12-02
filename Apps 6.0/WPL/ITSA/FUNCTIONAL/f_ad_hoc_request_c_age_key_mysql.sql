SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.age_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt
from wpl_mdwdb.d_ad_hoc_request_c f  
left join  wpl_mdwdb.f_ad_hoc_request_c d  on f.row_key=d.ad_hoc_request_c_key
LEFT JOIN wpl_mdwdb.d_lov L  
ON  floor(round(f.age,1)) BETWEEN (L.lower_range_value+0.1) AND L.upper_range_value
AND L.dimension_class = 'WH_AGEBUCKET~U_AD_HOC_REQUEST' 
WHERE coalesce(L.row_key,case when f.age is null then 0 else -1 end ) <> d.age_key and f.soft_deleted_flag ='N'
)ma

