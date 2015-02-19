<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ListEventTypes.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ListEventTypes" %>
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
				<asp:ListItem Value="EventTypeName">EventTypeName</asp:ListItem>
				<asp:ListItem Value="DefaultType">DefaultType</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:ListView ID="ListViewEventTypes" runat="server" 
    DataKeyNames="eventTypeId"
    DataSourceID="EventTypesDataSource"
	ItemPlaceHolderId="EventTypesContent"
	OnItemDataBound="ListViewEventTypes_ItemDataBound"
    EnableViewState="False">
    <LayoutTemplate>
		<div id="EventTypesHeader">
			<h1 id="EventTypesLogo">EventTypes List</h1>
		</div>
		<div runat="server">
			<table>
				<thead>
					<tr>
        		<th><asp:Label runat="server" id="hdrEventTypeName" Text='EventTypeName' /></th>
        		<th><asp:Label runat="server" id="hdrDefaultType" Text='DefaultType' /></th>
					</tr>
				</thead>
				<tbody runat="server" id="EventTypesContent">
				</tbody>
			</table>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<tr>
        		<td><asp:Label runat="server" id="lblEventTypeName" Text='<%# Eval("EventTypeName") %>' /></td>
        		<td><asp:Label runat="server" id="lblDefaultType" Text='<%# Eval("DefaultType") %>' /></td>
		</tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        There are no EventTypes Records
    </EmptyDataTemplate>
</asp:ListView>
<br />

<asp:ObjectDataSource ID="EventTypesDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.EventTypesInfo"
    DeleteMethod="DeleteEventTypes" 
    InsertMethod="AddEventTypes" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListEventTypess" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateEventTypes"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="EventTypeId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EventTypeName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultType" Type="Int16" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="EventTypeId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EventTypeName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultType" Type="Int16" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
