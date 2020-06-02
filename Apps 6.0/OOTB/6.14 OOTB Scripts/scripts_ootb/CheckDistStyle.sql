select "table",encoded,diststyle, sortkey_num
from svv_table_info
where database = '#DATABASE_NAME'
and schema='#DWH_SCHEMA_NAME'
order by "table"