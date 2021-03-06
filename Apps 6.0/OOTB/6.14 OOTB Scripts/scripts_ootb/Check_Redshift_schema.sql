
select nspname, relname, a.attname,typname,case when  a.attname in ('doc_currency_code','loc_currency_code','uom_code','status_code','approval_status_code'
,'invoice_status_code') then 'character varying(50) ' else format_type(atttypid, atttypmod) end as format_type 
from pg_attribute a, pg_namespace n, pg_class c, pg_type Typ 
where n.oid = c.relnamespace and  a.attrelid = c.oid
and c.relname not like '%pkey'and n.nspname not like 'pg%'and n.nspname not like 'information%'and Typ.oid = atttypid
and relname not like 'o^_%' escape '^' 
and relname not like 's^_%' escape '^' 
and relname not like 'a^_%' escape '^'
and relname not like '%^_bak' escape '^'
and relname not like '%^_backup' escape '^'
and relname not like '%^_bakup' escape '^'
and nspname in ('#SCHEMA_NAME')
and attnum > 0
order by nspname, relname, a.attname,a.attnum;
