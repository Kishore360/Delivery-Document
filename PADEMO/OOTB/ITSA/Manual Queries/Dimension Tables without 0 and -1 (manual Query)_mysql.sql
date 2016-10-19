use <<tenant>>_mdwdb;
select concat('SELECT ''',cols.table_name,'''as tName,''',
cols.column_name,''' as Cname ,',
'count(*) as totalrecs,  COUNT(distinct ',
cols.column_name,
' )abc FROM ',cols.table_name,' where row_key in (0,-1) UNION ALL')
from information_schema.COLUMNS cols inner join information_schema.TABLES tbl
on 
cols.TABLE_SCHEMA=Database() and cols.column_name  = 'row_key' and cols.table_name not like '%calendar%' and cols.table_name not like '%data_patch%'
and 
cols.table_name = tbl.TABLE_NAME and cols.TABLE_SCHEMA=tbl.table_schema and 
 cols.table_name like 'd\_%';

/*select * from ( */
/*)a where abc=0 */