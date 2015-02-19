<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ListContactTypes.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ListContactTypes" %>
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
				<asp:ListItem Value="Abbreviation">Abbreviation</asp:ListItem>
				<asp:ListItem Value="Description">Description</asp:ListItem>
				<asp:ListItem Value="DefaultType">DefaultType</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:ListView ID="ListViewContactTypes" runat="server" 
    DataKeyNames="contactType"
    DataSourceID="ContactTypesDataSource"
	ItemPlaceHolderId="ContactTypesContent"
	OnItemDataBound="ListViewContactTypes_ItemDataBound"
    EnableViewState="False">
    <LayoutTemplate>
		<div id="ContactTypesHeader">
			<h1 id="ContactTypesLogo">ContactTypes List</h1>
		</div>
		<div runat="server">
			<table>
				<thead>
					<tr>
        		<th><asp:Label runat="server" id="hdrAbbreviation" Text='Abbreviation' /></th>
        		<th><asp:Label runat="server" id="hdrDescription" Text='Description' /></th>
        		<th><asp:Label runat="server" id="hdrDefaultType" Text='DefaultType' /></th>
					</tr>
				</thead>
				<tbody runat="server" id="ContactTypesContent">
				</tbody>
			</table>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<tr>
        		<td><asp:Label runat="server" id="lblAbbreviation" Text='<%# Eval("Abbreviation") %>' /></td>
        		<td><asp:Label runat="server" id="lblDescription" Text='<%# Eval("Description") %>' /></td>
        		<td><asp:Label runat="server" id="lblDefaultType" Text='<%# Eval("DefaultType") %>' /></td>
		</tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        There are no ContactTypes Records
    </EmptyDataTemplate>
</asp:ListView>
<br />

<asp:ObjectDataSource ID="ContactTypesDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.ContactTypesInfo"
    DeleteMethod="DeleteContactTypes" 
    InsertMethod="AddContactTypes" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListContactTypess" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateContactTypes"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="ContactType" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Abbreviation" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultType" Type="Boolean" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="ContactType" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Abbreviation" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultType" Type="Boolean" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
