select distinct 
concat('SELECT'' ',cols.table_name,''' as tName,row_id,source_id,count(1) from ',cols.table_schema,'.',cols.table_name,
(CASE cols.column_name WHEN 'CURRENT_FLAG' THEN ' CURRENT_FLAG=''Y''' ELSE '' END),
' where soft_deleted_flag=''N'' Group by 2,3 having count(1)>1;')
from information_schema.columns cols where cols.table_schema like '%_mdwdb%' and cols.table_name like 'f\_%';