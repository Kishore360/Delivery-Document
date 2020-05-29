SELECT table_catalog,table_name,privilege_type
FROM information_schema.table_privileges P
JOIN pg_class V
on(P.table_name=V.relname
and V.relkind='v')
where table_schema = 'ldb'
order by 1,2,3