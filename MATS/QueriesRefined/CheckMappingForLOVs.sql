SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Mapping missing for some LOVs' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdwdb.d_lov L
left join <<tenant>>_mdwdb.d_lov_map LM
on(L.src_rowid=LM.src_rowid)
where (dimension_wh_code is null or dimension_wh_code=''
or wh_dimension_class is null or wh_dimension_class=''
or LM.dimension_class <> L.dimension_class
)
and L.dimension_class not like '%^_WH%' escape '^'
and L.dimension_class not like 'WH~%' 
and L.dimension_class not like '% WH %' 
and L.dimension_class not in('TENANT_INFORMATION','UNKNOWN','UNSPECIFIED')
