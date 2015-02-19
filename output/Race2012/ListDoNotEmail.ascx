<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ListDoNotEmail.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ListDoNotEmail" %>
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
				<asp:ListItem Value="MovedBy">MovedBy</asp:ListItem>
				<asp:ListItem Value="OptOutReason">OptOutReason</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:ListView ID="ListViewDoNotEmail" runat="server" 
    DataKeyNames="emailAddress"
    DataSourceID="DoNotEmailDataSource"
	ItemPlaceHolderId="DoNotEmailContent"
	OnItemDataBound="ListViewDoNotEmail_ItemDataBound"
    EnableViewState="False">
    <LayoutTemplate>
		<div id="DoNotEmailHeader">
			<h1 id="DoNotEmailLogo">DoNotEmail List</h1>
		</div>
		<div runat="server">
			<table>
				<thead>
					<tr>
        		<th><asp:Label runat="server" id="hdrMovedBy" Text='MovedBy' /></th>
        		<th><asp:Label runat="server" id="hdrOptOutReason" Text='OptOutReason' /></th>
					</tr>
				</thead>
				<tbody runat="server" id="DoNotEmailContent">
				</tbody>
			</table>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<tr>
        		<td><asp:Label runat="server" id="lblMovedBy" Text='<%# Eval("MovedBy") %>' /></td>
        		<td><asp:Label runat="server" id="lblOptOutReason" Text='<%# Eval("OptOutReason") %>' /></td>
		</tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        There are no DoNotEmail Records
    </EmptyDataTemplate>
</asp:ListView>
<br />

<asp:ObjectDataSource ID="DoNotEmailDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.DoNotEmailInfo"
    DeleteMethod="DeleteDoNotEmail" 
    InsertMethod="AddDoNotEmail" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListDoNotEmails" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateDoNotEmail"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="EmailAddress" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MovedBy" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="OptOutReason" Type="String" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="EmailAddress" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MovedBy" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="OptOutReason" Type="String" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
