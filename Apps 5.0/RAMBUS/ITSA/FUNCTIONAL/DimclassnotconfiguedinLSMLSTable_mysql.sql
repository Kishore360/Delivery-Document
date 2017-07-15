SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
 CASE WHEN count(1) >0 THEN 'Dimension classes not configured in LSM LS System Variables:Ignore Category and Subcategory for TJX' ELSE 'SUCCESS' END as Message,
 count(1) 
 FROM(select distinct dimension_class,source_id 
from rambus_mdwdb.d_lov lov where  source_id=2 and dimension_class 
not in (select class_value from rambus_workdb.lsm_ls_system_variables where enable_flag='Y'  )  and dimension_class 
 like '%~%' and  (dimension_class NOT LIKE '%GEO%') and dimension_class not in ('ASSET','ASSET_AGE','CITY~GEO','COUNTRY~GEO','CURRENCY','EXPENSE_ITEM','GENDER','STATE~GEO','WARRANTY',
'CRITICALITY~BUSINESS_SERVICE','CATEGORY~ADHOC_REQ','NAME~TASK_SLA','TASK_TYPE~TASK'))a; 