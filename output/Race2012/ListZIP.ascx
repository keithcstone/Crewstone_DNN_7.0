<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ListZIP.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ListZIP" %>
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
				<asp:ListItem Value="City">City</asp:ListItem>
				<asp:ListItem Value="State">State</asp:ListItem>
				<asp:ListItem Value="County">County</asp:ListItem>
				<asp:ListItem Value="Country">Country</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:ListView ID="ListViewZIP" runat="server" 
    DataKeyNames="fiveDigitZIP, sequence"
    DataSourceID="ZIPDataSource"
	ItemPlaceHolderId="ZIPContent"
	OnItemDataBound="ListViewZIP_ItemDataBound"
    EnableViewState="False">
    <LayoutTemplate>
		<div id="ZIPHeader">
			<h1 id="ZIPLogo">ZIP List</h1>
		</div>
		<div runat="server">
			<table>
				<thead>
					<tr>
        		<th><asp:Label runat="server" id="hdrCity" Text='City' /></th>
        		<th><asp:Label runat="server" id="hdrState" Text='State' /></th>
        		<th><asp:Label runat="server" id="hdrCounty" Text='County' /></th>
        		<th><asp:Label runat="server" id="hdrCountry" Text='Country' /></th>
					</tr>
				</thead>
				<tbody runat="server" id="ZIPContent">
				</tbody>
			</table>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<tr>
        		<td><asp:Label runat="server" id="lblCity" Text='<%# Eval("City") %>' /></td>
        		<td><asp:Label runat="server" id="lblState" Text='<%# Eval("State") %>' /></td>
        		<td><asp:Label runat="server" id="lblCounty" Text='<%# Eval("County") %>' /></td>
        		<td><asp:Label runat="server" id="lblCountry" Text='<%# Eval("Country") %>' /></td>
		</tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        There are no ZIP Records
    </EmptyDataTemplate>
</asp:ListView>
<br />

<asp:ObjectDataSource ID="ZIPDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.ZIPInfo"
    DeleteMethod="DeleteZIP" 
    InsertMethod="AddZIP" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListZIPs" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateZIP"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="FiveDigitZIP" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sequence" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="City" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="State" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="County" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Country" Type="String" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="FiveDigitZIP" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sequence" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="City" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="State" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="County" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Country" Type="String" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
