-- Please Ignore the dimension classes related to Asset,Finance
-- APP 1870 is the defect raised for not having LSM LS Dim class not configured 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Dimension classes not configured in LSM LS System Variables' ELSE 'SUCCESS' END as Message
 FROM(
select distinct dimension_class,class_value,source_id
from <<tenant>>_mdwdb.d_lov lov
left join <<tenant>>_workdb.lsm_ls_system_variables conf on dimension_class=class_value
where class_value is null and source_id=2 and dimension_class not in (

'ASSET',
'ASSET_AGE',
'CITY~GEO',
'COUNTRY~GEO',
'CURRENCY',
'EXPENSE_ITEM',
'GENDER',
'STATE~GEO',
'WARRANTY')
)a