<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ListMemberTypes.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ListMemberTypes" %>
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
				<asp:ListItem Value="MemberType">MemberType</asp:ListItem>
				<asp:ListItem Value="MemberDues">MemberDues</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:ListView ID="ListViewMemberTypes" runat="server" 
    DataKeyNames="memberTypeID"
    DataSourceID="MemberTypesDataSource"
	ItemPlaceHolderId="MemberTypesContent"
	OnItemDataBound="ListViewMemberTypes_ItemDataBound"
    EnableViewState="False">
    <LayoutTemplate>
		<div id="MemberTypesHeader">
			<h1 id="MemberTypesLogo">MemberTypes List</h1>
		</div>
		<div runat="server">
			<table>
				<thead>
					<tr>
        		<th><asp:Label runat="server" id="hdrMemberType" Text='MemberType' /></th>
        		<th><asp:Label runat="server" id="hdrMemberDues" Text='MemberDues' /></th>
					</tr>
				</thead>
				<tbody runat="server" id="MemberTypesContent">
				</tbody>
			</table>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<tr>
        		<td><asp:Label runat="server" id="lblMemberType" Text='<%# Eval("MemberType") %>' /></td>
        		<td><asp:Label runat="server" id="lblMemberDues" Text='<%# Eval("MemberDues") %>' /></td>
		</tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        There are no MemberTypes Records
    </EmptyDataTemplate>
</asp:ListView>
<br />

<asp:ObjectDataSource ID="MemberTypesDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.MemberTypesInfo"
    DeleteMethod="DeleteMemberTypes" 
    InsertMethod="AddMemberTypes" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListMemberTypess" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateMemberTypes"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="MemberTypeID" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberType" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberDues" Type="decimal" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="MemberTypeID" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberType" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberDues" Type="decimal" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
