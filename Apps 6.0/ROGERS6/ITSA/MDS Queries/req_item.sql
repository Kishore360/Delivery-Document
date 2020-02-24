select distinct a.number Task,b.number Req_item ,c.name Request_Item_name
from rogersdev6_mdsdb.sc_task_final a 
left join rogersdev6_mdsdb.sc_req_item_final b 
on a.request_item=b.sys_id and a.sourceinstance=b.sourceinstance
left join rogersdev6_mdsdb.sc_cat_item_final c 
on b.cat_item=c.sys_id and b.sourceinstance=c.sourceinstance