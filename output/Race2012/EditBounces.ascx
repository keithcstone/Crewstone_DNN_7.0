<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EditBounces.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.EditBounces" %>
<%@ Register Assembly="DotNetNuke.WebUtility" Namespace="DotNetNuke.UI.Utilities" TagPrefix="cc1" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<table width="475" border="0">
	<tr>
		<td align="left" width="75"><asp:label id="lblSearch" cssclass="SubHead" resourcekey="Search" runat="server">Search:</asp:label></td>
		<td class="Normal" align="left" width="*">
			<asp:textbox id="txtSearch" Runat="server"></asp:textbox>
			<asp:DropDownList id="ddlSearchType" Runat="server">
				<asp:ListItem Value="PortalId">PortalId</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:GridView ID="GridBounces" runat="server" 
    AllowPaging="True" AutoGenerateColumns="False"
    DataKeyNames="eMail"
    DataSourceID="BouncesDataSource"
    EnableViewState="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
    </Columns>
    <EmptyDataTemplate>
        There are no Bounces Records
    </EmptyDataTemplate>
</asp:GridView>
<br />
<asp:Button ID="AddBouncesItemButton" runat="server" EnableViewState="False" Text="Add Bounces"></asp:Button>
<br /><br />
<asp:FormView ID="FormBounces" runat="server" 
	DataKeyNames="eMail" 
	DataSourceID="BouncesDataSource"
    DefaultMode="Insert" Visible="False">
    <EditItemTemplate>
    </EditItemTemplate>
    <InsertItemTemplate>
	<table>
	<tr><td colspan="2">
		<asp:ValidationSummary
			HeaderText="The following fields have errors:"
			DisplayMode="BulletList"
			EnableClientScript="true"
			runat="server"/>
	</td></tr>
        <tr><td></td>
		<td><asp:TextBox ID="txtPortalId" runat="server" Text='<%# Bind("PortalId") %>' Visible="False"></asp:TextBox></td>
		</tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertBouncesItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Insert" OnClick="InsertBouncesItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertBouncesCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertBouncesCancelButton_Click">
             </asp:LinkButton>
         </p>
     </InsertItemTemplate>
     <ItemTemplate>
     </ItemTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="BouncesDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.BouncesInfo"
    DeleteMethod="DeleteBounces" 
    InsertMethod="AddBounces" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListBouncess" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateBounces"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="EMail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="EMail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />