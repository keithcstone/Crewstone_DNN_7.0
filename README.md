# Crewstone_DNN_7.0
Crewstone Codesmith templates for DNN 7+
DNN Master template attempts to create a fully operational DotNetNuke module including Stored Procudures, DAL, InfoModules, and user interface. It was written and tested using CodeSmith 5.1. It supports whenever possible DNN capabilities such as iHydratable and iPortable.

To use:
* Copy the template to the appropriate CodeSmith directory
* Open the DNNMaster template and set the properties
* Execute the DNN Master
* Create a test DNN installation
* Manually import the Modulename\Manifests\*.dnn
* Manually execute the SQL 
* Place the module on a page

To migrate module to a "real" DNN site:
* Export the module using the module settings page
* Export module content as needed (note, the template cannot determine the export / import order so customizing the Import/Export section will be needed)
* Install the module on your production site
* Import data


The DNN Master template currently supports on VB and partially c#. Most C# functionality is untested, and assistance in that area would be appreciated. The DNNMaster tempalte is also designed to create WSP, not WAP projects. I am adding support for WAP but it's not there yet.

Generation Parameters:
DateCreated 		The name of the field that designates the date/time a row was created
CreatedBy 		The name of the field that designates the DNN userid that created a row
DateUpdated 		The name of the field that designates the date/time a row was updated
UpdatedBy 		The name of the field that designates the DNN userid that updated a row
MultiSourceTable	Collection of Tables that the module should be based on.
ObjectQualifier		Prefix for objects to be generated.
OtherDatabase 		If a value is entered, the generated modules will execute against the specified database. Requires an additional provider entry in the DotNetNuke/data section of the web.config file. If blank, the generated modules will execute against tables in the DNN default database.
IsSearchable		If true Interface for search will be added.
IsPortable		If true Interface for Import/Export will be added.
ListByPortalID 		If true items will be selected using PortalID otherwise ModuleID will be used.
Language		vb for Visual Basic, cs for CSharp
ProjectType		WSP for Web Site Project, WAP for Web Application Project
CreateManifest		If true, a DNN manifest will be created.
ModuleName		Module Name
RootNamespace		Used to generate the Namespace declaration.
CompanyName		Company Name
CreateViewControl	If true, a View web control will be created.
CreateListControl	If true, a List web control will be created.
CreateEditControl	If true, a View web control will be created.
CreateSettingsControl	If true, a Settings web control will be created.
CreateModuleMenuControl If true, a top level web control will be created.
PagingKeyword		Suffix to use for all generated PAGING/SORTING stored procedures (Note paging is currently partially implemented)
InsertKeyword		Suffix to use for all generated INSERT stored procedures.
UpdateKeyword		Suffix to use for all generated UPDATE stored procedures.
DeleteKeyword		Suffix to use for all generated DELETE stored procedures.
SelectKeyword		Suffix to use for all generated SELECT stored procedures.
ListKeyword		Suffix to use for all generated SELECT stored procedures.
IncludeDrop		If true drop statements will be generated to drop existing stored procedures.
IncludeInsert		If true insert statements will be generated.
IncludeUpdate		If true update statements will be generated.
IncludePaging		If true paging/sorting statements will be generated.
IncludeDelete		If true delete statements will be generated.
IncludeGet		If true get statements will be generated.
IncludeList		If true list statements will be generated.
IncludeForeignKeyProcs	If true get statements will be generated for every foreign key in the table.
IncludePurge		If true a purge SP will be created. This will delete all content for the portal. (Uninstall).



The template attempts to support lookup tables. This means appropriate changes in StoredProcedures, InfoModules, DAL, and user interface. For this to work some extended properties need to be set on the fields in the main table to let the templates know how to generate the lookup. Three fields, CS_Lookup, CS_LookupField, and CS_Lookupvalue are needed. CS_Lookup is the name of the lookup table. CS_LookupField is the field in the lookup table that matches the field in the master table. CS_LookupValue is the field that contacts the data from the lookup table you want to display. You can add these fields using the CodeSmith extended property editor, or you can use the SQL below.

IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CS_Lookup' , N'SCHEMA',N'dbo', N'TABLE',N'MainTableName', N'COLUMN',N'LookupField'))
EXEC sys.sp_addextendedproperty @name=N'CS_Lookup', @value=N'LookupTableName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MainTableName', @level2type=N'COLUMN',@level2name=N'LookupField'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CS_LookupField' , N'SCHEMA',N'dbo', N'TABLE',N'MainTableName', N'COLUMN',N'LookupField'))
EXEC sys.sp_addextendedproperty @name=N'CS_LookupField', @value=N'LookupField' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MainTableName', @level2type=N'COLUMN',@level2name=N'LookupField'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CS_LookupValue' , N'SCHEMA',N'dbo', N'TABLE',N'MainTableName', N'COLUMN',N'LookupField'))
EXEC sys.sp_addextendedproperty @name=N'CS_LookupValue', @value=N'LookupValueField' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MainTableName', @level2type=N'COLUMN',@level2name=N'LookupField'
GO

Acknowledgements:
This template set is a consolidation of templates and examples from many sources.
* Much of the C# support is from the excellent work by Declan Ward
* Templates from Lee Carter (Quizacal.com) provided an excellent structure
* Templates from Rodney Joyce (www.smart-thinker.com) provided excellent examples of iHydratable and got me going with C#
* Base templates from CodeSmith such as StoredProcedures.cst provided the base for the stored procedures template
* Examples by Michael Washington (www.adefwebserver.com) provided guidance for implementation
* Vicenc Masanas got the ball rolling with his templates at dnnjungle.vmasanas.net