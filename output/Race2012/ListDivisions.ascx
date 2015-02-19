<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ListDivisions.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ListDivisions" %>
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
				<asp:ListItem Value="Description">Description</asp:ListItem>
				<asp:ListItem Value="Priority">Priority</asp:ListItem>
				<asp:ListItem Value="Overall">Overall</asp:ListItem>
				<asp:ListItem Value="Masters">Masters</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:ListView ID="ListViewDivisions" runat="server" 
    DataKeyNames="division"
    DataSourceID="DivisionsDataSource"
	ItemPlaceHolderId="DivisionsContent"
	OnItemDataBound="ListViewDivisions_ItemDataBound"
    EnableViewState="False">
    <LayoutTemplate>
		<div id="DivisionsHeader">
			<h1 id="DivisionsLogo">Divisions List</h1>
		</div>
		<div runat="server">
			<table>
				<thead>
					<tr>
        		<th><asp:Label runat="server" id="hdrDescription" Text='Description' /></th>
        		<th><asp:Label runat="server" id="hdrPriority" Text='Priority' /></th>
        		<th><asp:Label runat="server" id="hdrOverall" Text='Overall' /></th>
        		<th><asp:Label runat="server" id="hdrMasters" Text='Masters' /></th>
					</tr>
				</thead>
				<tbody runat="server" id="DivisionsContent">
				</tbody>
			</table>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<tr>
        		<td><asp:Label runat="server" id="lblDescription" Text='<%# Eval("Description") %>' /></td>
        		<td><asp:Label runat="server" id="lblPriority" Text='<%# Eval("Priority") %>' /></td>
        		<td><asp:Label runat="server" id="lblOverall" Text='<%# Eval("Overall") %>' /></td>
        		<td><asp:Label runat="server" id="lblMasters" Text='<%# Eval("Masters") %>' /></td>
		</tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        There are no Divisions Records
    </EmptyDataTemplate>
</asp:ListView>
<br />

<asp:ObjectDataSource ID="DivisionsDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.DivisionsInfo"
    DeleteMethod="DeleteDivisions" 
    InsertMethod="AddDivisions" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListDivisionss" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateDivisions"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="Division" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Priority" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Overall" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Masters" Type="Boolean" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="Division" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Priority" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Overall" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Masters" Type="Boolean" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
