<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ListEntrants.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ListEntrants" %>
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
				<asp:ListItem Value="ContactType">ContactType</asp:ListItem>
				<asp:ListItem Value="FullName">FullName</asp:ListItem>
				<asp:ListItem Value="FirstName">FirstName</asp:ListItem>
				<asp:ListItem Value="MiddleName">MiddleName</asp:ListItem>
				<asp:ListItem Value="LastName">LastName</asp:ListItem>
				<asp:ListItem Value="Suffix">Suffix</asp:ListItem>
				<asp:ListItem Value="Nickname">Nickname</asp:ListItem>
				<asp:ListItem Value="BirthDate">BirthDate</asp:ListItem>
				<asp:ListItem Value="Age">Age</asp:ListItem>
				<asp:ListItem Value="Weight">Weight</asp:ListItem>
				<asp:ListItem Value="Sex">Sex</asp:ListItem>
				<asp:ListItem Value="TShirt">TShirt</asp:ListItem>
				<asp:ListItem Value="Sweats">Sweats</asp:ListItem>
				<asp:ListItem Value="Shorts">Shorts</asp:ListItem>
				<asp:ListItem Value="Shoes">Shoes</asp:ListItem>
				<asp:ListItem Value="ShoeStyle">ShoeStyle</asp:ListItem>
				<asp:ListItem Value="Club">Club</asp:ListItem>
				<asp:ListItem Value="Address">Address</asp:ListItem>
				<asp:ListItem Value="City">City</asp:ListItem>
				<asp:ListItem Value="State">State</asp:ListItem>
				<asp:ListItem Value="ZIP">ZIP</asp:ListItem>
				<asp:ListItem Value="Country">Country</asp:ListItem>
				<asp:ListItem Value="HomePhone">HomePhone</asp:ListItem>
				<asp:ListItem Value="MobilePhone">MobilePhone</asp:ListItem>
				<asp:ListItem Value="MobileCarrier">MobileCarrier</asp:ListItem>
				<asp:ListItem Value="EMail">EMail</asp:ListItem>
				<asp:ListItem Value="PlainText">PlainText</asp:ListItem>
				<asp:ListItem Value="USATFNumber">USATFNumber</asp:ListItem>
				<asp:ListItem Value="MemberType">MemberType</asp:ListItem>
				<asp:ListItem Value="MemberNumber">MemberNumber</asp:ListItem>
				<asp:ListItem Value="MemberCode">MemberCode</asp:ListItem>
				<asp:ListItem Value="DateJoined">DateJoined</asp:ListItem>
				<asp:ListItem Value="LastRenewal">LastRenewal</asp:ListItem>
				<asp:ListItem Value="PaidThru">PaidThru</asp:ListItem>
				<asp:ListItem Value="Waiver">Waiver</asp:ListItem>
				<asp:ListItem Value="PrimaryNo">PrimaryNo</asp:ListItem>
				<asp:ListItem Value="Survivor">Survivor</asp:ListItem>
				<asp:ListItem Value="MailingExpiration">MailingExpiration</asp:ListItem>
				<asp:ListItem Value="Memo">Memo</asp:ListItem>
				<asp:ListItem Value="Marked">Marked</asp:ListItem>
				<asp:ListItem Value="Keywords">Keywords</asp:ListItem>
				<asp:ListItem Value="Company">Company</asp:ListItem>
				<asp:ListItem Value="Title">Title</asp:ListItem>
				<asp:ListItem Value="WorkAddress">WorkAddress</asp:ListItem>
				<asp:ListItem Value="WorkCity">WorkCity</asp:ListItem>
				<asp:ListItem Value="WorkState">WorkState</asp:ListItem>
				<asp:ListItem Value="WorkZip">WorkZip</asp:ListItem>
				<asp:ListItem Value="WorkCountry">WorkCountry</asp:ListItem>
				<asp:ListItem Value="WorkPhone">WorkPhone</asp:ListItem>
				<asp:ListItem Value="WorkEmail">WorkEmail</asp:ListItem>
				<asp:ListItem Value="ActiveId">ActiveId</asp:ListItem>
				<asp:ListItem Value="InvalidEmail">InvalidEmail</asp:ListItem>
				<asp:ListItem Value="ResultsEmailOnly">ResultsEmailOnly</asp:ListItem>
				<asp:ListItem Value="InvalidAddress">InvalidAddress</asp:ListItem>
				<asp:ListItem Value="UserName">UserName</asp:ListItem>
				<asp:ListItem Value="Password">Password</asp:ListItem>
				<asp:ListItem Value="InsertionDate">InsertionDate</asp:ListItem>
				<asp:ListItem Value="UpdateDate">UpdateDate</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:ListView ID="ListViewEntrants" runat="server" 
    DataKeyNames="runnerId"
    DataSourceID="EntrantsDataSource"
	ItemPlaceHolderId="EntrantsContent"
	OnItemDataBound="ListViewEntrants_ItemDataBound"
    EnableViewState="False">
    <LayoutTemplate>
		<div id="EntrantsHeader">
			<h1 id="EntrantsLogo">Entrants List</h1>
		</div>
		<div runat="server">
			<table>
				<thead>
					<tr>
        		<th><asp:Label runat="server" id="hdrContactType" Text='ContactType' /></th>
        		<th><asp:Label runat="server" id="hdrFullName" Text='FullName' /></th>
        		<th><asp:Label runat="server" id="hdrFirstName" Text='FirstName' /></th>
        		<th><asp:Label runat="server" id="hdrMiddleName" Text='MiddleName' /></th>
        		<th><asp:Label runat="server" id="hdrLastName" Text='LastName' /></th>
        		<th><asp:Label runat="server" id="hdrSuffix" Text='Suffix' /></th>
        		<th><asp:Label runat="server" id="hdrNickname" Text='Nickname' /></th>
        		<th><asp:Label runat="server" id="hdrBirthDate" Text='BirthDate' /></th>
        		<th><asp:Label runat="server" id="hdrAge" Text='Age' /></th>
        		<th><asp:Label runat="server" id="hdrWeight" Text='Weight' /></th>
        		<th><asp:Label runat="server" id="hdrSex" Text='Sex' /></th>
        		<th><asp:Label runat="server" id="hdrTShirt" Text='TShirt' /></th>
        		<th><asp:Label runat="server" id="hdrSweats" Text='Sweats' /></th>
        		<th><asp:Label runat="server" id="hdrShorts" Text='Shorts' /></th>
        		<th><asp:Label runat="server" id="hdrShoes" Text='Shoes' /></th>
        		<th><asp:Label runat="server" id="hdrShoeStyle" Text='ShoeStyle' /></th>
        		<th><asp:Label runat="server" id="hdrClub" Text='Club' /></th>
        		<th><asp:Label runat="server" id="hdrAddress" Text='Address' /></th>
        		<th><asp:Label runat="server" id="hdrCity" Text='City' /></th>
        		<th><asp:Label runat="server" id="hdrState" Text='State' /></th>
        		<th><asp:Label runat="server" id="hdrZIP" Text='ZIP' /></th>
        		<th><asp:Label runat="server" id="hdrCountry" Text='Country' /></th>
        		<th><asp:Label runat="server" id="hdrHomePhone" Text='HomePhone' /></th>
        		<th><asp:Label runat="server" id="hdrMobilePhone" Text='MobilePhone' /></th>
        		<th><asp:Label runat="server" id="hdrMobileCarrier" Text='MobileCarrier' /></th>
        		<th><asp:Label runat="server" id="hdrEMail" Text='EMail' /></th>
        		<th><asp:Label runat="server" id="hdrPlainText" Text='PlainText' /></th>
        		<th><asp:Label runat="server" id="hdrUSATFNumber" Text='USATFNumber' /></th>
        		<th><asp:Label runat="server" id="hdrMemberType" Text='MemberType' /></th>
        		<th><asp:Label runat="server" id="hdrMemberNumber" Text='MemberNumber' /></th>
        		<th><asp:Label runat="server" id="hdrMemberCode" Text='MemberCode' /></th>
        		<th><asp:Label runat="server" id="hdrDateJoined" Text='DateJoined' /></th>
        		<th><asp:Label runat="server" id="hdrLastRenewal" Text='LastRenewal' /></th>
        		<th><asp:Label runat="server" id="hdrPaidThru" Text='PaidThru' /></th>
        		<th><asp:Label runat="server" id="hdrWaiver" Text='Waiver' /></th>
        		<th><asp:Label runat="server" id="hdrPrimaryNo" Text='PrimaryNo' /></th>
        		<th><asp:Label runat="server" id="hdrSurvivor" Text='Survivor' /></th>
        		<th><asp:Label runat="server" id="hdrMailingExpiration" Text='MailingExpiration' /></th>
        		<th><asp:Label runat="server" id="hdrMemo" Text='Memo' /></th>
        		<th><asp:Label runat="server" id="hdrMarked" Text='Marked' /></th>
        		<th><asp:Label runat="server" id="hdrKeywords" Text='Keywords' /></th>
        		<th><asp:Label runat="server" id="hdrCompany" Text='Company' /></th>
        		<th><asp:Label runat="server" id="hdrTitle" Text='Title' /></th>
        		<th><asp:Label runat="server" id="hdrWorkAddress" Text='WorkAddress' /></th>
        		<th><asp:Label runat="server" id="hdrWorkCity" Text='WorkCity' /></th>
        		<th><asp:Label runat="server" id="hdrWorkState" Text='WorkState' /></th>
        		<th><asp:Label runat="server" id="hdrWorkZip" Text='WorkZip' /></th>
        		<th><asp:Label runat="server" id="hdrWorkCountry" Text='WorkCountry' /></th>
        		<th><asp:Label runat="server" id="hdrWorkPhone" Text='WorkPhone' /></th>
        		<th><asp:Label runat="server" id="hdrWorkEmail" Text='WorkEmail' /></th>
        		<th><asp:Label runat="server" id="hdrActiveId" Text='ActiveId' /></th>
        		<th><asp:Label runat="server" id="hdrInvalidEmail" Text='InvalidEmail' /></th>
        		<th><asp:Label runat="server" id="hdrResultsEmailOnly" Text='ResultsEmailOnly' /></th>
        		<th><asp:Label runat="server" id="hdrInvalidAddress" Text='InvalidAddress' /></th>
        		<th><asp:Label runat="server" id="hdrUserName" Text='UserName' /></th>
        		<th><asp:Label runat="server" id="hdrPassword" Text='Password' /></th>
        		<th><asp:Label runat="server" id="hdrInsertionDate" Text='InsertionDate' /></th>
        		<th><asp:Label runat="server" id="hdrUpdateDate" Text='UpdateDate' /></th>
					</tr>
				</thead>
				<tbody runat="server" id="EntrantsContent">
				</tbody>
			</table>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<tr>
        		<td><asp:Label runat="server" id="lblContactType" Text='<%# Eval("ContactType") %>' /></td>
        		<td><asp:Label runat="server" id="lblFullName" Text='<%# Eval("FullName") %>' /></td>
        		<td><asp:Label runat="server" id="lblFirstName" Text='<%# Eval("FirstName") %>' /></td>
        		<td><asp:Label runat="server" id="lblMiddleName" Text='<%# Eval("MiddleName") %>' /></td>
        		<td><asp:Label runat="server" id="lblLastName" Text='<%# Eval("LastName") %>' /></td>
        		<td><asp:Label runat="server" id="lblSuffix" Text='<%# Eval("Suffix") %>' /></td>
        		<td><asp:Label runat="server" id="lblNickname" Text='<%# Eval("Nickname") %>' /></td>
        		<td><asp:Label runat="server" id="lblBirthDate" Text='<%# Eval("BirthDate") %>' /></td>
        		<td><asp:Label runat="server" id="lblAge" Text='<%# Eval("Age") %>' /></td>
        		<td><asp:Label runat="server" id="lblWeight" Text='<%# Eval("Weight") %>' /></td>
        		<td><asp:Label runat="server" id="lblSex" Text='<%# Eval("Sex") %>' /></td>
        		<td><asp:Label runat="server" id="lblTShirt" Text='<%# Eval("TShirt") %>' /></td>
        		<td><asp:Label runat="server" id="lblSweats" Text='<%# Eval("Sweats") %>' /></td>
        		<td><asp:Label runat="server" id="lblShorts" Text='<%# Eval("Shorts") %>' /></td>
        		<td><asp:Label runat="server" id="lblShoes" Text='<%# Eval("Shoes") %>' /></td>
        		<td><asp:Label runat="server" id="lblShoeStyle" Text='<%# Eval("ShoeStyle") %>' /></td>
        		<td><asp:Label runat="server" id="lblClub" Text='<%# Eval("Club") %>' /></td>
        		<td><asp:Label runat="server" id="lblAddress" Text='<%# Eval("Address") %>' /></td>
        		<td><asp:Label runat="server" id="lblCity" Text='<%# Eval("City") %>' /></td>
        		<td><asp:Label runat="server" id="lblState" Text='<%# Eval("State") %>' /></td>
        		<td><asp:Label runat="server" id="lblZIP" Text='<%# Eval("ZIP") %>' /></td>
        		<td><asp:Label runat="server" id="lblCountry" Text='<%# Eval("Country") %>' /></td>
        		<td><asp:Label runat="server" id="lblHomePhone" Text='<%# Eval("HomePhone") %>' /></td>
        		<td><asp:Label runat="server" id="lblMobilePhone" Text='<%# Eval("MobilePhone") %>' /></td>
        		<td><asp:Label runat="server" id="lblMobileCarrier" Text='<%# Eval("MobileCarrier") %>' /></td>
        		<td><asp:Label runat="server" id="lblEMail" Text='<%# Eval("EMail") %>' /></td>
        		<td><asp:Label runat="server" id="lblPlainText" Text='<%# Eval("PlainText") %>' /></td>
        		<td><asp:Label runat="server" id="lblUSATFNumber" Text='<%# Eval("USATFNumber") %>' /></td>
        		<td><asp:Label runat="server" id="lblMemberType" Text='<%# Eval("MemberType") %>' /></td>
        		<td><asp:Label runat="server" id="lblMemberNumber" Text='<%# Eval("MemberNumber") %>' /></td>
        		<td><asp:Label runat="server" id="lblMemberCode" Text='<%# Eval("MemberCode") %>' /></td>
        		<td><asp:Label runat="server" id="lblDateJoined" Text='<%# Eval("DateJoined") %>' /></td>
        		<td><asp:Label runat="server" id="lblLastRenewal" Text='<%# Eval("LastRenewal") %>' /></td>
        		<td><asp:Label runat="server" id="lblPaidThru" Text='<%# Eval("PaidThru") %>' /></td>
        		<td><asp:Label runat="server" id="lblWaiver" Text='<%# Eval("Waiver") %>' /></td>
        		<td><asp:Label runat="server" id="lblPrimaryNo" Text='<%# Eval("PrimaryNo") %>' /></td>
        		<td><asp:Label runat="server" id="lblSurvivor" Text='<%# Eval("Survivor") %>' /></td>
        		<td><asp:Label runat="server" id="lblMailingExpiration" Text='<%# Eval("MailingExpiration") %>' /></td>
        		<td><asp:Label runat="server" id="lblMemo" Text='<%# Eval("Memo") %>' /></td>
        		<td><asp:Label runat="server" id="lblMarked" Text='<%# Eval("Marked") %>' /></td>
        		<td><asp:Label runat="server" id="lblKeywords" Text='<%# Eval("Keywords") %>' /></td>
        		<td><asp:Label runat="server" id="lblCompany" Text='<%# Eval("Company") %>' /></td>
        		<td><asp:Label runat="server" id="lblTitle" Text='<%# Eval("Title") %>' /></td>
        		<td><asp:Label runat="server" id="lblWorkAddress" Text='<%# Eval("WorkAddress") %>' /></td>
        		<td><asp:Label runat="server" id="lblWorkCity" Text='<%# Eval("WorkCity") %>' /></td>
        		<td><asp:Label runat="server" id="lblWorkState" Text='<%# Eval("WorkState") %>' /></td>
        		<td><asp:Label runat="server" id="lblWorkZip" Text='<%# Eval("WorkZip") %>' /></td>
        		<td><asp:Label runat="server" id="lblWorkCountry" Text='<%# Eval("WorkCountry") %>' /></td>
        		<td><asp:Label runat="server" id="lblWorkPhone" Text='<%# Eval("WorkPhone") %>' /></td>
        		<td><asp:Label runat="server" id="lblWorkEmail" Text='<%# Eval("WorkEmail") %>' /></td>
        		<td><asp:Label runat="server" id="lblActiveId" Text='<%# Eval("ActiveId") %>' /></td>
        		<td><asp:Label runat="server" id="lblInvalidEmail" Text='<%# Eval("InvalidEmail") %>' /></td>
        		<td><asp:Label runat="server" id="lblResultsEmailOnly" Text='<%# Eval("ResultsEmailOnly") %>' /></td>
        		<td><asp:Label runat="server" id="lblInvalidAddress" Text='<%# Eval("InvalidAddress") %>' /></td>
        		<td><asp:Label runat="server" id="lblUserName" Text='<%# Eval("UserName") %>' /></td>
        		<td><asp:Label runat="server" id="lblPassword" Text='<%# Eval("Password") %>' /></td>
        		<td><asp:Label runat="server" id="lblInsertionDate" Text='<%# Eval("InsertionDate") %>' /></td>
        		<td><asp:Label runat="server" id="lblUpdateDate" Text='<%# Eval("UpdateDate") %>' /></td>
		</tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        There are no Entrants Records
    </EmptyDataTemplate>
</asp:ListView>
<br />

<asp:ObjectDataSource ID="EntrantsDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.EntrantsInfo"
    DeleteMethod="DeleteEntrants" 
    InsertMethod="AddEntrants" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListEntrantss" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateEntrants"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="RunnerId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactType" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="FullName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="FirstName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MiddleName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Suffix" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Nickname" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="BirthDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Age" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Weight" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sex" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="TShirt" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sweats" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Shorts" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Shoes" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ShoeStyle" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Club" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Address" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="City" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="State" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ZIP" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Country" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="HomePhone" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MobilePhone" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MobileCarrier" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EMail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PlainText" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="USATFNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberType" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberNumber" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberCode" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DateJoined" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastRenewal" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PaidThru" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Waiver" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PrimaryNo" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Survivor" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MailingExpiration" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Memo" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Marked" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Keywords" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Company" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Title" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkAddress" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkCity" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkState" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkZip" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkCountry" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkPhone" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkEmail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ActiveId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="InvalidEmail" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ResultsEmailOnly" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="InvalidAddress" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="UserName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Password" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="InsertionDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="UpdateDate" Type="DateTime" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="RunnerId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactType" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="FullName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="FirstName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MiddleName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Suffix" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Nickname" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="BirthDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Age" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Weight" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sex" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="TShirt" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sweats" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Shorts" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Shoes" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ShoeStyle" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Club" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Address" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="City" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="State" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ZIP" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Country" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="HomePhone" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MobilePhone" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MobileCarrier" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EMail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PlainText" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="USATFNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberType" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberNumber" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberCode" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DateJoined" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastRenewal" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PaidThru" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Waiver" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PrimaryNo" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Survivor" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MailingExpiration" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Memo" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Marked" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Keywords" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Company" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Title" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkAddress" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkCity" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkState" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkZip" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkCountry" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkPhone" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WorkEmail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ActiveId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="InvalidEmail" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ResultsEmailOnly" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="InvalidAddress" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="UserName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Password" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="InsertionDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="UpdateDate" Type="DateTime" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
