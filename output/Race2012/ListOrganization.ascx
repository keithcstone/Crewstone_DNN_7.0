<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ListOrganization.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ListOrganization" %>
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
				<asp:ListItem Value="ClubName">ClubName</asp:ListItem>
				<asp:ListItem Value="Address">Address</asp:ListItem>
				<asp:ListItem Value="City">City</asp:ListItem>
				<asp:ListItem Value="StateOrProvince">StateOrProvince</asp:ListItem>
				<asp:ListItem Value="PostalCode">PostalCode</asp:ListItem>
				<asp:ListItem Value="Country">Country</asp:ListItem>
				<asp:ListItem Value="DefaultInvoiceDescription">DefaultInvoiceDescription</asp:ListItem>
				<asp:ListItem Value="PhoneNumber">PhoneNumber</asp:ListItem>
				<asp:ListItem Value="FaxNumber">FaxNumber</asp:ListItem>
				<asp:ListItem Value="EMail">EMail</asp:ListItem>
				<asp:ListItem Value="Nickname">Nickname</asp:ListItem>
				<asp:ListItem Value="MailingExpirePeriod">MailingExpirePeriod</asp:ListItem>
				<asp:ListItem Value="LastEmail">LastEmail</asp:ListItem>
				<asp:ListItem Value="LastLetters">LastLetters</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:ListView ID="ListViewOrganization" runat="server" 
    DataKeyNames="orgID"
    DataSourceID="OrganizationDataSource"
	ItemPlaceHolderId="OrganizationContent"
	OnItemDataBound="ListViewOrganization_ItemDataBound"
    EnableViewState="False">
    <LayoutTemplate>
		<div id="OrganizationHeader">
			<h1 id="OrganizationLogo">Organization List</h1>
		</div>
		<div runat="server">
			<table>
				<thead>
					<tr>
        		<th><asp:Label runat="server" id="hdrClubName" Text='ClubName' /></th>
        		<th><asp:Label runat="server" id="hdrAddress" Text='Address' /></th>
        		<th><asp:Label runat="server" id="hdrCity" Text='City' /></th>
        		<th><asp:Label runat="server" id="hdrStateOrProvince" Text='StateOrProvince' /></th>
        		<th><asp:Label runat="server" id="hdrPostalCode" Text='PostalCode' /></th>
        		<th><asp:Label runat="server" id="hdrCountry" Text='Country' /></th>
        		<th><asp:Label runat="server" id="hdrDefaultInvoiceDescription" Text='DefaultInvoiceDescription' /></th>
        		<th><asp:Label runat="server" id="hdrPhoneNumber" Text='PhoneNumber' /></th>
        		<th><asp:Label runat="server" id="hdrFaxNumber" Text='FaxNumber' /></th>
        		<th><asp:Label runat="server" id="hdrEMail" Text='EMail' /></th>
        		<th><asp:Label runat="server" id="hdrNickname" Text='Nickname' /></th>
        		<th><asp:Label runat="server" id="hdrMailingExpirePeriod" Text='MailingExpirePeriod' /></th>
        		<th><asp:Label runat="server" id="hdrLastEmail" Text='LastEmail' /></th>
        		<th><asp:Label runat="server" id="hdrLastLetters" Text='LastLetters' /></th>
					</tr>
				</thead>
				<tbody runat="server" id="OrganizationContent">
				</tbody>
			</table>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<tr>
        		<td><asp:Label runat="server" id="lblClubName" Text='<%# Eval("ClubName") %>' /></td>
        		<td><asp:Label runat="server" id="lblAddress" Text='<%# Eval("Address") %>' /></td>
        		<td><asp:Label runat="server" id="lblCity" Text='<%# Eval("City") %>' /></td>
        		<td><asp:Label runat="server" id="lblStateOrProvince" Text='<%# Eval("StateOrProvince") %>' /></td>
        		<td><asp:Label runat="server" id="lblPostalCode" Text='<%# Eval("PostalCode") %>' /></td>
        		<td><asp:Label runat="server" id="lblCountry" Text='<%# Eval("Country") %>' /></td>
        		<td><asp:Label runat="server" id="lblDefaultInvoiceDescription" Text='<%# Eval("DefaultInvoiceDescription") %>' /></td>
        		<td><asp:Label runat="server" id="lblPhoneNumber" Text='<%# Eval("PhoneNumber") %>' /></td>
        		<td><asp:Label runat="server" id="lblFaxNumber" Text='<%# Eval("FaxNumber") %>' /></td>
        		<td><asp:Label runat="server" id="lblEMail" Text='<%# Eval("EMail") %>' /></td>
        		<td><asp:Label runat="server" id="lblNickname" Text='<%# Eval("Nickname") %>' /></td>
        		<td><asp:Label runat="server" id="lblMailingExpirePeriod" Text='<%# Eval("MailingExpirePeriod") %>' /></td>
        		<td><asp:Label runat="server" id="lblLastEmail" Text='<%# Eval("LastEmail") %>' /></td>
        		<td><asp:Label runat="server" id="lblLastLetters" Text='<%# Eval("LastLetters") %>' /></td>
		</tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        There are no Organization Records
    </EmptyDataTemplate>
</asp:ListView>
<br />

<asp:ObjectDataSource ID="OrganizationDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.OrganizationInfo"
    DeleteMethod="DeleteOrganization" 
    InsertMethod="AddOrganization" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListOrganizations" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateOrganization"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="OrgID" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ClubName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Address" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="City" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="StateOrProvince" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PostalCode" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Country" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultInvoiceDescription" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PhoneNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="FaxNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EMail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Nickname" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MailingExpirePeriod" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastEmail" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastLetters" Type="DateTime" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="OrgID" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ClubName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Address" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="City" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="StateOrProvince" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PostalCode" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Country" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultInvoiceDescription" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PhoneNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="FaxNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EMail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Nickname" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MailingExpirePeriod" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastEmail" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastLetters" Type="DateTime" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
