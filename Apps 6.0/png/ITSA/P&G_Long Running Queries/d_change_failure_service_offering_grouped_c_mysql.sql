select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from(
   select * from (
select change_request.number,so.name, case when coalesce(so.name,'UNSPECIFIED')= 'Global Manufacturing Insights (GMIP)' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Security Architecture' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'ISES Planning - Initiative Planning' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'ILM Analytics' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Horizontal Operations' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Global Separation System Discovery' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Global Secure Hosting (GSH)' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Geovisualization' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Simplement' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Employee Care - Self Service' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Storage Optimization: UDW' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'EDI Preprocessor' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Document Storage & Sharing' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Direct Shipment Data (B2B)' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'DM Media' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Customer Budget Management' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'In-Store Performance (ISP)' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Influencer Services' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Insider Data Loss Prevention' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'SAP relationship management' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI17 - Legal and IP  Solutions' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Order Management - NA' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Order Management - LA' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Order Management - Asia' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Operational Reporting Cust Care' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Retail Execution Alerts (REA)' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Network Analytics' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'CoreMfg/SAP' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Retailer POS Data (B2B) - REA' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Market Measurements DevOps' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Market Estimates and Projection-MEP' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Market Estimates and Projection' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'MYPGS - Site Management NA' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'SAP Landscape Management' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'SAP Quality' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'SAP Run services' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'MediaTools' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Cash Application' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'R2R SAP Consolidation System' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Agency Compensation Engine (ACE)' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Architecture and Development for R&D' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Automation' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Abbreviated URL' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Veeva Quality Solution' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'BPA - Non-Project Work' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Application Management Quality Management' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'e2e Consumer Operations' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'eQuality Management System (eQMS)' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'BPM Platform' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Executive Payroll' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Video Sharing' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Security Services: Remote Access' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'DTCS Development' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'IT Risk Management' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'IT&OT at Plants' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Directories' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'FSS Delivery Europe Non Project Work' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Business Management Analytics' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Adverse Events Management' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Local Payroll WE' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'MYPGS - Facilities Phys Access IT Syst' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Media Data Warehouse' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Media Data Whse Devops' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Web access' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Network Transformation Initiatives' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI46-Prod.Research/Clinical Solutions' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI44 - Measurement Solutions' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Order Management - Europe' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI39 - Design Delivery Solutions' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Project Delivery' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Initiative Normative Forecaster' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'DC-Facility' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'itAccess' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Supply Chain Visualization' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Conflicting Capabilities' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Trade Panel Data - AOS' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Customization BI (CBI)' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Segmentation Analysis Tool' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Quality One' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Credit Management' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Authentication Single Sign-On' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Integration Platforms for SAP' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'TDC Losses Analytics' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Master Data Reporting' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'POS Retail Flow' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI24 - IT@Labs' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'BAU' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'WLAN' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'FAX/OCR' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Inventory Insights' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Central Complaints Management' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'SRM' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Retailer Data Acquisition DevOps' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Scheduling' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'CFS-Management Reporting' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Business Pulse Reporting' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Customer Analysts Other' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'WAN' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Application and Integration Discipline' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'BI Platforms' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI40 - FMOT Solutions' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Organization Data Management' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Americas - Non-Project Work' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Innovation Management Systems' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Audio Conferencing' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Succession Planning and Staffing' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'IRA/IPP Administration' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'IAM Operations' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'IT Asset Reporting' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'IT Asset Governance' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Social Security Tax' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Global People Mobility Services â€“ Transformation' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Security Services: Authentication' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'NPI Insights (Portal)' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'SPO Analytics' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Business Pulse' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Access Privileged Access Management' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Identity Management' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'InfoPaGe Case Fill Rate' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Customer Relationship Management' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'T&W Analytics' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'PGOne-Home' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'BI Big Data' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Direct Shipment Data(B2B) SH Direct Shipments SODE' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Pricing' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'DTCS Operations' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Post Delivery' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Content creation and modification' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'LAN' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= '3PLConnect' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Treasury' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'ML Rulex Planning' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Expat Services' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Market Measurement - Global' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'AOV-Advanced Order Visibility' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'HRSS Online-MyPG.com Life & Career' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'VMI' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Consumer 360 Insights' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI43 - Materials Development Solutions' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Wireless Area Network - P&G Managed' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'BI Platform Architecture' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Sourcing Services' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Store Execution Analytics' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Personal Computing and Storage' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Portals' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Consumer Complaints Reporting' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'ILM Optimization' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Legacy WOM' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'IT/OT' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'SC Synchronization Insights' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Transportation Freight Audit and Payment' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Meeting Services' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Shopper Insights on Demand' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Core' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'ISOP' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'ICCS - IDQ' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'US Retirement Plans' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI41 - Structural Design Solutions' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'FASTMART Platform' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Voice' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI15 - InnovationNet C+D' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Customer Business Analytics' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'GDF' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'GPMS Delivery Center' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Media Reporting Solution' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'IT-OT Operations Support' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Excel & Uploads' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'RUS826 - Apps@Labs' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'DM Gross Contributions' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Shipping EHS Module' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Network Security Solution' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Vulnerability Scanning Service (VSS)' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Access Access Management' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Trackwise' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Security Services: Perimeter Defense' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'EDI Order ASN Invoice' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI49 - Safety & Regulatory Solutions' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Application and Device Asset Management' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'UNSPECIFIED' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Content Collaboration' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Authorization Access Management' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'RUS793 - Digital LIMS' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'PGSearch' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Local Benefits' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Advanced Analytics Platform' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Supply Chain Management Reporting' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'SAP-BO Platform' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Employee Care - Help Desk' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Inventory @ Standard Insights' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Consumer Research Center' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Network Management Operations' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'MSA/SRA/Non-inventoriable Affiliates' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Security Information Event Management(SIEM)' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Performance Awards' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Managed Print' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'SAP Platform Health' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Customer Online' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'IT@Labs' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'MYPGS - RSDM NA' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'SAP IT Security Services' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'STEAM' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Storage Optimization: eCARM HA' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Transportation Forecasting' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'CSO Reporting' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Security Operations Center (SOC)' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'RPA Automation' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Supplier Services' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Threat Intelligence & Analysis' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Gross Contribution Activation & Rpt' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'SOARS Delivery' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'CSP BW' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Capture Financial Data' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'SAP Build Services' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Enhanced Vulnerability Protection (EVP)' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Executive Compensation' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Big Data' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Operational Reporting OM' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Integration Platforms for Cloud' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'CFTI' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Edge' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'DM Customer Data Services' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'NA TFM' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Salesbook' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'MD Governance' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Customer Business Planning' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'MySAP DRP' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'IT @ Labs' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Wireless Local Area Network (WLAN)' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Instant Messaging' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Event Management Solutions' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Performance Mgmt and Career Planning' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Operations Horizontal solutions' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Transportation Visibility' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Customer Portal (Legacy)' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI109 - Artwork Solutions' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Retailer Data Analytics & Reporting' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Intelligent Automation' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Webhosting' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'RTDC' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'L3 Engineering' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'HR Reporting and Analytics' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'TFM Market Solutions' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'BW Platform' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Brand Health on Demand' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Time & Attendance' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'SAP' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Local Payroll IMEA' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Forecast One' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Enterprise Directory' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'eMail' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Delivery Creation' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Spotfire Platform' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Store Online' then 'Store Online'
when coalesce(so.name,'UNSPECIFIED')= 'Identity & Access Management Solution' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Response Management' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Storage Solutions' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Offline Consumer Engagement' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI42 - STCS Analytics Solutions' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'infoPaGe Direct Shipment Reporting' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Active Directory' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'IDF' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Demand Driven Procurement' then 'Demand Driven Procurement'
when coalesce(so.name,'UNSPECIFIED')= 'Capital Management' then 'Capital Management'
when coalesce(so.name,'UNSPECIFIED')= 'Affiliates' then 'Affiliates'
when coalesce(so.name,'UNSPECIFIED')= 'Employee Data Management' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Advance Shipment Notification' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'Orchestration' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'IDP' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'R2R Non-Project Work' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI50-Tech Standards & Specs Solutions' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Voice Engineering' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Availability Management' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'PS IT Operations' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Enterprise Scheduling (Control M)' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Business to Government' then 'Business to Government'
when coalesce(so.name,'UNSPECIFIED')= 'RUSN01 - Maintain & Operate MES' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'AR AM / One Stop Global Work' then 'AR AM / One Stop Global Work'
when coalesce(so.name,'UNSPECIFIED')= 'Procure to Pay' then 'Procure to Pay'
when coalesce(so.name,'UNSPECIFIED')= 'Internal Management Reporting' then 'Internal Management Reporting'
when coalesce(so.name,'UNSPECIFIED')= 'Retailer Data Acquistion' then 'Retailer Data Acquistion'
when coalesce(so.name,'UNSPECIFIED')= 'In Store Execution' then 'In Store Execution'
when coalesce(so.name,'UNSPECIFIED')= 'Tax Solution' then 'Tax Solution'
when coalesce(so.name,'UNSPECIFIED')= 'RUPI45 - Product Design Solutions' then 'RUPI45 - Product Design Solutions'
when coalesce(so.name,'UNSPECIFIED')= 'Technology Hosting Solution' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Aggregation & Publication' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'OPTIMA' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'SAP-WM' then 'SAP-WM'
when coalesce(so.name,'UNSPECIFIED')= 'Banking' then 'Banking'
when coalesce(so.name,'UNSPECIFIED')= 'Shipment Execution' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Load Builder' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'DC - LAN' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'OMP+' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Cost Accounting' then 'Cost Accounting'
when coalesce(so.name,'UNSPECIFIED')= 'Database Services' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Inventory Target Setting' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'ADW Platform' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'APO DRP' then 'APO DRP'
when coalesce(so.name,'UNSPECIFIED')= 'Local Payroll Asia' then 'num_grouped_others'
when coalesce(so.name,'UNSPECIFIED')= 'Data Hubs' then 'Data Hubs'
when coalesce(so.name,'UNSPECIFIED')= 'MySAP SIP' then 'MySAP SIP'
when coalesce(so.name,'UNSPECIFIED')= 'Local Payroll NA' then 'Local Payroll NA'
when coalesce(so.name,'UNSPECIFIED')= 'Oracle BI (Essbase/OBIEE) Platform' then 'Oracle BI (Essbase/OBIEE) Platform'
when coalesce(so.name,'UNSPECIFIED')= 'Wide Area Network (WAN)' then 'Wide Area Network (WAN)'
when coalesce(so.name,'UNSPECIFIED')= 'Call Center & Voice mail' then 'Call Center & Voice mail'
when coalesce(so.name,'UNSPECIFIED')= 'Cloud Platforms' then 'Cloud Platforms'
when coalesce(so.name,'UNSPECIFIED')= 'Local Payroll EUROPE' then 'Local Payroll EUROPE'
when coalesce(so.name,'UNSPECIFIED')= 'General Ledger' then 'General Ledger'
when coalesce(so.name,'UNSPECIFIED')= 'Order Processing' then 'Order Processing'
when coalesce(so.name,'UNSPECIFIED')= 'SAP-IM' then 'SAP-IM'
when coalesce(so.name,'UNSPECIFIED')= 'Shipment Documentation' then 'Shipment Documentation'
when coalesce(so.name,'UNSPECIFIED')= 'ServiceNow Platform Management' then 'ServiceNow Platform Management'
when coalesce(so.name,'UNSPECIFIED')= 'Servers (Linux/UNIX)' then 'Servers (Linux/UNIX)'
when coalesce(so.name,'UNSPECIFIED')= 'SAP Basis' then 'SAP Basis'
when coalesce(so.name,'UNSPECIFIED')= 'Global Trade management' then 'Global Trade management'
when coalesce(so.name,'UNSPECIFIED')= 'Servers (Wintel)' then 'Servers (Wintel)'
when coalesce(so.name,'UNSPECIFIED')= 'Web DevOps' then 'num_group_no_failure'
when coalesce(so.name,'UNSPECIFIED')= 'X-Box Transportation Sync' then 'X-Box Transportation Sync'
when coalesce(so.name,'UNSPECIFIED')= 'Personal computer' then 'Personal computer'
when coalesce(so.name,'UNSPECIFIED')= 'Customer EDI Order' then 'Customer EDI Order'
when coalesce(so.name,'UNSPECIFIED')= 'ALICS' then 'ALICS'
when coalesce(so.name,'UNSPECIFIED')= 'RUIBNS - Enterprise Manufacturing Syst' then 'RUIBNS - Enterprise Manufacturing Syst'
when coalesce(so.name,'UNSPECIFIED')= 'Order Builder' then 'Order Builder'
when coalesce(so.name,'UNSPECIFIED')= 'Billing' then 'Billing'
when coalesce(so.name,'UNSPECIFIED')= 'Local Payroll LA' then 'Local Payroll LA'
when coalesce(so.name,'UNSPECIFIED')= 'Video Collaboration' then 'Video Collaboration'
when coalesce(so.name,'UNSPECIFIED')= 'Network Operations and Maintenance' then 'Network Operations and Maintenance'
when coalesce(so.name,'UNSPECIFIED')= 'WMS PrIME' then 'WMS PrIME'
when coalesce(so.name,'UNSPECIFIED')= 'Global Payroll' then 'Global Payroll'
when coalesce(so.name,'UNSPECIFIED')= 'Security Role Development' then 'Security Role Development'
when coalesce(so.name,'UNSPECIFIED')= 'Local Area Network (LAN)' then 'Local Area Network (LAN)'
when coalesce(so.name,'UNSPECIFIED')= 'Transportation Management' then 'Transportation Management'
when coalesce(so.name,'UNSPECIFIED')= 'Integration Platforms' then 'Integration Platforms'
when coalesce(so.name,'UNSPECIFIED')= 'Shipment Planning' then 'Shipment Planning'
when coalesce(so.name,'UNSPECIFIED')= 'PGNetwork' then 'PGNetwork'
when coalesce(so.name,'UNSPECIFIED')= 'RTCIS' then 'RTCIS'
end service_offering_grouped,f.service_offering_grouped_c 
FROM png_mdsdb.change_request_final change_request
 join png_mdsdb.service_offering_final as so on change_request.service_offering = so.sys_id and change_request.sourceinstance = so.sourceinstance and 
 change_request.cdctype<>'D' and so.cdctype<>'D'

join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id and change_request.cdctype<>'D' and change_request.state<>'4'
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key and d.source_id=f.source_id and f.current_flag='Y'
where coalesce(so.name,'UNSPECIFIED') in ('Global Manufacturing Insights (GMIP)',
'Security Architecture',
'ISES Planning - Initiative Planning',
'ILM Analytics',
'Horizontal Operations',
'Global Separation System Discovery',
'Global Secure Hosting (GSH)',
'Geovisualization',
'Simplement',
'Employee Care - Self Service',
'Storage Optimization: UDW',
'EDI Preprocessor',
'Document Storage & Sharing',
'Direct Shipment Data (B2B)',
'DM Media',
'Customer Budget Management',
'In-Store Performance (ISP)',
'Influencer Services',
'Insider Data Loss Prevention',
'SAP relationship management',
'RUPI17 - Legal and IP  Solutions',
'Order Management - NA',
'Order Management - LA',
'Order Management - Asia',
'Operational Reporting Cust Care',
'Retail Execution Alerts (REA)',
'Network Analytics',
'CoreMfg/SAP',
'Retailer POS Data (B2B) - REA',
'Market Measurements DevOps',
'Market Estimates and Projection-MEP',
'Market Estimates and Projection',
'MYPGS - Site Management NA',
'SAP Landscape Management',
'SAP Quality',
'SAP Run services',
'MediaTools',
'Cash Application',
'R2R SAP Consolidation System',
'Agency Compensation Engine (ACE)',
'Architecture and Development for R&D',
'Automation',
'Abbreviated URL',
'Veeva Quality Solution',
'BPA - Non-Project Work',
'Application Management Quality Management',
'e2e Consumer Operations',
'eQuality Management System (eQMS)',
'BPM Platform',
'Executive Payroll',
'Video Sharing',
'Security Services: Remote Access',
'DTCS Development',
'IT Risk Management',
'IT&OT at Plants',
'Directories',
'FSS Delivery Europe Non Project Work',
'Business Management Analytics',
'Adverse Events Management',
'Local Payroll WE',
'MYPGS - Facilities Phys Access IT Syst',
'Media Data Warehouse',
'Media Data Whse Devops',
'Web access',
'Network Transformation Initiatives',
'RUPI46-Prod.Research/Clinical Solutions',
'RUPI44 - Measurement Solutions',
'Order Management - Europe',
'RUPI39 - Design Delivery Solutions',
'Project Delivery',
'Initiative Normative Forecaster',
'DC-Facility',
'itAccess',
'Supply Chain Visualization',
'Conflicting Capabilities',
'Trade Panel Data - AOS',
'Customization BI (CBI)',
'Segmentation Analysis Tool',
'Quality One',
'Credit Management',
'Authentication Single Sign-On',
'Integration Platforms for SAP',
'SAP-HR-PAYROLL',
'TDC Losses Analytics',
'Master Data Reporting',
'POS Retail Flow',
'RUPI24 - IT@Labs',
'BAU',
'WLAN',
'FAX/OCR',
'Inventory Insights',
'Central Complaints Management',
'SRM',
'Retailer Data Acquisition DevOps',
'Scheduling',
'CFS-Management Reporting',
'Business Pulse Reporting',
'Customer Analysts Other',
'WAN',
'Application and Integration Discipline',
'BI Platforms',
'RUPI40 - FMOT Solutions',
'Organization Data Management',
'Americas - Non-Project Work',
'Innovation Management Systems',
'Audio Conferencing',
'Succession Planning and Staffing',
'IRA/IPP Administration',
'IAM Operations',
'IT Asset Reporting',
'IT Asset Governance',
'Social Security Tax',
'Global People Mobility Services â€“ Transformation',
'Security Services: Authentication',
'NPI Insights (Portal)',
'SPO Analytics',
'Business Pulse',
'Access Privileged Access Management',
'Identity Management',
'InfoPaGe Case Fill Rate',
'Customer Relationship Management',
'T&W Analytics',
'PGOne-Home',
'BI Big Data',
'Direct Shipment Data(B2B) SH Direct Shipments SODE',
'Pricing',
'DTCS Operations',
'Post Delivery',
'Content creation and modification',
'LAN',
'3PLConnect',
'Treasury',
'ML Rulex Planning',
'Expat Services',
'Market Measurement - Global',
'AOV-Advanced Order Visibility',
'HRSS Online-MyPG.com Life & Career',
'VMI',
'Consumer 360 Insights',
'RUPI43 - Materials Development Solutions',
'Wireless Area Network - P&G Managed',
'BI Platform Architecture',
'Sourcing Services',
'Store Execution Analytics',
'Personal Computing and Storage',
'Portals',
'Consumer Complaints Reporting',
'ILM Optimization',
'Legacy WOM',
'IT/OT',
'SC Synchronization Insights',
'Transportation Freight Audit and Payment',
'Meeting Services',
'Shopper Insights on Demand',
'Core',
'ISOP',
'ICCS - IDQ',
'US Retirement Plans',
'RUPI41 - Structural Design Solutions',
'FASTMART Platform',
'Voice',
'RUPI15 - InnovationNet C+D',
'Customer Business Analytics',
'GDF',
'GPMS Delivery Center',
'Media Reporting Solution',
'IT-OT Operations Support',
'Excel & Uploads',
'RUS826 - Apps@Labs',
'DM Gross Contributions',
'Shipping EHS Module',
'Network Security Solution',
'Vulnerability Scanning Service (VSS)',
'Access Access Management',
'Trackwise',
'Security Services: Perimeter Defense',
'EDI Order ASN Invoice',
'RUPI49 - Safety & Regulatory Solutions',
'Application and Device Asset Management',
'UNSPECIFIED',
'Content Collaboration',
'Authorization Access Management',
'RUS793 - Digital LIMS',
'PGSearch',
'Local Benefits',
'Advanced Analytics Platform',
'Supply Chain Management Reporting',
'SAP-BO Platform',
'Employee Care - Help Desk',
'Inventory @ Standard Insights',
'Consumer Research Center',
'Network Management Operations',
'MSA/SRA/Non-inventoriable Affiliates',
'Security Information Event Management(SIEM)',
'Performance Awards',
'Managed Print',
'SAP Platform Health',
'Customer Online',
'IT@Labs',
'MYPGS - RSDM NA',
'SAP IT Security Services',
'STEAM',
'Storage Optimization: eCARM HA',
'Transportation Forecasting',
'CSO Reporting',
'Security Operations Center (SOC)',
'RPA Automation',
'Supplier Services',
'Threat Intelligence & Analysis',
'Gross Contribution Activation & Rpt',
'SOARS Delivery',
'CSP BW',
'Capture Financial Data',
'SAP Build Services',
'Enhanced Vulnerability Protection (EVP)',
'Executive Compensation',
'Big Data',
'Operational Reporting OM',
'Integration Platforms for Cloud',
'CFTI',
'Edge',
'DM Customer Data Services',
'NA TFM',
'Salesbook',
'MD Governance',
'Customer Business Planning',
'MySAP DRP',
'IT @ Labs',
'Wireless Local Area Network (WLAN)',
'Instant Messaging',
'Event Management Solutions',
'Performance Mgmt and Career Planning',
'Operations Horizontal solutions',
'Transportation Visibility',
'Customer Portal (Legacy)',
'RUPI109 - Artwork Solutions',
'Retailer Data Analytics & Reporting',
'Intelligent Automation',
'Webhosting',
'RTDC',
'L3 Engineering',
'HR Reporting and Analytics',
'TFM Market Solutions',
'BW Platform',
'Brand Health on Demand',
'Time & Attendance',
'SAP',
'Local Payroll IMEA',
'Forecast One',
'Enterprise Directory',
'eMail',
'Delivery Creation',
'Spotfire Platform',
'Store Online',
'Identity & Access Management Solution',
'Response Management',
'Storage Solutions',
'Offline Consumer Engagement',
'RUPI42 - STCS Analytics Solutions',
'infoPaGe Direct Shipment Reporting',
'Active Directory',
'IDF',
'Demand Driven Procurement',
'Capital Management',
'Affiliates',
'Employee Data Management',
'Advance Shipment Notification',
'Orchestration',
'IDP',
'R2R Non-Project Work',
'RUPI50-Tech Standards & Specs Solutions',
'Voice Engineering',
'Availability Management',
'PS IT Operations',
'Enterprise Scheduling (Control M)',
'Business to Government',
'RUSN01 - Maintain & Operate MES',
'AR AM / One Stop Global Work',
'Procure to Pay',
'Internal Management Reporting',
'Retailer Data Acquistion',
'In Store Execution',
'Tax Solution',
'RUPI45 - Product Design Solutions',
'Technology Hosting Solution',
'Aggregation & Publication',
'OPTIMA',
'SAP-WM',
'Banking',
'Shipment Execution',
'Load Builder',
'DC - LAN',
'OMP+',
'Cost Accounting',
'Database Services',
'Inventory Target Setting',
'ADW Platform',
'APO DRP',
'Local Payroll Asia',
'Data Hubs',
'MySAP SIP',
'Local Payroll NA',
'Oracle BI (Essbase/OBIEE) Platform',
'Wide Area Network (WAN)',
'Call Center & Voice mail',
'Cloud Platforms',
'Local Payroll EUROPE',
'General Ledger',
'Order Processing',
'SAP-IM',
'Shipment Documentation',
'ServiceNow Platform Management',
'Servers (Linux/UNIX)',
'SAP Basis',
'Global Trade management',
'Servers (Wintel)',
'Web DevOps',
'X-Box Transportation Sync',
'Personal computer',
'Customer EDI Order',
'ALICS',
'RUIBNS - Enterprise Manufacturing Syst',
'Order Builder',
'Billing',
'Local Payroll LA',
'Video Collaboration',
'Network Operations and Maintenance',
'WMS PrIME',
'Global Payroll',
'Security Role Development',
'Local Area Network (LAN)',
'Transportation Management',
'Integration Platforms',
'Shipment Planning',
'PGNetwork',
'RTCIS'
))a
where service_offering_grouped<>service_offering_grouped_c 
)a
where service_offering_grouped<>service_offering_grouped_c;

