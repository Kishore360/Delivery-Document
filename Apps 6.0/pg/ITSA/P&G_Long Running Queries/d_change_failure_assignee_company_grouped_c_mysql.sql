select case when cnt>0 then 'Failure' else 'Success' end as Result,
 case when cnt>0 then 'Data Mismatch' else 'Success' end as Message
 from(
select count(1) cnt from (
select change_request.number,sugc.name,succomp.name as n1,coalesce(succomp.name,'UNSPECIFIED'), 
case when coalesce(succomp.name,'UNSPECIFIED')= 'Infosys Technologies Limited' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Ernst & Young - Philippines' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Ernst & Young Philippines' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Freelancer' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'InfiniteData' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Infosys BPO Poland' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Infox' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Insight Global' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'L&T Infotech.' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'LTI (LARSEN & TOUBRO INFOTECH LIMITED)' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'EY ERNST & YOUNG LLP' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Larson & Toubro Infotech Limited' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G Distributing LLC.' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G MANUFACTURING GMBH' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G Marketing Romania SRL' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G Tuketim Mallari A.S.' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'TCS - Tata Consultancy Services' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'TCS Ltda' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Tech Mahindra Ltd.' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'VERTEX' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G DS Polska Sp. z o o' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'E&Y (1076071674)' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'xxx' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'CJC Crown Jewels Consultants Limited' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'DXC.Techonology' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Cocomore' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Hewlett-Packard Enterprise' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Hypermedia' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Infinite Data' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G Ind e Comer LTDA' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Information Insights' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Pontoon Solutions' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Infosys BPO' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Collabera' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Procter&Gamble Amiens SAS' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Source Inc.' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Mindtree Ltd' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Lingaro sp. z o.o' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'NUMERIFY' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'DirectPL' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Softlab' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Mindtree Ltd.' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Orba' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Infoblox' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'HP Enterprise' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Independent Contractor' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'FORTECH' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Larsen & Toubro' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Corbus IT Services' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'LARSEN & TOUBRO INFOTECH' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Sogeti USA' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'BIZDEVELOPMENT' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'InfiniteData sp. z o.o.' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Larsen and Toubro Infotech Limited' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'NV' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'HP Global Soft Pvt Ltd' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'TATA CONSULTANCY SERVICES' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'SOURCE CORP' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'GDS EY' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'FLP' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'HCL Technologies' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Proximity Indian Ocean' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Solace - CJCIT' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'L&T Infotech Limited' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'LnT Infotech' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Exigent Business Solutions' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'SD WORX GMBH' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'HCL Americas' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Corporativo P&G SdeRLdeC' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'HEWLETT PACKARD' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'EY GDS' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'ARTECH-CONSULTING' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'COMPUCOM' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'SGV/EY' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'PONTOON' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Larsen & Toubro Infotech Limited' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Direct Communication' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Randstad Services APO Sp. z o.o. Sp. k.' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'PGTI' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Infosys (CSO-R)' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Randstad Technologies' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'EY' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Ersnt & Young' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'WWT' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'EPAM Systems' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Cuatrix' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Krebs Development Solutions Ltd' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'InfomatiX' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Artech Consulting' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Dimension Data' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Ivy Mobility' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'BCC' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Hewlett-Packard' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'DXC.technology' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'XEROX' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Epam' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'ATOS India' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Tata Consultancy Services (TCS)' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Virtual Operations' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Ernst & Young S.A.' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Ernst & Young (1076071674)' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G Inc.' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G Operations Polska Sp' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'TEKsystems' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'INFOSYS LIMITED' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'TCS' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Infosys (Voyage)' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G SERVICE GMBH' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'World Wide Technology' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'SDWORX' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G Polska Sp zoo' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'IBA' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'L&T' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Ernst and Young' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'HPE' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Cisco' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'BT - Tech M' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'LTI' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'CBTS' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Teradata' then 'Teradata'
when coalesce(succomp.name,'UNSPECIFIED')= 'Infosys Voyage' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'L&T InfoTech Ltd' then 'L&T InfoTech Ltd'
when coalesce(succomp.name,'UNSPECIFIED')= 'Sogeti' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'IBM' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'SD WORX' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'FREMINT' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Larsen &Toubro Infotech Limited' then 'Larsen &Toubro Infotech Limited'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G Holding Srl' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'E2Open' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'ORACLE' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G Techn. Center Ltd' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'Virtustream' then 'num_grouped_others'
when coalesce(succomp.name,'UNSPECIFIED')= 'UNSPECIFIED' then 'UNSPECIFIED'
when coalesce(succomp.name,'UNSPECIFIED')= 'L&T Infotech' then 'L&T Infotech'
when coalesce(succomp.name,'UNSPECIFIED')= 'RANDSTAD' then 'RANDSTAD'
when coalesce(succomp.name,'UNSPECIFIED')= 'Atos' then 'Atos'
when coalesce(succomp.name,'UNSPECIFIED')= 'DXC Technology' then 'DXC Technology'
when coalesce(succomp.name,'UNSPECIFIED')= 'JDA SOFTWARE INC' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'ARTECH' then 'ARTECH'
when coalesce(succomp.name,'UNSPECIFIED')= 'ERNST & YOUNG' then 'ERNST & YOUNG'
when coalesce(succomp.name,'UNSPECIFIED')= 'Accenture' then 'Accenture'
when coalesce(succomp.name,'UNSPECIFIED')= 'JDA' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'Damovo' then 'Damovo'
when coalesce(succomp.name,'UNSPECIFIED')= 'BT' then 'BT'
when coalesce(succomp.name,'UNSPECIFIED')= 'HCL/Zion' then 'HCL/Zion'
when coalesce(succomp.name,'UNSPECIFIED')= 'HCL' then 'HCL'
when coalesce(succomp.name,'UNSPECIFIED')= 'HCL America' then 'HCL America'
when coalesce(succomp.name,'UNSPECIFIED')= 'Lingaro' then 'Lingaro'
when coalesce(succomp.name,'UNSPECIFIED')= 'HP' then 'HP'
when coalesce(succomp.name,'UNSPECIFIED')= 'E&Y' then 'E&Y'
when coalesce(succomp.name,'UNSPECIFIED')= 'Connections Consult' then 'num_group_no_failure'
when coalesce(succomp.name,'UNSPECIFIED')= 'EPI-USE' then 'EPI-USE'
when coalesce(succomp.name,'UNSPECIFIED')= 'Mindtree' then 'Mindtree'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G INTL OPERATIONS SA' then 'P&G INTL OPERATIONS SA'
when coalesce(succomp.name,'UNSPECIFIED')= 'The P&G US Bus. Serv. Co.' then 'The P&G US Bus. Serv. Co.'
when coalesce(succomp.name,'UNSPECIFIED')= 'Infosys' then 'Infosys'
when coalesce(succomp.name,'UNSPECIFIED')= 'P&G Intl Ops SA ROHQ' then 'P&G Intl Ops SA ROHQ'
when coalesce(succomp.name,'UNSPECIFIED')= 'DXC' then 'DXC'
end   assignee_company_grouped,f.assignee_company_grouped_c
from png_mdsdb.change_request_final change_request
left join png_mdsdb.sys_user_final sugc on change_request.assigned_to=sugc.sys_id and change_request.sourceinstance=sugc.sourceinstance and 
 change_request.cdctype<>'D' and sugc.cdctype<>'D'
left join png_mdsdb.core_company_final succomp on sugc.company=succomp.sys_id and sugc.sourceinstance=succomp.sourceinstance and succomp.cdctype<>'D'
join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id and change_request.cdctype<>'D' and change_request.state<>'4'
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key and d.source_id=f.source_id and f.current_flag='Y'
where coalesce(succomp.name,'UNSPECIFIED') in ('Infosys Technologies Limited',
'Ernst & Young - Philippines',
'Ernst & Young Philippines',
'Freelancer',
'InfiniteData',
'Infosys BPO Poland',
'Infox',
'Insight Global',
'L&T Infotech.',
'LTI (LARSEN & TOUBRO INFOTECH LIMITED)',
'EY ERNST & YOUNG LLP',
'Larson & Toubro Infotech Limited',
'P&G Distributing LLC.',
'P&G MANUFACTURING GMBH',
'P&G Marketing Romania SRL',
'P&G Tuketim Mallari A.S.',
'TCS - Tata Consultancy Services',
'TCS Ltda',
'Tech Mahindra Ltd.',
'VERTEX',
'P&G DS Polska Sp. z o o',
'E&Y (1076071674)',
'xxx',
'CJC Crown Jewels Consultants Limited',
'DXC.Techonology',
'Cocomore',
'Hewlett-Packard Enterprise',
'Hypermedia',
'Infinite Data',
'P&G Ind e Comer LTDA',
'Information Insights',
'Pontoon Solutions',
'Infosys BPO',
'Collabera',
'Procter&Gamble Amiens SAS',
'Source Inc.',
'Mindtree Ltd',
'Lingaro sp. z o.o',
'NUMERIFY',
'DirectPL',
'Softlab',
'Mindtree Ltd.',
'Orba',
'Infoblox',
'HP Enterprise',
'Independent Contractor',
'FORTECH',
'Larsen & Toubro',
'Corbus IT Services',
'LARSEN & TOUBRO INFOTECH',
'Sogeti USA',
'BIZDEVELOPMENT',
'InfiniteData sp. z o.o.',
'Larsen and Toubro Infotech Limited',
'NV',
'HP Global Soft Pvt Ltd',
'TATA CONSULTANCY SERVICES',
'SOURCE CORP',
'GDS EY',
'FLP',
'HCL Technologies',
'Proximity Indian Ocean',
'Solace - CJCIT',
'L&T Infotech Limited',
'LnT Infotech',
'Exigent Business Solutions',
'SD WORX GMBH',
'HCL Americas',
'Corporativo P&G SdeRLdeC',
'HEWLETT PACKARD',
'EY GDS',
'ARTECH-CONSULTING',
'COMPUCOM',
'SGV/EY',
'PONTOON',
'Larsen & Toubro Infotech Limited',
'Direct Communication',
'Randstad Services APO Sp. z o.o. Sp. k.',
'PGTI',
'Infosys (CSO-R)',
'Randstad Technologies',
'EY',
'Ersnt & Young',
'WWT',
'EPAM Systems',
'Cuatrix',
'Krebs Development Solutions Ltd',
'InfomatiX',
'Artech Consulting',
'Dimension Data',
'Ivy Mobility',
'BCC',
'Hewlett-Packard',
'DXC.technology',
'XEROX',
'Epam',
'ATOS India',
'Tata Consultancy Services (TCS)',
'Virtual Operations',
'Ernst & Young S.A.',
'Ernst & Young (1076071674)',
'P&G Inc.',
'P&G Operations Polska Sp',
'TEKsystems',
'INFOSYS LIMITED',
'TCS',
'Infosys (Voyage)',
'P&G SERVICE GMBH',
'World Wide Technology',
'SDWORX',
'P&G Polska Sp zoo',
'IBA',
'L&T',
'Ernst and Young',
'HPE',
'Cisco',
'BT - Tech M',
'LTI',
'CBTS',
'Teradata',
'Infosys Voyage',
'L&T InfoTech Ltd',
'Sogeti',
'IBM',
'SD WORX',
'FREMINT',
'Larsen &Toubro Infotech Limited',
'P&G Holding Srl',
'E2Open',
'ORACLE',
'P&G Techn. Center Ltd',
'Virtustream',
'UNSPECIFIED',
'L&T Infotech',
'RANDSTAD',
'Atos',
'DXC Technology',
'JDA SOFTWARE INC',
'ARTECH',
'ERNST & YOUNG',
'Accenture',
'JDA',
'Damovo',
'BT',
'HCL/Zion',
'HCL',
'HCL America',
'Lingaro',
'HP',
'E&Y',
'Connections Consult',
'EPI-USE',
'Mindtree',
'P&G INTL OPERATIONS SA',
'The P&G US Bus. Serv. Co.',
'Infosys',
'P&G Intl Ops SA ROHQ',
'DXC'
)
)A
where assignee_company_grouped<>assignee_company_grouped_c
)a