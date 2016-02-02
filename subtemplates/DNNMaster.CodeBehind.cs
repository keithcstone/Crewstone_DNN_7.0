// 
//Name: DNNMaster.CodeBehind.cs
//Author: Keith Stone
//Description: Common support routines using as the code-behind in all the templates
//Revision: 2014.04.30
//Note: 
//
using System;
using System.IO;
using System.ComponentModel.Design;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Text;
using CodeSmith.Engine;
using System.Text.RegularExpressions;
using SchemaExplorer;
using System.ComponentModel;
using CodeSmith.BaseTemplates;
//using CodeSmith.CustomProperties;
using System.Diagnostics;

public class _Main : CodeSmith.BaseTemplates.SqlCodeTemplate
{
	
	private string _outputDirectory = String.Empty;
	private string _strippedTablePrefixes = "";

	public _Main() : base()
	{
	}
	  
    #region Output Directory
	[Editor(typeof(System.Windows.Forms.Design.FolderNameEditor), typeof(System.Drawing.Design.UITypeEditor))] 
	[Optional]
	[Category("2. Output")]
	[Description("The directory to output the results to.")]
	public string OutputDirectory 
	{
		get
		{
			// default to the directory that the template is located in
			if (_outputDirectory.Length == 0) return this.CodeTemplateInfo.DirectoryName + "output\\";
			
			return _outputDirectory;
		}
		set
		{
			if (!value.EndsWith("\\")) value += "\\";
			_outputDirectory = value;
		} 
	}
    #endregion

    #region ExecuteScriptsOnTarget
    private bool _executeScriptsOnTarget = false;
    [Category("2. Options")]
    [Description("If ExecuteScriptsOnTarget is true, the script will be executed on the database specified in TargetDatabase")]
    public bool ExecuteScriptsOnTarget
    {
        get { return _executeScriptsOnTarget; }
        set { _executeScriptsOnTarget = value; }
    }
    #endregion

    #region TargetDataBase
    private SchemaExplorer.DatabaseSchema _targetDatabase;
    [OptionalAttribute]
    [Category("2. Options")]
    [Description("If ExecuteScriptsOnTarget is true, the script will be executed on this database")]
    public SchemaExplorer.DatabaseSchema TargetDatabase
    {
        get { return _targetDatabase; }
        set { _targetDatabase = value; }
    }
    #endregion
    
    #region StrippedTablePrefixes
    [Category("DataSource")]
    [Description("The table prefixes to strip from the classes name, delimited by comma.")]
    public string StrippedTablePrefixes
    {
        get {return this._strippedTablePrefixes;}
        set	{this._strippedTablePrefixes = value;}
    }
    #endregion

    #region ObjectQualifier
    private string _objectQualifier = String.Empty; 
    [OptionalAttribute]
    [Category("DataSource")]
    [Description("Unique Qualifier for database objects.")]
    public string ObjectQualifier
    {
        get {return this._objectQualifier;}
        set	{this._objectQualifier = value;}
    } 
    #endregion
    
	public void OutputTemplate(CodeTemplate template)
	{
		this.CopyPropertiesTo(template);
		template.Render(this.Response);
	}

    protected override void OnPostRender(string result)
    {
        if (this.ExecuteScriptsOnTarget)
        {
            // execute the output on the same database as the source table.
            CodeSmith.BaseTemplates.ScriptResult scriptResult = CodeSmith.BaseTemplates.ScriptUtility.ExecuteScript(this.TargetDatabase.Database.ConnectionString, result, new System.Data.SqlClient.SqlInfoMessageEventHandler(cn_InfoMessage));
            Trace.Write(scriptResult.ToString());
        }

        base.OnPostRender(result);
    }

    private void cn_InfoMessage(object sender, System.Data.SqlClient.SqlInfoMessageEventArgs e)
    {
        Trace.WriteLine(e.Message);
    }

    #region File IO Operations
	public void DeleteFiles(string directory, string searchPattern)
	{
        if ( System.IO.Directory.Exists(directory) )
        {
            string[] files = Directory.GetFiles(directory, searchPattern);
            
            for (int i = 0; i < files.Length; i++)
            {
                try
                {
                    File.Delete(files[i]);
                }
                catch (Exception ex)
                {
                    Response.WriteLine("Error while attempting to delete file (" + files[i] + ").\r\n" + ex.Message);
                }
            }
        }
	}
    
    public void DeleteSubFolders(string directory)
    {
        if ( System.IO.Directory.Exists(directory) )
        {
            foreach ( string dir in System.IO.Directory.GetDirectories(directory) )    
            {
                DeleteFiles(dir, "*.*");
                DeleteSubFolders(dir);
                System.IO.Directory.Delete(dir);
            }
        }
    }
    #endregion
    
    public string GetASPVariableType(ColumnSchema column)
    {
    	if (column.Name.EndsWith("TypeCode")) return column.Name;
    	
    	switch (column.DataType)
    	{
    		case DbType.AnsiString: return "String";
    		case DbType.AnsiStringFixedLength: return "String";
    		case DbType.Binary: return "String";
    		case DbType.Boolean: return "Boolean";
    		case DbType.Byte: return "Byte";
    		case DbType.Currency: return "decimal";
    		case DbType.Date: return "DateTime";
    		case DbType.DateTime: return "DateTime";
    		case DbType.DateTime2: return "DateTime";
    		case DbType.Decimal: return "Decimal";
    		case DbType.Double: return "double";
    		case DbType.Guid: return "Guid";
    		case DbType.Int16: return "Int16";
    		case DbType.Int32: return "Int32";
    		case DbType.Int64: return "Int64";
    		case DbType.Object: return "object";
    		case DbType.SByte: return "sbyte";
    		case DbType.Single: return "Single";
    		case DbType.String: return "String";
    		case DbType.StringFixedLength: return "String";
    		case DbType.Time: return "TimeSpan";
    		case DbType.UInt16: return "ushort";
    		case DbType.UInt32: return "uint";
    		case DbType.UInt64: return "ulong";
    		case DbType.VarNumeric: return "decimal";
    		default:
    		{
    			return "__UNKNOWN__" + column.NativeType;
    		}
    	}
    }
 
    public string GetCamelCaseName(string value)
    {
    	return value.Substring(0, 1).ToLower() + value.Substring(1);
    }
    
    public string GetConvertStatement(ColumnSchema column)
    {
        switch (column.DataType)
        {
            case DbType.AnsiString: return "Convert.ToString";
            case DbType.AnsiStringFixedLength: return "Convert.ToString";
            case DbType.Binary: return "Convert.FromBase64String";
            case DbType.Boolean: return "Convert.ToBoolean";
            case DbType.Byte: return "Convert.ToByte";
            case DbType.Currency: return "Convert.ToDecimal";
            case DbType.Date: return "Convert.ToDateTime";
            case DbType.DateTime: return "Convert.ToDateTime";
            case DbType.Decimal: return "Convert.ToDecimal";
            case DbType.Double: return "Convert.ToDouble";
            case DbType.Guid: return "New Guid(Convert.ToString)";
            case DbType.Int16: return "Convert.ToInt16";
            case DbType.Int32: return "Convert.ToInt32";
            case DbType.Int64: return "Convert.ToInt64";		
            case DbType.SByte: return "Convert.ToSByte";
            case DbType.Single: return "Convert.ToSingle";
            case DbType.String: return "Convert.ToString";
            case DbType.StringFixedLength: return "Convert.ToString";
            case DbType.Time: return "Convert.ToDateTime";
            case DbType.UInt16: return "Convert.ToUInt16";
            case DbType.UInt32: return "Convert.ToUInt32";
            case DbType.UInt64: return "Convert.ToUInt64";
            case DbType.VarNumeric: return "Convert.ToDecimal";
            default:
            {
                return "__UNKNOWN__" + column.NativeType;
            }
        }
    }

    public string GetParseStatement(ColumnSchema column, string vbOrCsharp)
    {
        switch (column.DataType)
        {
            case DbType.AnsiString: return (vbOrCsharp == "vb" ? column.Name + " = Trim(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Trim(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.AnsiStringFixedLength: return (vbOrCsharp == "vb" ? column.Name + " = Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Trim(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Binary: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Boolean: return (vbOrCsharp == "vb" ? column.Name + " = Boolean.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Boolean.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Byte: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Currency: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Date: return (vbOrCsharp == "vb" ? column.Name + " = DateTime.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = DateTime.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.DateTime: return (vbOrCsharp == "vb" ? column.Name + " = DateTime.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = DateTime.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Decimal: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Double: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Guid: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Int16: return (vbOrCsharp == "vb" ? column.Name + " = Int16.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int16.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Int32: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Int64: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");		
            case DbType.SByte: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Single: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.String: return (vbOrCsharp == "vb" ? column.Name + " = Trim(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Trim(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.StringFixedLength: return (vbOrCsharp == "vb" ? column.Name + " = Request.QueryString(\"" + column.Name + "\")" : column.Name + " = Request.QueryString(\"" + column.Name + "\"));");
            case DbType.Time: return (vbOrCsharp == "vb" ? column.Name + " = DateTime.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = DateTime.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.UInt16: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.UInt32: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.UInt64: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            case DbType.VarNumeric: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"))" : column.Name + " = Int32.Parse(Request.QueryString(\"" + column.Name + "\"));");
            default:
            {
                return "__UNKNOWN__" + column.NativeType;
            }
        }
    }

    public string GetInputEditControls(ColumnSchema column)
    {
        const string vbstringcontrol = "<asp:TextBox ID=\"txt{0}\" runat=\"server\" Text='<%# Bind(\"{0}\") %>' EnableViewState=\"False\"></asp:TextBox>";
        const string vbbooleancontrol = "<asp:checkbox id=\"txt{0}\" runat=\"server\" Checked='<%# Bind(\"{0}\") %>' />";
        const string vbrequired = "<asp:requiredfieldvalidator id=\"req{0}\" CssClass=\"NormalRed\" runat=\"server\" resourcekey=\"val{0}Req.ErrorMessage\" ControlToValidate=\"txt{0}\" Display=\"Dynamic\" ErrorMessage=\"Required Field.\"></asp:requiredfieldvalidator>";
        const string vbdateval = "<asp:comparevalidator id=\"com{0}\" CssClass=\"NormalRed\" runat=\"server\" resourcekey=\"val{0}.ErrorMessage\" ControlToValidate=\"txt{0}\" Display=\"Dynamic\" ErrorMessage=\"Not Date\" Type=\"Date\" Operator=\"DataTypeCheck\"></asp:comparevalidator>";
        const string vbintegerval = "<asp:comparevalidator id=\"com{0}\" CssClass=\"NormalRed\" runat=\"server\" resourcekey=\"val{0}.ErrorMessage\" ControlToValidate=\"txt{0}\" Display=\"Dynamic\" ErrorMessage=\"Not Integer\" Type=\"Integer\" Operator=\"DataTypeCheck\" />";
        const string vbintegerrange = "<asp:RangeValidator ID=\"rng{0}\" CssClass=\"NormalRed\" runat=\"server\" resourcekey=\"val{0}Range.ErrorMessage\" ControlToValidate=\"txt{0}\" MinimumValue=\"0\" MaximumValue=\"9999\" Type=\"Integer\"   />"; 
        
        string controlstr;
        
        switch (column.DataType)
        {
            case DbType.AnsiString: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.AnsiStringFixedLength: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.Binary: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.Boolean: 
                controlstr = String.Format(vbbooleancontrol,column.Name);
                break; 
            case DbType.Byte: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.Currency: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.Date: 
                controlstr = String.Format(vbstringcontrol + vbdateval,column.Name);
                break; 
            case DbType.DateTime: 
                controlstr = String.Format(vbstringcontrol + vbdateval,column.Name);
                break; 
            case DbType.Decimal: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.Double: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.Guid: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.Int16: 
                controlstr =  String.Format(vbstringcontrol + vbintegerval,column.Name);
                break; 
            case DbType.Int32: 
                controlstr =  String.Format(vbstringcontrol + vbintegerval,column.Name);
                break; 
            case DbType.Int64: 
                controlstr =  String.Format(vbstringcontrol + vbintegerval,column.Name);
                break; 
            case DbType.SByte: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.Single: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.String: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.StringFixedLength: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.Time: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            case DbType.UInt16: 
                controlstr = String.Format(vbstringcontrol + vbintegerval,column.Name);
                break; 
            case DbType.UInt32: 
                controlstr = String.Format(vbstringcontrol + vbintegerval,column.Name);
                break; 
            case DbType.UInt64: 
                controlstr = String.Format(vbstringcontrol + vbintegerval,column.Name);
                break; 
            case DbType.VarNumeric: 
                controlstr = String.Format(vbstringcontrol,column.Name);
                break; 
            default:
            {
                controlstr = String.Format("<B>Default</B>" + vbstringcontrol,column.Name);
                break; 
            }
        }
        
        if (!column.AllowDBNull) {
            controlstr += String.Format(vbrequired,column.Name); }
            
        return controlstr;
    }
        
    public string GetInputEditControlsDesigner(ColumnSchema column, string vbOrCsharp)
    {
    	const string csstringcontrol = "protected global::System.Web.UI.WebControls.TextBox txt{0};";
        const string csbooleancontrol = "protected global::System.Web.UI.WebControls.CheckBox chk{0};";
    	const string vbstringcontrol = "Protected WithEvents txt{0} As System.Web.UI.WebControls.TextBox";
        const string vbbooleancontrol = "Protected WithEvents chk{0} As System.Web.UI.WebControls.CheckBox";
    	
    	string controlstr;
    	switch (column.DataType)
    	  {
    		case DbType.AnsiString: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.AnsiStringFixedLength: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Binary: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Boolean: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbbooleancontrol,column.Name) : String.Format(csbooleancontrol,column.Name);
    			break; 
    		case DbType.Byte: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Currency: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Date: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.DateTime: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Decimal: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Double: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Guid: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Int16: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Int32: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Int64: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.SByte: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Single: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.String: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.StringFixedLength: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.Time: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.UInt16: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.UInt32: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.UInt64: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		case DbType.VarNumeric: 
    			controlstr = vbOrCsharp == "vb" ? String.Format(vbstringcontrol,column.Name) : String.Format(csstringcontrol,column.Name);
    			break; 
    		default:
    		{
    			controlstr = vbOrCsharp == "vb" ? String.Format("<B>Default</B>" + vbstringcontrol,column.Name) : String.Format("<B>Default</B>" + csstringcontrol,column.Name);
    			break; 
    		}
    	}
    		
    	return controlstr;
    	
    }
    
    public string GetExportStatement(string _tablename, ColumnSchema column, string vbOrCsharp)
    {
         switch (column.DataType)
    	  {
    		case DbType.AnsiString: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.AnsiStringFixedLength: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Binary: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Boolean: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Byte: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Currency: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Date: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.DateTime: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Decimal: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Double: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Guid: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Int16: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Int32: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Int64: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");		
    		case DbType.SByte: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Single: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.String: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.StringFixedLength: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.Time: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.UInt16: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.UInt32: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.UInt64: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		case DbType.VarNumeric: return (vbOrCsharp == "vb" ? String.Format("\"<{0}>\" & DotNetNuke.Common.Utilities.XmlUtils.XMLEncode({1}.{0}.ToString) & \"</{0}>\"", column.Name, _tablename) : "");
    		default:
    		{
    			return "__UNKNOWN__" + column.NativeType;
    		}
    	 }
    }

    public string GetImportStatement(string _tableName, ColumnSchema column, string vbOrCsharp)
    {
         switch (column.DataType)
    	  {
    		case DbType.AnsiString: return (vbOrCsharp == "vb" ? column.Name + " = Trim(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.AnsiStringFixedLength: return (vbOrCsharp == "vb" ? column.Name + " = xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText" : "");
    		case DbType.Binary: return (vbOrCsharp == "vb" ? column.Name + " = System.Convert.FromBase64String(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.Boolean: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.Byte: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.Currency: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.Date: return (vbOrCsharp == "vb" ? column.Name + " = DateTime.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.DateTime: return (vbOrCsharp == "vb" ? column.Name + " = DateTime.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.Decimal: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.Double: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.Guid: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.Int16: return (vbOrCsharp == "vb" ? column.Name + " = Int16.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.Int32: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.Int64: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");		
    		case DbType.SByte: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.Single: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.String: return (vbOrCsharp == "vb" ? column.Name + " = Trim(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.StringFixedLength: return (vbOrCsharp == "vb" ? column.Name + " = xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText" : "");
    		case DbType.Time: return (vbOrCsharp == "vb" ? column.Name + " = DateTime.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.UInt16: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.UInt32: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.UInt64: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		case DbType.VarNumeric: return (vbOrCsharp == "vb" ? column.Name + " = Int32.Parse(xml" + _tableName + ".SelectSingleNode(\"" + column.Name + "\").InnerText)" : "");
    		default:
    		{
    			return "__UNKNOWN__" + column.NativeType;
    		}
    	 }
    }

    public string GetUIDefault(ColumnSchema column, string vbOrCsharp)
    {
         switch (column.DataType)
    	  {
    		case DbType.AnsiString: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = \"\".ToString()" : "");
    		case DbType.AnsiStringFixedLength: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = \"\".ToString()" : "");
    		case DbType.Binary: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Boolean: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Checked  = false" : "");
    		case DbType.Byte: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Currency: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Date: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = Date.Today.ToString()" : "");
    		case DbType.DateTime: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = Date.Today.ToString()" : "");
    		case DbType.Decimal: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Double: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Guid: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Int16: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Int32: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Int64: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");		
    		case DbType.SByte: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Single: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.String: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = \"\".ToString()" : "");
    		case DbType.StringFixedLength: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = \"\".ToString()" : "");
    		case DbType.Time: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = Date.Today.ToString()" : "");
    		case DbType.UInt16: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.UInt32: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.UInt64: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.VarNumeric: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		default:
    		{
    			return "__UNKNOWN__" + column.NativeType;
    		}
    	 }
    }
    
    public string GetIndexParameters(ColumnSchemaCollection cols, bool includeTypes, string vbOrCsharp)
    {
        string parameters = "";
        
            for( int i = 0; i < cols.Count; i++ )
            {
                if(i != 0)
                    parameters = parameters + ", ";
                
                if( includeTypes && vbOrCsharp == "vb" )
                    parameters = parameters + "ByVal ";
                    
                if( includeTypes )
                    parameters = parameters + (vbOrCsharp == "vb" ? GetCamelCaseName(cols[i].Name) + " As " + GetVBVariableType(cols[i]) : GetCSharpVariableType(cols[i]) + " " + GetCamelCaseName(cols[i].Name));
                else
                    parameters = parameters + (vbOrCsharp == "vb" ? GetCamelCaseName(cols[i].Name) : GetCamelCaseName(cols[i].Name));
           }
        
        return parameters;
    }
    
    public string GetIndexParametersWhere(ColumnSchemaCollection cols)
    {
        string parameters = "";
        
            for( int i = 0; i < cols.Count; i++ )
            {
                if(i != 0)
                    parameters = parameters + " AND ";
                                     
                parameters = parameters + String.Format("{0} = @{1}",cols[i].Name,i);
            }
        
        return parameters;
    }
    
    public string GetInfoToUI(string tableName, ColumnSchema column, string vbOrCsharp)
    {
         switch (column.DataType)
    	  {
    		case DbType.AnsiString: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = Trim(obj" + tableName + "." + column.Name + ")" : "");
    		case DbType.AnsiStringFixedLength: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = Trim(obj" + tableName + "." + column.Name + ")" : "");
    		case DbType.Binary: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Boolean: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Checked  = false" : "");
    		case DbType.Byte: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = Trim(obj" + tableName + "." + column.Name + ")" : "");
    		case DbType.Currency: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Date: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = Date.Today.ToString()" : "");
    		case DbType.DateTime: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = Date.Today.ToString()" : "");
    		case DbType.Decimal: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Double: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Guid: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Int16: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()": "");
    		case DbType.Int32: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Int64: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");		
    		case DbType.SByte: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.Single: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.String: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = Trim(obj" + tableName + "." + column.Name + ")" : "");
    		case DbType.StringFixedLength: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = Trim(obj" + tableName + "." + column.Name + ")" : "");
    		case DbType.Time: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = Date.Today.ToString()" : "");
    		case DbType.UInt16: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.UInt32: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.UInt64: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		case DbType.VarNumeric: return (vbOrCsharp == "vb" ? "txt" + column.Name + ".Text = 0.ToString()" : "");
    		default:
    		{
    			return "__UNKNOWN__" + column.NativeType;
    		}
    	 }
    }

    public string GetColumnToText(ColumnSchema column, string vbOrCsharp)
    {
         switch (column.DataType)
    	
    	  {
    		case DbType.AnsiString: return (vbOrCsharp == "vb" ? "" : "");
    		case DbType.AnsiStringFixedLength: return (vbOrCsharp == "vb" ? "" : "");
    		case DbType.Binary: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.Boolean: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.Byte: return (vbOrCsharp == "vb" ? ".ToString" : "");
    		case DbType.Currency: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.Date: return (vbOrCsharp == "vb" ? ".ToString(\"mm/dd/yyyy\")" : "");
    		case DbType.DateTime: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.Decimal: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.Double: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.Guid: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.Int16: return (vbOrCsharp == "vb" ? ".ToString()": "");
    		case DbType.Int32: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.Int64: return (vbOrCsharp == "vb" ? ".ToString()" : "");		
    		case DbType.SByte: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.Single: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.String: return (vbOrCsharp == "vb" ? "" : "");
    		case DbType.StringFixedLength: return (vbOrCsharp == "vb" ? "" : "");
    		case DbType.Time: return (vbOrCsharp == "vb" ? ".ToString(\"hh:mm:ss\")" : "");
    		case DbType.UInt16: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.UInt32: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.UInt64: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		case DbType.VarNumeric: return (vbOrCsharp == "vb" ? ".ToString()" : "");
    		default:
    		{
    			return "__UNKNOWN__" + column.NativeType;
    		}
    	 }
    }

    public string GetStoredProcName(TableSchema table, string keyword)
    {
    	string tableName = table.Name.TrimEnd('s');
    	
    	if( ObjectQualifier.Length > 0 )
    		tableName = tableName.Replace(ObjectQualifier, "");
        
        string[] strips = StrippedTablePrefixes.Split(new char[] {',', ';'});		
        foreach(string strip in strips)
        {
            if (tableName.StartsWith(strip))
            {
                tableName = tableName.Remove(0, strip.Length);
                continue;
            }
        }
        
        return GetTableOwner() + GetObjectQualifier() + keyword + tableName ;
    }
    
    public string GetStoredProcName(TableSchema table, string keyword, string columnName)
    {
    	return GetStoredProcName(table,keyword) + "By" + columnName;
    }
    
    public string GetUnqualifiedStoredProcName(TableSchema table, string keyword)
    {
    	string tableName = table.Name.TrimEnd('s');
    	
    	if( ObjectQualifier.Length > 0 )
    		tableName = tableName.Replace(ObjectQualifier, "");
        
        string[] strips = StrippedTablePrefixes.Split(new char[] {',', ';'});		
        foreach(string strip in strips)
        {
            if (tableName.StartsWith(strip))
            {
                tableName = tableName.Remove(0, strip.Length);
                continue;
            }
        }
        
        return keyword + tableName ;
    }
    
    public string GetUnqualifiedStoredProcName(TableSchema table, string keyword, string columnName)
    {
    	return GetUnqualifiedStoredProcName(table,keyword) + "By" + columnName;
    }
    
    public string GetMethodName(string methodName, string keyword)
    {
    	return	keyword + methodName;
    }

    public string GetMethodName(string moduleName, string keyword, bool makePlural)
    {
    	string methodName = "";
    	
    	if(makePlural)
    		methodName = GetMethodName(moduleName, keyword) + "s";
    	else
    		methodName = GetMethodName(moduleName, keyword);
    		
    	return methodName;
    }

    public string GetMethodName(string methodName, string keyword, string fieldName)
    {
        return keyword + methodName + "By" + fieldName;
    }

    public string GetTableOwner()
    {
        return "{databaseOwner}";
    }

    public string GetObjectQualifier()
    {
        return "{objectQualifier}" + ObjectQualifier;
    }

    public string GetTableName(TableSchema table)
    {
        string tableName = table.Name.TrimEnd('s');
        
        if( ObjectQualifier.Length > 0 )
            tableName = tableName.Replace(ObjectQualifier, "");
            
        string[] strips = StrippedTablePrefixes.Split(new char[] {',', ';'});		
        foreach(string strip in strips)
        {
            if (tableName.StartsWith(strip))
            {
                tableName = tableName.Remove(0, strip.Length);
                continue;
            }
        }
        
        if (tableName.EndsWith("s"))
            tableName.TrimEnd('s');
        
        return tableName;
    
    }

    public string GetTableName(TableSchema table, bool stripprefix)
    {
        string tableName = table.Name;
        
        if( ObjectQualifier.Length > 0 )
            tableName = tableName.Replace(ObjectQualifier, "");
            
        if (stripprefix) {
            string[] strips = StrippedTablePrefixes.Split(new char[] {',', ';'});		
            foreach(string strip in strips)
            {
                if (tableName.StartsWith(strip))
                {
                    tableName = tableName.Remove(0, strip.Length);
                    continue;
                }
            }
        }
        
        return tableName;
    
    }
    
    public string GetScopeParameters(TableSchema table, bool includeTypes, string vbOrCsharp)
    {
        string parameter = "";
        string scopeName = "portalId";
        
        if(table.Columns.Contains("moduleId")) {
            scopeName = "moduleId";
        } else if (table.Columns.Contains("portalId")) { 
            scopeName = "portalId";
        } 
         
        if( includeTypes && vbOrCsharp == "vb" )
            parameter = parameter + "ByVal ";
            
        if( includeTypes )
            parameter = parameter + (vbOrCsharp == "vb" ? scopeName + " As Integer" : "int " + scopeName);
        else
            parameter = parameter + (vbOrCsharp == "vb" ? scopeName : scopeName);
       
        return parameter;
    }
    
    public string GetModuleIdParameter(TableSchema table, bool includeType, bool prependComma, string vbOrCSharp)
    {	
        string moduleIdParam = "";
        
        if(table.Columns.Contains("moduleId"))
        {
            if( includeType )
                moduleIdParam = vbOrCSharp == "vb" ? "ByVal moduleId As Integer" : "integer moduleId";
            else
                moduleIdParam = "moduleId";
        
            if(prependComma)
                moduleIdParam = ", " + moduleIdParam;
        }
        else
            if(table.Columns.Contains("portalId"))
            {
                if( includeType )
                    moduleIdParam = vbOrCSharp == "vb" ? "ByVal portalId As Integer" : "integer portalId";
                else
                    moduleIdParam = "portalId";
            
                if(prependComma)
                    moduleIdParam = ", " + moduleIdParam;
            }
        
        return moduleIdParam;
    }

    public string GetFKMemberColumns(TableKeySchema fk)
    {
        string s="";
        for( int j = 0; j < fk.ForeignKeyMemberColumns.Count; j++)
        {
            s += GetSqlParameterStatement(fk.ForeignKeyMemberColumns[j]);
            if (j < fk.ForeignKeyMemberColumns.Count - 1) s += ", \n\t";
        }
        return s;
    }

    public string GetFKMemberColumnsWhere(TableKeySchema fk)
    {
        string s="";
        for( int j = 0; j < fk.ForeignKeyMemberColumns.Count; j++)
        {
            s += "["+fk.ForeignKeyMemberColumns[j].Name + "]=@" + fk.ForeignKeyMemberColumns[j].Name ;
            if (j < fk.ForeignKeyMemberColumns.Count - 1) s += " AND ";
        }
        return s;
    }
    
    public string GetFKMemberColumnsWhere(string tablename, TableKeySchema fk)
    {
        string s="";
        for( int j = 0; j < fk.ForeignKeyMemberColumns.Count; j++)
        {
            s += "[" + tablename + "].["+fk.ForeignKeyMemberColumns[j].Name + "]=@" + fk.ForeignKeyMemberColumns[j].Name ;
            if (j < fk.ForeignKeyMemberColumns.Count - 1) s += " AND ";
        }
        return s;
    }
    
    public string GetMemberVariableDeclarationStatement(ColumnSchema column, string vbOrCsharp)
    {
        return (vbOrCsharp == "vb" ? GetMemberVariableDeclarationStatement("Private", column, vbOrCsharp) : GetMemberVariableDeclarationStatement("protected", column, vbOrCsharp));
    }

    public string GetMemberVariableDeclarationStatement(string protectionLevel, ColumnSchema column, string vbOrCsharp)
    {
        string statement;
        
        if (vbOrCsharp == "vb")
        {
             statement = protectionLevel + " " + GetMemberVariableName(column) + " as " + GetVBVariableType(column);
        } else {
             statement = protectionLevel + " " + GetCSharpVariableType(column) + " " + GetMemberVariableName(column) + ";";
        }
        
        
        string defaultValue = GetMemberVariableDefaultValue(column);
        if (defaultValue != "")
        {
            statement += " = " + defaultValue;
        }
        
        if (column.ExtendedProperties["CS_LookupValue"] != null)
        {   
            if (column.ExtendedProperties["CS_LookupAlias"] != null)
            { 
                statement += "\r\n\t\t" + protectionLevel + " _" + column.ExtendedProperties["CS_LookupAlias"].Value + " as String = String.Empty";
            } else {
                statement += "\r\n\t\t" + protectionLevel + " _" + column.ExtendedProperties["CS_LookupValue"].Value + " as String = String.Empty";
            } 
        }
        return statement;
    }

    public string GetReaderAssignmentStatement(ColumnSchema column, int index)
    {
    	string statement = "if (!reader.IsDBNull(" + index.ToString() + ")) ";
    	statement += GetMemberVariableName(column) + " = ";
    	
    	if (column.Name.EndsWith("TypeCode")) statement += "(" + column.Name + ")";
    	
    	statement += "reader." + GetReaderMethod(column) + "(" + index.ToString() + ");";
    	
    	return statement;
    }


    public string GetMemberVariableName(ColumnSchema column)
    {
    	string propertyName = GetPropertyName(column);
    	string memberVariableName = "_" + GetCamelCaseName(propertyName);
    	
    	return memberVariableName;
    }

    public string GetPropertyName(ColumnSchema column)
    {
    	string propertyName = column.Name;
    	
    	//if (propertyName == column.Table.Name + "Name") return "Name";
    	//if (propertyName == column.Table.Name + "Description") return "Description";
    	
    	if (propertyName.EndsWith("TypeCode")) propertyName = propertyName.Substring(0, propertyName.Length - 4);
    	
    	return propertyName;
    }

    public string GetLookupTable(ColumnSchema column)
    {
    	if (column.ExtendedProperties["CS_Lookup"] != null) 
    		return (string)column.ExtendedProperties["CS_Lookup"].Value; 
    	else
    		return String.Empty;
    }

    public string GetLookupTable(ColumnSchema column, bool stripped)
    {
    	if (column.ExtendedProperties["CS_Lookup"] != null) 
    	{
    		string tableName = (string)column.ExtendedProperties["CS_Lookup"].Value;
    		
    		if( ObjectQualifier.Length > 0 )
    			tableName = tableName.Replace(ObjectQualifier, "");
    			
    		string[] strips = StrippedTablePrefixes.Split(new char[] {',', ';'});		
    		foreach(string strip in strips)
    		{
    			if (tableName.StartsWith(strip))
    			{
    				tableName = tableName.Remove(0, strip.Length);
    				continue;
    			}
    		}
    		
    		return tableName;
    	}
    	else
    		return String.Empty;
    }

    public string GetLookupValue(ColumnSchema column)
    {
    	if (column.ExtendedProperties["CS_LookupValue"] != null) 
    		return (string)column.ExtendedProperties["CS_LookupValue"].Value; 
    	else
    		return String.Empty;
    }

    public string GetLookupValue(ColumnSchema column, bool alias)
    {
    	if (column.ExtendedProperties["CS_LookupValue"] != null)
    	{ 
            if (column.ExtendedProperties["CS_LookupAlias"] != null)
            { 
    		return (string)column.ExtendedProperties["CS_LookupAlias"].Value; 
            } else {
    		return (string)column.ExtendedProperties["CS_LookupValue"].Value; 
            } 
    	}
    	else
    		return String.Empty;
    }

    public string GetLookupField(ColumnSchema column)
    {
    	if (column.ExtendedProperties["CS_LookupField"] != null) 
    		return (string)column.ExtendedProperties["CS_LookupField"].Value; 
    	else
    		return String.Empty;
    }

    public string GetMemberVariableDefaultValue(ColumnSchema column)
    {
    	switch (column.DataType)
    	{
    		case DbType.Guid:
    		{
    			return "Guid.Empty";
    		}
    		case DbType.AnsiString:
    		case DbType.AnsiStringFixedLength:
    		case DbType.String:
    		case DbType.StringFixedLength:
    		{
    			return "string.Empty";
    		}
    		default:
    		{
    			return "";
    		}
    	}
    }

    public string GetCSharpVariableType(ColumnSchema column)
    {
    	if (column.Name.EndsWith("TypeCode")) return column.Name;
    	
    	switch (column.DataType)
    	{
    		case DbType.AnsiString: return "string";
    		case DbType.AnsiStringFixedLength: return "string";
    		case DbType.Binary: return "byte[]";
    		case DbType.Boolean: return "bool";
    		case DbType.Byte: return "byte";
    		case DbType.Currency: return "decimal";
    		case DbType.Date: return "DateTime";
    		case DbType.DateTime: return "DateTime";
    		case DbType.Decimal: return "decimal";
    		case DbType.Double: return "double";
    		case DbType.Guid: return "Guid";
    		case DbType.Int16: return "short";
    		case DbType.Int32: return "int";
    		case DbType.Int64: return "long";
    		case DbType.Object: return "object";
    		case DbType.SByte: return "sbyte";
    		case DbType.Single: return "float";
    		case DbType.String: return "string";
    		case DbType.StringFixedLength: return "string";
    		case DbType.Time: return "TimeSpan";
    		case DbType.UInt16: return "ushort";
    		case DbType.UInt32: return "uint";
    		case DbType.UInt64: return "ulong";
    		case DbType.VarNumeric: return "decimal";
    		default:
    		{
    			return "__UNKNOWN__" + column.NativeType;
    		}
    	}
    }

    public string GetVBVariableType(ColumnSchema column)
    {
    	if (column.Name.EndsWith("TypeCode")) return column.Name;
    	
    	switch (column.DataType)
    	{
    		case DbType.AnsiString: return "string";
    		case DbType.AnsiStringFixedLength: return "string";
    		case DbType.Binary: return "byte()";
    		case DbType.Boolean: return "Boolean";
    		case DbType.Byte: return "byte";
    		case DbType.Currency: return "decimal";
    		case DbType.Date: return "DateTime";
    		case DbType.DateTime: return "DateTime";
    		case DbType.DateTime2: return "DateTime";
    		case DbType.Decimal: return "decimal";
    		case DbType.Double: return "double";
    		case DbType.Guid: return "Guid";
    		case DbType.Int16: return "short";
    		case DbType.Int32: return "Integer";
    		case DbType.Int64: return "long";
    		case DbType.Object: return "object";
    		case DbType.SByte: return "sbyte";
    		case DbType.Single: return "Single";
    		case DbType.String: return "String";
    		case DbType.StringFixedLength: return "String";
    		case DbType.Time: return "TimeSpan";
    		case DbType.UInt16: return "ushort";
    		case DbType.UInt32: return "uint";
    		case DbType.UInt64: return "ulong";
    		case DbType.VarNumeric: return "decimal";
    		default:
    		{
    			return "__UNKNOWN__" + column.NativeType;
    		}
    	}
    }

    
    public string GetReaderMethod(ColumnSchema column)
    {
    	switch (column.DataType)
    	{
    		case DbType.Byte:
    		{
    			return "GetByte";
    		}
    		case DbType.Int16:
    		{
    			return "GetInt16";
    		}
    		case DbType.Int32:
    		{
    			return "GetInt32";
    		}
    		case DbType.Int64:
    		{
    			return "GetInt64";
    		}
    		case DbType.AnsiStringFixedLength:
    		case DbType.AnsiString:
    		case DbType.String:
    		case DbType.StringFixedLength:
    		{
    			return "GetString";
    		}
    		case DbType.Boolean:
    		{
    			return "GetBoolean";
    		}
    		case DbType.Guid:
    		{
    			return "GetGuid";
    		}
    		case DbType.Currency:
    		case DbType.Decimal:
    		{
    			return "GetDecimal";
    		}
    		case DbType.DateTime:
    		case DbType.Date:
    		{
    			return "GetDateTime";
    		}
    		default:
    		{
    			return "__SQL__" + column.DataType;
    		}
    	}
    }

    public string GetSqlDbType(ColumnSchema column)
    {
    	switch (column.NativeType)
    	{
    		case "bigint": return "BigInt";
    		case "binary": return "Binary";
    		case "bit": return "Bit";
    		case "char": return "Char";
    		case "datetime": return "DateTime";
    		case "decimal": return "Decimal";
    		case "float": return "Float";
    		case "image": return "Image";
    		case "int": return "Int";
    		case "money": return "Money";
    		case "nchar": return "NChar";
    		case "ntext": return "NText";
    		case "numeric": return "Decimal";
    		case "nvarchar": return "NVarChar";
    		case "real": return "Real";
    		case "smalldatetime": return "SmallDateTime";
    		case "smallint": return "SmallInt";
    		case "smallmoney": return "SmallMoney";
    		case "sql_variant": return "Variant";
    		case "sysname": return "NChar";
    		case "text": return "Text";
    		case "timestamp": return "Timestamp";
    		case "tinyint": return "TinyInt";
    		case "uniqueidentifier": return "UniqueIdentifier";
    		case "varbinary": return "VarBinary";
    		case "varchar": return "VarChar";
    		default: return "__UNKNOWN__" + column.NativeType;
    	}
    }

    public string GetPrimaryKeyType(TableSchema table)
    {
    	if (table.PrimaryKey != null)
    	{
    		if (table.PrimaryKey.MemberColumns.Count == 1)
    		{
    			return GetCSharpVariableType(table.PrimaryKey.MemberColumns[0]);
    		}
    		else
    		{
    			throw new ApplicationException("This template will not work on primary keys with more than one member column.");
    		}
    	}
    	else
    	{
    		throw new ApplicationException("This template will only work on tables with a primary key.");
    	}
    }

    public string GetPrimaryKeyName(TableSchema table)
    {
    	if (table.PrimaryKey != null)
    	{
    		if (table.PrimaryKey.MemberColumns.Count == 1)
    		{
    			return table.PrimaryKey.MemberColumns[0].Name;
    		}
    		else
    		{
    			throw new ApplicationException("This template will not work on primary keys with more than one member column.");
    		}		
    	}
    	else
    	{
    		throw new ApplicationException("This template will only work on tables with a primary key.");
    	}
    }
    public string GetPrimaryKeyParameters(TableSchema table, bool includeTypes, string vbOrCsharp)
    {
        string parameters = "";
        
        if (table.PrimaryKey != null)
        {
            for( int i = 0; i < table.PrimaryKey.MemberColumns.Count; i++ )
            {
                if(i!= 0)
                    parameters = parameters + ", ";
                    
                if( includeTypes && vbOrCsharp == "vb" )
                    parameters = parameters + "ByVal ";					
                
                if( includeTypes )
                    parameters = parameters + (vbOrCsharp == "vb" ? GetCamelCaseName(table.PrimaryKey.MemberColumns[i].Name) + " As " + GetVBVariableType(table.PrimaryKey.MemberColumns[i]) : GetCSharpVariableType(table.PrimaryKey.MemberColumns[i]) + " " + GetCamelCaseName(table.PrimaryKey.MemberColumns[i].Name));				
                else
                    parameters = parameters + (vbOrCsharp == "vb" ? GetCamelCaseName(table.PrimaryKey.MemberColumns[i].Name) : GetCamelCaseName(table.PrimaryKey.MemberColumns[i].Name));
            }
        }
        else
        {
            throw new ApplicationException("This template will only work on tables with a primary key.");
        }
        return parameters;
    }
    
    public string GetPrimaryKeyParametersForObject(TableSchema table, string obj)
    {
        string parameters = "";
    	if (table.PrimaryKey != null)
    	{
    		for( int i = 0; i < table.PrimaryKey.MemberColumns.Count; i++ )
    		{
    			if(parameters.Length == 0)
    			{
    				parameters = parameters + obj + "." + table.PrimaryKey.MemberColumns[i].Name;
    			}
    			else
    			{
    				parameters = parameters + ", ";
    				parameters = parameters + obj + "." + table.PrimaryKey.MemberColumns[i].Name;
    			}
    		}
    	}
    	else
    	{
    		throw new ApplicationException("This template will only work on tables with a primary key.");
    	}
    	return parameters;
    }
    
    public string GetPrimaryKeyDecoration(TableSchema table, string vbOrCsharp)
    {
        const string decorationCS = "[PrimaryKey(\"{0}\", AutoIncrement = {1})]";
        const string decorationVB = "<PrimaryKey(\"{0}\", AutoIncrement := {1})> _";
        string keyColumns = "";
        string autoIncrement = "";
        string decoration = "";
       
        if (table.PrimaryKey != null)
        {
            for( int i = 0; i < table.PrimaryKey.MemberColumns.Count; i++ )
            {
                if(keyColumns.Length == 0)
                { 
                    keyColumns = keyColumns + (vbOrCsharp == "vb" ? table.PrimaryKey.MemberColumns[i].Name : table.PrimaryKey.MemberColumns[i].Name);
                } else { 
                    keyColumns = keyColumns + ", " + (vbOrCsharp == "vb" ? table.PrimaryKey.MemberColumns[i].Name : table.PrimaryKey.MemberColumns[i].Name);
                }
            }
            
            SchemaExplorer.ExtendedPropertyCollection exProps = table.PrimaryKey.MemberColumns[0].ExtendedProperties;
			if (exProps.Contains("CS_IsIdentity") && (bool)exProps["CS_IsIdentity"].Value)
			{
				autoIncrement = (vbOrCsharp == "vb" ? "True" : "true");
			} else {
                autoIncrement = (vbOrCsharp == "vb" ? "False" : "false");
            }
            
            decoration = (vbOrCsharp == "vb" ? String.Format(decorationVB,keyColumns,autoIncrement) : String.Format(decorationCS,keyColumns,autoIncrement));
        }
        else
        {
            decoration = (vbOrCsharp == "vb" ? " _" : "");
        }
        return decoration;
    }
    
    public string GetSelectByColumnNameParameter(ColumnSchema column, bool includeTypes, bool wrapDbNullColumnsWithNullFunction, string vbOrCSharp)
    {
    	string parameter = "";
    	bool allowDbNull = column.AllowDBNull;
    	
    	if( includeTypes && vbOrCSharp == "vb" )
    		parameter = parameter + "ByVal ";
    	
    	if(allowDbNull && wrapDbNullColumnsWithNullFunction)
    		parameter = parameter + string.Format("GetNull({0})", GetCamelCaseName(column.Name));
    	else
    		parameter = parameter + GetCamelCaseName(column.Name);
    	
    	if( includeTypes && vbOrCSharp == "vb" )
    		parameter = parameter + " As " + GetVBVariableType(column) + " ";
    	else if(includeTypes)
    		parameter = parameter + GetCSharpVariableType(column) + " ";
    		
    	return parameter;
    }

    public string GetNonPrimaryKeyParameters(TableSchema table, bool includeTypes, bool wrapDbNullColumnsWithNullFunction, bool insertlookup, string vbOrCSharp)
    {
        string parameters = "";
        string parameter = "";
        
    	if (table.PrimaryKey != null)
    	{
    		for( int i = 0; i < table.NonPrimaryKeyColumns.Count; i++ )
    		{
    			ColumnSchema column = table.NonPrimaryKeyColumns[i];
    			bool allowDbNull = column.AllowDBNull;
    			
    			if(parameters.Length == 0)
    			{
    				if( includeTypes && vbOrCSharp == "vb" )
    					parameters = parameters + "ByVal ";
    				
    				if(allowDbNull && wrapDbNullColumnsWithNullFunction)
    					parameter = string.Format("GetNull({0})", GetCamelCaseName(table.NonPrimaryKeyColumns[i].Name));
    				else
    					parameter = GetCamelCaseName(table.NonPrimaryKeyColumns[i].Name);				
                    
                    if( includeTypes )
                        parameters = parameters + (vbOrCSharp == "vb" ? parameter + " As " + GetVBVariableType(table.NonPrimaryKeyColumns[i]) : GetCSharpVariableType(table.NonPrimaryKeyColumns[i]) + " " + parameter);				
                    else
                        parameters = parameters + (vbOrCSharp == "vb" ? parameter : parameter);
    			}
    			else
    			{
    				if(GetLookupValue(table.NonPrimaryKeyColumns[i]).Length > 0 && insertlookup)
    				{
                        parameters = parameters + ", ";
                        
                        if( includeTypes && vbOrCSharp == "vb" )
                            parameters = parameters + "ByVal ";
                            
                        if(allowDbNull && wrapDbNullColumnsWithNullFunction)
         					parameter = string.Format("GetNull({0})", GetCamelCaseName(table.NonPrimaryKeyColumns[i].Name));
        				else
        					parameter = GetCamelCaseName(table.NonPrimaryKeyColumns[i].Name);
                        
                        if( includeTypes && vbOrCSharp == "vb" )
                            parameters = parameters + parameter + " As String";
                        
                        if( includeTypes )
                            parameters = parameters + (vbOrCSharp == "vb" ? parameter + " As String" : "string " + parameter);				
                        else
                            parameters = parameters + (vbOrCSharp == "vb" ? parameter : parameter);
    				}
                    
    				if(table.NonPrimaryKeyColumns[i].NativeType != "timestamp") 
    				{
        				parameters = parameters + ", ";
        				
        				if( includeTypes && vbOrCSharp == "vb" )
        					parameters = parameters + "ByVal ";
        					
        				if(allowDbNull && wrapDbNullColumnsWithNullFunction)
        					parameter = string.Format("GetNull({0})", GetCamelCaseName(table.NonPrimaryKeyColumns[i].Name));
        				else
        					parameter = GetCamelCaseName(table.NonPrimaryKeyColumns[i].Name);
        				
                        if( includeTypes )
                            parameters = parameters + (vbOrCSharp == "vb" ? parameter + " As " + GetVBVariableType(table.NonPrimaryKeyColumns[i]) : GetCSharpVariableType(table.NonPrimaryKeyColumns[i]) + " " + parameter);				
                        else
                            parameters = parameters + (vbOrCSharp == "vb" ? parameter : parameter);
    				}
    			}
    		}
    	}
    	else
    	{
    		throw new ApplicationException("This template will only work on tables with a primary key.");
    	}
    	return parameters;
    }

    public string GetNonPrimaryKeyParametersForObject(TableSchema table, string obj)
    {
        string parameters = "";

    	for( int i = 0; i < table.NonPrimaryKeyColumns.Count; i++ )
    	{
    		if(parameters.Length == 0)
    		{
    			parameters = parameters + obj + "." + table.NonPrimaryKeyColumns[i].Name;
    		}
    		else
    		{
    			if(table.NonPrimaryKeyColumns[i].NativeType != "timestamp") {
    			parameters = parameters + ", ";
    			parameters = parameters + obj + "." + table.NonPrimaryKeyColumns[i].Name;
    			}
    		}
    	}
    	
    	return parameters;
    }

    public string GetClassName(TableSchema table)
    {
    	string className = GetTableName(table) + "Controller";
    	
    	if( ObjectQualifier.Length > 0 )
    		className = className.Replace(ObjectQualifier, "");
    	
    	return className;
    }

    public string GetClassNameInfo(TableSchema table)
    {
    	string infoName = GetTableName(table) + "Info";
    	
    	if( ObjectQualifier.Length > 0 )
    		infoName = infoName.Replace(ObjectQualifier, "");
    	
    	return infoName;
    }

    public string GetCollectionName(TableSchema table)
    {
    	string infoName = "col" + GetTableName(table) + "s";
    	
    	if( ObjectQualifier.Length > 0 )
    		infoName = infoName.Replace(ObjectQualifier, "");
    	
    	return infoName;
    }

    public string GetObjectName(TableSchema table)
    {
    	string infoName = "obj" + GetTableName(table) + "s";
    	
    	if( ObjectQualifier.Length > 0 )
    		infoName = infoName.Replace(ObjectQualifier, "");
    	
    	return infoName;
    }
 
    public string GetModelDeclaration(ColumnSchema column,string vbOrCSharp)
    {
        const string csDeclare = "\r\n\t\t///<summary>\r\n\t\t/// Property for {3} ({0})\r\n\t\t///</summary>\r\n\t\t{1} {2} {{ get; set; }}"; 
        const string csDeclareNullable = "\r\n\t\t///<summary>\r\n\t\t/// Property for {3} ({0})\r\n\t\t///</summary>\r\n\t\tNullable<{1}> {2} {{ get; set; }}"; 
        const string vbDeclare = "\r\n\t\t'''<summary>\r\n\t\t''' Property for {3} ({0})\r\n\t\t'''</summary>\r\n\t\tProperty {2}() As {1}";
        const string vbDeclareNullable = "\r\n\t\t'''<summary>\r\n\t\t''' Property for {3} ({0})\r\n\t\t'''</summary>\r\n\t\tProperty {2}() As Nullable(Of {1})";
        string returnDeclare;
        
        if(vbOrCSharp == "vb" )
        {
            if (!column.AllowDBNull)
                returnDeclare = String.Format(vbDeclare,column.Description,GetVBVariableType(column),GetCamelCaseName(column.Name),column.Name);
            else
                returnDeclare = String.Format(vbDeclareNullable,column.Description,GetVBVariableType(column),GetCamelCaseName(column.Name),column.Name);
        } else {
            if (!column.AllowDBNull || GetCSharpVariableType(column) == "string" || GetCSharpVariableType(column) == "byte[]")
                returnDeclare = String.Format(csDeclare,column.Description,GetCSharpVariableType(column),GetCamelCaseName(column.Name),column.Name);
            else
                returnDeclare = String.Format(csDeclareNullable,column.Description,GetCSharpVariableType(column),GetCamelCaseName(column.Name),column.Name);
        };
        
        return returnDeclare;
    }
    
    public string GetTypedModelDeclaration(ColumnSchema column,string vbOrCSharp)
    {
        const string csDeclare = "\r\n\t\t///<summary>\r\n\t\t/// Property for {3} ({0})\r\n\t\t///</summary>\r\n\t\t[ColumnName(\"{3}\")]\r\n\t\t{1} {2} {{ get; set; }}"; 
        const string csDeclareNullable = "\r\n\t\t///<summary>\r\n\t\t/// Property for {3} ({0})\r\n\t\t///</summary>\r\n\t\t[ColumnName(\"{3}\")]\r\n\t\tNullable<{1}> {2} {{ get; set; }}"; 
        const string vbDeclare = "\t'<summary>\r\n\t\t\t' Property for {3} ({0})\r\n\t\t\t'</summary>\r\n\t\t\t<ColumnName(\"{3}\")> _\r\n\t\t\tPrivate Property {2}() As {1}\r\n\t\t\t\tGet\r\n\t\t\t\t\tReturn m_{2}\r\n\t\t\t\tEnd Get\r\n\t\t\t\tSet\r\n\t\t\t\t\tm_{2} = Value\r\n\t\t\t\tEnd Set\r\n\t\t\tEnd Property\r\n\t\t\tPrivate m_{2} As {1}\r\n";
        const string vbDeclareNullable = "\t'<summary>\r\n\t\t\t' Property for {3} ({0})\r\n\t\t\t'</summary>\r\n\t\t\t<ColumnName(\"{3}\")> _\r\n\t\t\tPrivate Property {2}() As Nullable(Of {1})\r\n\t\t\t\tGet\r\n\t\t\t\t\tReturn m_{2}\r\n\t\t\t\tEnd Get\r\n\t\t\t\tSet\r\n\t\t\t\t\tm_{2} = Value\r\n\t\t\t\tEnd Set\r\n\t\t\tEnd Property\r\n\t\t\tPrivate m_{2} As Nullable(Of {1})\r\n";
        string returnDeclare;
        
        if(vbOrCSharp == "vb" )
        {
            if (!column.AllowDBNull)
                returnDeclare = String.Format(vbDeclare,column.Description,GetVBVariableType(column),GetCamelCaseName(column.Name),column.Name);
            else
                returnDeclare = String.Format(vbDeclareNullable,column.Description,GetVBVariableType(column),GetCamelCaseName(column.Name),column.Name);
        } else {
            if (!column.AllowDBNull || GetCSharpVariableType(column) == "string" || GetCSharpVariableType(column) == "byte[]")
                returnDeclare = String.Format(csDeclare,column.Description,GetCSharpVariableType(column),GetCamelCaseName(column.Name),column.Name);
            else
                returnDeclare = String.Format(csDeclareNullable,column.Description,GetCSharpVariableType(column),GetCamelCaseName(column.Name),column.Name);
        };
        
        return returnDeclare;
    }
        
    public string GetTypedModelDeclaration(ColumnSchema column, string visibility, string vbOrCSharp)
    {
        const string csDeclare = "\r\n\t\t///<summary>\r\n\t\t/// Property for {3} ({0})\r\n\t\t///</summary>\r\n\t\t[ColumnName(\"{3}\")]\r\n\t\t{4} {1} {2} {{ get; set; }}"; 
        const string csDeclareNullable = "\r\n\t\t///<summary>\r\n\t\t/// Property for {3} ({0})\r\n\t\t///</summary>\r\n\t\t[ColumnName(\"{3}\")]\r\n\t\t{4} Nullable<{1}> {2} {{ get; set; }}"; 
        const string vbDeclare = "\t'<summary>\r\n\t\t\t' Property for {3} ({0})\r\n\t\t\t'</summary>\r\n\t\t\t<ColumnName(\"{3}\")> _\r\n\t\t\tPrivate Property {2}() As {1}\r\n\t\t\t\tGet\r\n\t\t\t\t\tReturn m_{2}\r\n\t\t\t\tEnd Get\r\n\t\t\t\tSet\r\n\t\t\t\t\tm_{2} = Value\r\n\t\t\t\tEnd Set\r\n\t\t\tEnd Property\r\n\t\t\tPrivate m_{2} As {1}\r\n";
        const string vbDeclareNullable = "\t'<summary>\r\n\t\t\t' Property for {3} ({0})\r\n\t\t\t'</summary>\r\n\t\t\t<ColumnName(\"{3}\")> _\r\n\t\t\tPrivate Property {2}() As Nullable(Of {1})\r\n\t\t\t\tGet\r\n\t\t\t\t\tReturn m_{2}\r\n\t\t\t\tEnd Get\r\n\t\t\t\tSet\r\n\t\t\t\t\tm_{2} = Value\r\n\t\t\t\tEnd Set\r\n\t\t\tEnd Property\r\n\t\t\tPrivate m_{2} As Nullable(Of {1})\r\n";
        string returnDeclare;
        
        if(vbOrCSharp == "vb" )
        {
            if (!column.AllowDBNull)
                returnDeclare = String.Format(vbDeclare,column.Description,GetVBVariableType(column),GetCamelCaseName(column.Name),column.Name);
            else
                returnDeclare = String.Format(vbDeclareNullable,column.Description,GetVBVariableType(column),GetCamelCaseName(column.Name),column.Name);
        } else {
            if (!column.AllowDBNull || GetCSharpVariableType(column) == "string" || GetCSharpVariableType(column) == "byte[]")
                returnDeclare = String.Format(csDeclare,column.Description,GetCSharpVariableType(column),GetCamelCaseName(column.Name),column.Name,visibility);
            else
                returnDeclare = String.Format(csDeclareNullable,column.Description,GetCSharpVariableType(column),GetCamelCaseName(column.Name),column.Name,visibility);
        };
        
        return returnDeclare;
    }
        
    public void GetSelectColumns(ColumnSchemaCollection cols)
    {
    	for (int i = 0; i < cols.Count; i++) 
    	{
    		Response.Write("\t" + cols[i].Name);
    		if (i < cols.Count - 1) 
    		{ 
    			Response.Write(",\n ");
    		} 
    	}
    	Response.Write("\n");
    }
		
    public void GetColumnDef(ColumnSchemaCollection cols)
{
	for (int i = 0; i < cols.Count; i++) 
	{ 
		Response.Write("\t" + GetSqlParameterStatement(cols[i]).Replace("@","")) ;
		if (i < cols.Count - 1) 
		{ 
			Response.Write(",");
		}
		Response.Write("\n");
	} 
}

    private bool IsColumnSortable(ColumnSchema column)
    {
    	bool isSortable = true;

    	if (column.NativeType == "text" || column.NativeType == "ntext" || column.NativeType == "image")
    		isSortable = false;

    	return isSortable;
    }

    public void GetOrderByClause(ColumnSchemaCollection cols)
    {
        bool haveSort = false;
    
        for (int i = 0; i < cols.Count; i++)
        {
            if (IsColumnSortable(cols[i]))
            {
                if (haveSort)
                    Response.Write(",\n ");
                else
                    haveSort = true;
                Response.Write("\tCASE WHEN @SortCol = '" + cols[i].Name + "_D'  THEN " + cols[i].Name + " else null END desc,\n");
                Response.Write("\tCASE WHEN @SortCol = '" + cols[i].Name + "'  THEN " + cols[i].Name + " else null END asc");
            }
        }
        Response.Write("\n");
    }

    public void GetSelectColumnsAlias(ColumnSchemaCollection cols, string alias)
    {
        for (int i = 0; i < cols.Count; i++) 
        {
            Response.Write("\t" + alias + "." + cols[i].Name);
            if (i < cols.Count - 1) 
            { 
                Response.Write(",\n ");
            } 
        }
        Response.Write("\n");
    }
    
    public void GetJoinClause(ColumnSchemaCollection cols)
    {
        for (int i = 0; i < cols.Count; i++)
        {
            Response.Write("\tt1." + cols[i].Name + " = t2." + cols[i].Name);
            if (i < cols.Count - 1) 
            { 
                Response.Write(",\n ");
            } 
        }
        Response.Write("\n");
    }
    
    public int GetFieldCountInfoToUI(TableSchema table)
    {
        int returnVal = 0;
        
        for(int i = 0; i < table.Columns.Count; i++) {
            if (table.Columns[i].Name.ToLower() != "portalid" && table.Columns[i].Name.ToLower() != "moduleid") { 
                    returnVal++;
            }
        }
        return returnVal;	
    }
    
    public int GetKeyFieldOffset(TableSchema table)
    {
        int returnVal = 0;
        string pk ="";
        if (table.PrimaryKey != null)
        {
            if (table.PrimaryKey.MemberColumns.Count == 1)
            {
                pk = table.PrimaryKey.MemberColumns[0].Name;
            }
        }
            
        for(int i = 0; i < table.Columns.Count; i++) {
            if (table.Columns[i].Name.ToLower() == pk) { 
                    returnVal = i;
            }
        }
        return returnVal;	
    }

    public string GetUItoInfo(ColumnSchema column)
    {
        string returnVal = "";
        switch (column.Name.ToLower())
        {
            case "portalid": returnVal = "oInfo.portalID = PortalId";break;
            case "moduleid": returnVal = "oInfo.moduleID = ModuleId";break;
            default:
            {
                returnVal = "oInfo." + column.Name + " = " + GetParseToSave(column, GetUIControlName(column));
                break;
            }
        }
        
        return returnVal;
    }
    
    public string GetUIControlName(ColumnSchema column)
    {
    string prefix = GetUIControlPrefix(column);  /* Default control prefix */
    
        if (column.IsPrimaryKeyMember){
            prefix = "lbl";		/* If IsPrimaryKeyMember the control prefix is changed to lbl*/
            }
        
        switch (column.DataType)
        {
            case DbType.AnsiString: return prefix + column.Name + ".Text";
            case DbType.AnsiStringFixedLength: return prefix + column.Name + ".Text";
            case DbType.Binary: return prefix + column.Name + ".Text";
            case DbType.Boolean: return "chk" + column.Name + ".Checked"; /* Exception to lbl/txt rule */
            case DbType.Byte: return prefix + column.Name + ".Text";
            case DbType.Currency: return prefix + column.Name + ".Text";
            case DbType.Date: return prefix + column.Name + ".Text";
            case DbType.DateTime: return prefix + column.Name + ".Text";
            case DbType.Decimal: return prefix + column.Name + ".Text";
            case DbType.Double: return prefix + column.Name + ".Text";
            case DbType.Guid: return prefix + column.Name + ".Text";
            case DbType.Int16: return prefix + column.Name + ".Text";
            case DbType.Int32: return prefix + column.Name + ".Text";
            case DbType.Int64: return prefix + column.Name + ".Text";		
            case DbType.SByte: return prefix + column.Name + ".Text";
            case DbType.Single: return prefix + column.Name + ".Text";
            case DbType.String: return prefix + column.Name + ".Text";
            case DbType.StringFixedLength: return prefix + column.Name + ".Text";
            case DbType.Time: return prefix + column.Name + ".Text";
            case DbType.UInt16: return prefix + column.Name + ".Text";
            case DbType.UInt32: return prefix + column.Name + ".Text";
            case DbType.UInt64: return prefix + column.Name + ".Text";
            case DbType.VarNumeric: return prefix + column.Name + ".Text";
            default:
            {
                return "// __UNKNOWN__" + column.NativeType;
            }
        }
    }
    
    /// ----------------------------------------------------------------------------- 
	/// <summary>
    /// GetParseToSave function
    /// </summary>
	/// <parameters>
	/// ColumnSchema, UI control name, vbOrCsharp (VB = "vb", C# = "")
	/// </parameters>
    /// <remarks>
    ///	Returns a control parsed appropriatly based on data type of field in table
	/// C#
	///	String: txtMyControlName.Text.Trim
	/// Integer: Int32.Parse(txtMyControlName.Text)
	/// </remarks>
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 	
    public string GetParseToSave(ColumnSchema column, string control)
    {
        switch (column.DataType)
        {
            case DbType.AnsiString: return control + ".Trim()";
            case DbType.AnsiStringFixedLength: return control + ".Trim()";
            case DbType.Binary: return control + ".Trim()";
            case DbType.Boolean: return control;
            case DbType.Byte: return control + ".Trim()";
            case DbType.Currency: return control + ".Trim()";
            case DbType.Date: return "DateTime.Parse(" + control + ")";
            case DbType.DateTime: return "DateTime.Parse(" + control + ")";
            case DbType.Decimal: return "decimal.Parse(" + control + ")";
            case DbType.Double: return "double.Parse(" + control + ")";
            case DbType.Guid: return control + ".Trim()";
            case DbType.Int16: return "(" + control + ".Trim().Length > 0 ? Int16.Parse(" + control +") : -1)";
            case DbType.Int32: return "(" + control + ".Trim().Length > 0 ? Int32.Parse(" + control +") : -1)";
            case DbType.Int64: return "(" + control + ".Trim().Length > 0 ? Int64.Parse(" + control +") : -1)";	
            case DbType.SByte: return "sbyte.Parse(" + control + ")";
            case DbType.Single: return "single.Parse(" + control + ")";
            case DbType.String: return control + ".Trim()";
            case DbType.StringFixedLength: return control + ".Trim()";
            case DbType.Time: return "DateTime.Parse(" + control + ")";
            case DbType.UInt16: return "(" + control + ".Trim().Length > 0 ? Int16.Parse(" + control +") : -1)";
            case DbType.UInt32: return "(" + control + ".Trim().Length > 0 ? Int32.Parse(" + control +") : -1)";
            case DbType.UInt64: return "(" + control + ".Trim().Length > 0 ? Int64.Parse(" + control +") : -1)";
            case DbType.VarNumeric: return "Int.Parse(" + control + ")";
            default:
            {
                return "__UNKNOWN__" + column.NativeType;
            }
        }
    }
    
    public string GetUIControlPrefix(ColumnSchema column)
    {
        /*
        This function retuirns the UI controls name including Text/Value property name
        txtFieldName.Text or chkFieldName.Checked etc
        */
        
        switch (column.DataType)
        {
            case DbType.AnsiString: return "txt";
            case DbType.AnsiStringFixedLength: return "txt";
            case DbType.Binary: return "txt";
            case DbType.Boolean: return "chk";
            case DbType.Byte: return "txt";
            case DbType.Currency: return "txt";
            case DbType.Date: return "txt";
            case DbType.DateTime: return "txt";
            case DbType.Decimal: return "txt";
            case DbType.Double: return "txt";
            case DbType.Guid: return "txt";
            case DbType.Int16: return "txt";
            case DbType.Int32: return "txt";
            case DbType.Int64: return "txt";
            case DbType.SByte: return "txt";
            case DbType.Single: return "txt";
            case DbType.String: return "txt";
            case DbType.StringFixedLength: return "txt";
            case DbType.Time: return "txt";
            case DbType.UInt16: return "txt";
            case DbType.UInt32: return "txt";
            case DbType.UInt64: return "txt";
            case DbType.VarNumeric: return "txt";
            default:
            {
                return "__UNKNOWN__" + column.NativeType;
            }
        }
    }
}