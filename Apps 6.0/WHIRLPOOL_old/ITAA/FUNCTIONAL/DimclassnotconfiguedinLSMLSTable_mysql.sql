SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Dimension classes not configured in LSM LS System Variables:Ignore Category and Subcategory for TJX' ELSE 'SUCCESS' END as Message
 FROM(
select distinct dimension_class,source_id
from whirlpool_mdwdb.d_lov lov where  source_id=2 and dimension_class 
not in (select class_value from whirlpool_workdb.lsm_ls_system_variables where enable_flag='Y'  )  and dimension_class 
 like '%~%' and  (dimension_class NOT LIKE '%GEO%') and dimension_class not in (
'ASSET',
'ASSET_AGE',
'CITY~GEO',
'COUNTRY~GEO',
'CURRENCY',
'EXPENSE_ITEM',
'GENDER',
'STATE~GEO',
'WARRANTY',
'CRITICALITY~BUSINESS_SERVICE',
'CI_CLASS_AUTOFILL_C~INCIDENT',
'COUNTRIES~U_AD_HOC_REQUEST',
'LKP_REGION_C~CHANGE_REQUEST',
'LKP_REGION_C~INCIDENT',
'CI_CLASS_AUTOFILL_C~TASK',
'LKP_REGION_C~ASSET',
'LKP_REGION_C~PROBLEM'
))a;
