<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ViewEntrants.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ViewEntrants" %>
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
<br />
<asp:Button ID="AddEntrantsItemButton" runat="server" EnableViewState="False">Add Entrants</asp:Button>
<br /><br /><asp:label id="lblStatus" runat="server" /><br /><br />
<asp:FormView ID="FormEntrants" runat="server" 
	DataKeyNames="runnerId" 
	DataSourceID="EntrantsDataSource"
    DefaultMode="ReadOnly" Visible="True">
    <EditItemTemplate>
	<table>
	<tr><td colspan = "2">
		<asp:ValidationSummary
			HeaderText="The following fields have errors:"
			DisplayMode="BulletList"
			EnableClientScript="true"
			runat="server"/>
	</td></tr>
        <tr><td></td>
		<td><asp:TextBox ID="txtPortalIdEdit" runat="server" Text='<%# Bind("PortalId") %>' Visible="False"></asp:TextBox></td>
		</tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactTypeEdit" runat="server" controlname="lblContactType" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactType" runat="server" Text='<%# Bind("ContactType") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comContactType" CssClass="NormalRed" runat="server" resourcekey="valContactType.ErrorMessage" ControlToValidate="txtContactType" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblFullNameEdit" runat="server" controlname="lblFullName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtFullName" runat="server" Text='<%# Bind("FullName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblFirstNameEdit" runat="server" controlname="lblFirstName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMiddleNameEdit" runat="server" controlname="lblMiddleName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMiddleName" runat="server" Text='<%# Bind("MiddleName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastNameEdit" runat="server" controlname="lblLastName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSuffixEdit" runat="server" controlname="lblSuffix" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSuffix" runat="server" Text='<%# Bind("Suffix") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblNicknameEdit" runat="server" controlname="lblNickname" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtNickname" runat="server" Text='<%# Bind("Nickname") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblBirthDateEdit" runat="server" controlname="lblBirthDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtBirthDate" runat="server" Text='<%# Bind("BirthDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comBirthDate" CssClass="NormalRed" runat="server" resourcekey="valBirthDate.ErrorMessage" ControlToValidate="txtBirthDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAgeEdit" runat="server" controlname="lblAge" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAge" runat="server" Text='<%# Bind("Age") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comAge" CssClass="NormalRed" runat="server" resourcekey="valAge.ErrorMessage" ControlToValidate="txtAge" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWeightEdit" runat="server" controlname="lblWeight" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWeight" runat="server" Text='<%# Bind("Weight") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comWeight" CssClass="NormalRed" runat="server" resourcekey="valWeight.ErrorMessage" ControlToValidate="txtWeight" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSexEdit" runat="server" controlname="lblSex" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSex" runat="server" Text='<%# Bind("Sex") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblTShirtEdit" runat="server" controlname="lblTShirt" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtTShirt" runat="server" Text='<%# Bind("TShirt") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSweatsEdit" runat="server" controlname="lblSweats" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSweats" runat="server" Text='<%# Bind("Sweats") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblShortsEdit" runat="server" controlname="lblShorts" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtShorts" runat="server" Text='<%# Bind("Shorts") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblShoesEdit" runat="server" controlname="lblShoes" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtShoes" runat="server" Text='<%# Bind("Shoes") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblShoeStyleEdit" runat="server" controlname="lblShoeStyle" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtShoeStyle" runat="server" Text='<%# Bind("ShoeStyle") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblClubEdit" runat="server" controlname="lblClub" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtClub" runat="server" Text='<%# Bind("Club") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAddressEdit" runat="server" controlname="lblAddress" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCityEdit" runat="server" controlname="lblCity" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStateEdit" runat="server" controlname="lblState" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtState" runat="server" Text='<%# Bind("State") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblZIPEdit" runat="server" controlname="lblZIP" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtZIP" runat="server" Text='<%# Bind("ZIP") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCountryEdit" runat="server" controlname="lblCountry" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblHomePhoneEdit" runat="server" controlname="lblHomePhone" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtHomePhone" runat="server" Text='<%# Bind("HomePhone") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMobilePhoneEdit" runat="server" controlname="lblMobilePhone" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMobilePhone" runat="server" Text='<%# Bind("MobilePhone") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMobileCarrierEdit" runat="server" controlname="lblMobileCarrier" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMobileCarrier" runat="server" Text='<%# Bind("MobileCarrier") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEMailEdit" runat="server" controlname="lblEMail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEMail" runat="server" Text='<%# Bind("EMail") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPlainTextEdit" runat="server" controlname="lblPlainText" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtPlainText" runat="server" Checked='<%# Bind("PlainText") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUSATFNumberEdit" runat="server" controlname="lblUSATFNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtUSATFNumber" runat="server" Text='<%# Bind("USATFNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemberTypeEdit" runat="server" controlname="lblMemberType" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMemberType" runat="server" Text='<%# Bind("MemberType") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemberNumberEdit" runat="server" controlname="lblMemberNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMemberNumber" runat="server" Text='<%# Bind("MemberNumber") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comMemberNumber" CssClass="NormalRed" runat="server" resourcekey="valMemberNumber.ErrorMessage" ControlToValidate="txtMemberNumber" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemberCodeEdit" runat="server" controlname="lblMemberCode" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMemberCode" runat="server" Text='<%# Bind("MemberCode") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDateJoinedEdit" runat="server" controlname="lblDateJoined" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDateJoined" runat="server" Text='<%# Bind("DateJoined") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDateJoined" CssClass="NormalRed" runat="server" resourcekey="valDateJoined.ErrorMessage" ControlToValidate="txtDateJoined" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastRenewalEdit" runat="server" controlname="lblLastRenewal" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtLastRenewal" runat="server" Text='<%# Bind("LastRenewal") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comLastRenewal" CssClass="NormalRed" runat="server" resourcekey="valLastRenewal.ErrorMessage" ControlToValidate="txtLastRenewal" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPaidThruEdit" runat="server" controlname="lblPaidThru" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPaidThru" runat="server" Text='<%# Bind("PaidThru") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comPaidThru" CssClass="NormalRed" runat="server" resourcekey="valPaidThru.ErrorMessage" ControlToValidate="txtPaidThru" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWaiverEdit" runat="server" controlname="lblWaiver" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtWaiver" runat="server" Checked='<%# Bind("Waiver") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPrimaryNoEdit" runat="server" controlname="lblPrimaryNo" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPrimaryNo" runat="server" Text='<%# Bind("PrimaryNo") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comPrimaryNo" CssClass="NormalRed" runat="server" resourcekey="valPrimaryNo.ErrorMessage" ControlToValidate="txtPrimaryNo" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSurvivorEdit" runat="server" controlname="lblSurvivor" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtSurvivor" runat="server" Checked='<%# Bind("Survivor") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMailingExpirationEdit" runat="server" controlname="lblMailingExpiration" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMailingExpiration" runat="server" Text='<%# Bind("MailingExpiration") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comMailingExpiration" CssClass="NormalRed" runat="server" resourcekey="valMailingExpiration.ErrorMessage" ControlToValidate="txtMailingExpiration" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemoEdit" runat="server" controlname="lblMemo" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMemo" runat="server" Text='<%# Bind("Memo") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMarkedEdit" runat="server" controlname="lblMarked" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtMarked" runat="server" Checked='<%# Bind("Marked") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblKeywordsEdit" runat="server" controlname="lblKeywords" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtKeywords" runat="server" Text='<%# Bind("Keywords") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCompanyEdit" runat="server" controlname="lblCompany" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCompany" runat="server" Text='<%# Bind("Company") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblTitleEdit" runat="server" controlname="lblTitle" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtTitle" runat="server" Text='<%# Bind("Title") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkAddressEdit" runat="server" controlname="lblWorkAddress" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkAddress" runat="server" Text='<%# Bind("WorkAddress") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkCityEdit" runat="server" controlname="lblWorkCity" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkCity" runat="server" Text='<%# Bind("WorkCity") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkStateEdit" runat="server" controlname="lblWorkState" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkState" runat="server" Text='<%# Bind("WorkState") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkZipEdit" runat="server" controlname="lblWorkZip" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkZip" runat="server" Text='<%# Bind("WorkZip") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkCountryEdit" runat="server" controlname="lblWorkCountry" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkCountry" runat="server" Text='<%# Bind("WorkCountry") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkPhoneEdit" runat="server" controlname="lblWorkPhone" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkPhone" runat="server" Text='<%# Bind("WorkPhone") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkEmailEdit" runat="server" controlname="lblWorkEmail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkEmail" runat="server" Text='<%# Bind("WorkEmail") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblActiveIdEdit" runat="server" controlname="lblActiveId" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtActiveId" runat="server" Text='<%# Bind("ActiveId") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comActiveId" CssClass="NormalRed" runat="server" resourcekey="valActiveId.ErrorMessage" ControlToValidate="txtActiveId" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInvalidEmailEdit" runat="server" controlname="lblInvalidEmail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtInvalidEmail" runat="server" Checked='<%# Bind("InvalidEmail") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblResultsEmailOnlyEdit" runat="server" controlname="lblResultsEmailOnly" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtResultsEmailOnly" runat="server" Checked='<%# Bind("ResultsEmailOnly") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInvalidAddressEdit" runat="server" controlname="lblInvalidAddress" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtInvalidAddress" runat="server" Checked='<%# Bind("InvalidAddress") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUserNameEdit" runat="server" controlname="lblUserName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("UserName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPasswordEdit" runat="server" controlname="lblPassword" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInsertionDateEdit" runat="server" controlname="lblInsertionDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtInsertionDate" runat="server" Text='<%# Bind("InsertionDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comInsertionDate" CssClass="NormalRed" runat="server" resourcekey="valInsertionDate.ErrorMessage" ControlToValidate="txtInsertionDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUpdateDateEdit" runat="server" controlname="lblUpdateDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtUpdateDate" runat="server" Text='<%# Bind("UpdateDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comUpdateDate" CssClass="NormalRed" runat="server" resourcekey="valUpdateDate.ErrorMessage" ControlToValidate="txtUpdateDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="UpdateEntrantsItemButton" runat="server" 
                 CausesValidation="True" CommandName="Update"
                 Text="Save" OnClick="UpdateEntrantsItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="UpdateEntrantsCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="UpdateEntrantsCancelButton_Click">
             </asp:LinkButton>
         </p>
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
        <tr>
        <td class="SubHead"><dnn:label id="lblContactType" runat="server" controlname="lblContactType" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactType" runat="server" Text='<%# Bind("ContactType") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comContactType" CssClass="NormalRed" runat="server" resourcekey="valContactType.ErrorMessage" ControlToValidate="txtContactType" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblFullName" runat="server" controlname="lblFullName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtFullName" runat="server" Text='<%# Bind("FullName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblFirstName" runat="server" controlname="lblFirstName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMiddleName" runat="server" controlname="lblMiddleName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMiddleName" runat="server" Text='<%# Bind("MiddleName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastName" runat="server" controlname="lblLastName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSuffix" runat="server" controlname="lblSuffix" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSuffix" runat="server" Text='<%# Bind("Suffix") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblNickname" runat="server" controlname="lblNickname" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtNickname" runat="server" Text='<%# Bind("Nickname") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblBirthDate" runat="server" controlname="lblBirthDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtBirthDate" runat="server" Text='<%# Bind("BirthDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comBirthDate" CssClass="NormalRed" runat="server" resourcekey="valBirthDate.ErrorMessage" ControlToValidate="txtBirthDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAge" runat="server" controlname="lblAge" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAge" runat="server" Text='<%# Bind("Age") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comAge" CssClass="NormalRed" runat="server" resourcekey="valAge.ErrorMessage" ControlToValidate="txtAge" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWeight" runat="server" controlname="lblWeight" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWeight" runat="server" Text='<%# Bind("Weight") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comWeight" CssClass="NormalRed" runat="server" resourcekey="valWeight.ErrorMessage" ControlToValidate="txtWeight" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSex" runat="server" controlname="lblSex" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSex" runat="server" Text='<%# Bind("Sex") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblTShirt" runat="server" controlname="lblTShirt" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtTShirt" runat="server" Text='<%# Bind("TShirt") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSweats" runat="server" controlname="lblSweats" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSweats" runat="server" Text='<%# Bind("Sweats") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblShorts" runat="server" controlname="lblShorts" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtShorts" runat="server" Text='<%# Bind("Shorts") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblShoes" runat="server" controlname="lblShoes" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtShoes" runat="server" Text='<%# Bind("Shoes") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblShoeStyle" runat="server" controlname="lblShoeStyle" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtShoeStyle" runat="server" Text='<%# Bind("ShoeStyle") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblClub" runat="server" controlname="lblClub" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtClub" runat="server" Text='<%# Bind("Club") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAddress" runat="server" controlname="lblAddress" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCity" runat="server" controlname="lblCity" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblState" runat="server" controlname="lblState" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtState" runat="server" Text='<%# Bind("State") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblZIP" runat="server" controlname="lblZIP" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtZIP" runat="server" Text='<%# Bind("ZIP") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCountry" runat="server" controlname="lblCountry" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblHomePhone" runat="server" controlname="lblHomePhone" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtHomePhone" runat="server" Text='<%# Bind("HomePhone") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMobilePhone" runat="server" controlname="lblMobilePhone" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMobilePhone" runat="server" Text='<%# Bind("MobilePhone") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMobileCarrier" runat="server" controlname="lblMobileCarrier" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMobileCarrier" runat="server" Text='<%# Bind("MobileCarrier") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEMail" runat="server" controlname="lblEMail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEMail" runat="server" Text='<%# Bind("EMail") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPlainText" runat="server" controlname="lblPlainText" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtPlainText" runat="server" Checked='<%# Bind("PlainText") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUSATFNumber" runat="server" controlname="lblUSATFNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtUSATFNumber" runat="server" Text='<%# Bind("USATFNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemberType" runat="server" controlname="lblMemberType" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMemberType" runat="server" Text='<%# Bind("MemberType") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemberNumber" runat="server" controlname="lblMemberNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMemberNumber" runat="server" Text='<%# Bind("MemberNumber") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comMemberNumber" CssClass="NormalRed" runat="server" resourcekey="valMemberNumber.ErrorMessage" ControlToValidate="txtMemberNumber" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemberCode" runat="server" controlname="lblMemberCode" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMemberCode" runat="server" Text='<%# Bind("MemberCode") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDateJoined" runat="server" controlname="lblDateJoined" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDateJoined" runat="server" Text='<%# Bind("DateJoined") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDateJoined" CssClass="NormalRed" runat="server" resourcekey="valDateJoined.ErrorMessage" ControlToValidate="txtDateJoined" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastRenewal" runat="server" controlname="lblLastRenewal" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtLastRenewal" runat="server" Text='<%# Bind("LastRenewal") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comLastRenewal" CssClass="NormalRed" runat="server" resourcekey="valLastRenewal.ErrorMessage" ControlToValidate="txtLastRenewal" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPaidThru" runat="server" controlname="lblPaidThru" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPaidThru" runat="server" Text='<%# Bind("PaidThru") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comPaidThru" CssClass="NormalRed" runat="server" resourcekey="valPaidThru.ErrorMessage" ControlToValidate="txtPaidThru" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWaiver" runat="server" controlname="lblWaiver" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtWaiver" runat="server" Checked='<%# Bind("Waiver") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPrimaryNo" runat="server" controlname="lblPrimaryNo" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPrimaryNo" runat="server" Text='<%# Bind("PrimaryNo") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comPrimaryNo" CssClass="NormalRed" runat="server" resourcekey="valPrimaryNo.ErrorMessage" ControlToValidate="txtPrimaryNo" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSurvivor" runat="server" controlname="lblSurvivor" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtSurvivor" runat="server" Checked='<%# Bind("Survivor") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMailingExpiration" runat="server" controlname="lblMailingExpiration" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMailingExpiration" runat="server" Text='<%# Bind("MailingExpiration") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comMailingExpiration" CssClass="NormalRed" runat="server" resourcekey="valMailingExpiration.ErrorMessage" ControlToValidate="txtMailingExpiration" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemo" runat="server" controlname="lblMemo" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMemo" runat="server" Text='<%# Bind("Memo") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMarked" runat="server" controlname="lblMarked" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtMarked" runat="server" Checked='<%# Bind("Marked") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblKeywords" runat="server" controlname="lblKeywords" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtKeywords" runat="server" Text='<%# Bind("Keywords") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCompany" runat="server" controlname="lblCompany" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCompany" runat="server" Text='<%# Bind("Company") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblTitle" runat="server" controlname="lblTitle" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtTitle" runat="server" Text='<%# Bind("Title") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkAddress" runat="server" controlname="lblWorkAddress" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkAddress" runat="server" Text='<%# Bind("WorkAddress") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkCity" runat="server" controlname="lblWorkCity" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkCity" runat="server" Text='<%# Bind("WorkCity") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkState" runat="server" controlname="lblWorkState" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkState" runat="server" Text='<%# Bind("WorkState") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkZip" runat="server" controlname="lblWorkZip" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkZip" runat="server" Text='<%# Bind("WorkZip") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkCountry" runat="server" controlname="lblWorkCountry" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkCountry" runat="server" Text='<%# Bind("WorkCountry") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkPhone" runat="server" controlname="lblWorkPhone" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkPhone" runat="server" Text='<%# Bind("WorkPhone") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkEmail" runat="server" controlname="lblWorkEmail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWorkEmail" runat="server" Text='<%# Bind("WorkEmail") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblActiveId" runat="server" controlname="lblActiveId" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtActiveId" runat="server" Text='<%# Bind("ActiveId") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comActiveId" CssClass="NormalRed" runat="server" resourcekey="valActiveId.ErrorMessage" ControlToValidate="txtActiveId" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInvalidEmail" runat="server" controlname="lblInvalidEmail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtInvalidEmail" runat="server" Checked='<%# Bind("InvalidEmail") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblResultsEmailOnly" runat="server" controlname="lblResultsEmailOnly" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtResultsEmailOnly" runat="server" Checked='<%# Bind("ResultsEmailOnly") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInvalidAddress" runat="server" controlname="lblInvalidAddress" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtInvalidAddress" runat="server" Checked='<%# Bind("InvalidAddress") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUserName" runat="server" controlname="lblUserName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("UserName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPassword" runat="server" controlname="lblPassword" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInsertionDate" runat="server" controlname="lblInsertionDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtInsertionDate" runat="server" Text='<%# Bind("InsertionDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comInsertionDate" CssClass="NormalRed" runat="server" resourcekey="valInsertionDate.ErrorMessage" ControlToValidate="txtInsertionDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUpdateDate" runat="server" controlname="lblUpdateDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtUpdateDate" runat="server" Text='<%# Bind("UpdateDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comUpdateDate" CssClass="NormalRed" runat="server" resourcekey="valUpdateDate.ErrorMessage" ControlToValidate="txtUpdateDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertEntrantsItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Save" OnClick="InsertEntrantsItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertEntrantsCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertEntrantsCancelButton_Click">
             </asp:LinkButton>
         </p>
    </InsertItemTemplate>
    <ItemTemplate>
	<table>
        <tr><td></td>
		<td><asp:TextBox ID="txtPortalIdView" runat="server" Text='<%# Bind("PortalId") %>' Visible="False"></asp:TextBox></td>
		</tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactTypeView" runat="server" controlname="lblContactTypeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtContactTypeView" runat="server" Text='<%# Eval("ContactType") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblFullNameView" runat="server" controlname="lblFullNameView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtFullNameView" runat="server" Text='<%# Eval("FullName") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblFirstNameView" runat="server" controlname="lblFirstNameView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtFirstNameView" runat="server" Text='<%# Eval("FirstName") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMiddleNameView" runat="server" controlname="lblMiddleNameView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMiddleNameView" runat="server" Text='<%# Eval("MiddleName") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastNameView" runat="server" controlname="lblLastNameView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtLastNameView" runat="server" Text='<%# Eval("LastName") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSuffixView" runat="server" controlname="lblSuffixView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtSuffixView" runat="server" Text='<%# Eval("Suffix") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblNicknameView" runat="server" controlname="lblNicknameView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtNicknameView" runat="server" Text='<%# Eval("Nickname") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblBirthDateView" runat="server" controlname="lblBirthDateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtBirthDateView" runat="server" Text='<%# Eval("BirthDate") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAgeView" runat="server" controlname="lblAgeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtAgeView" runat="server" Text='<%# Eval("Age") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWeightView" runat="server" controlname="lblWeightView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtWeightView" runat="server" Text='<%# Eval("Weight") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSexView" runat="server" controlname="lblSexView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtSexView" runat="server" Text='<%# Eval("Sex") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblTShirtView" runat="server" controlname="lblTShirtView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtTShirtView" runat="server" Text='<%# Eval("TShirt") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSweatsView" runat="server" controlname="lblSweatsView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtSweatsView" runat="server" Text='<%# Eval("Sweats") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblShortsView" runat="server" controlname="lblShortsView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtShortsView" runat="server" Text='<%# Eval("Shorts") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblShoesView" runat="server" controlname="lblShoesView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtShoesView" runat="server" Text='<%# Eval("Shoes") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblShoeStyleView" runat="server" controlname="lblShoeStyleView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtShoeStyleView" runat="server" Text='<%# Eval("ShoeStyle") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblClubView" runat="server" controlname="lblClubView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtClubView" runat="server" Text='<%# Eval("Club") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAddressView" runat="server" controlname="lblAddressView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtAddressView" runat="server" Text='<%# Eval("Address") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCityView" runat="server" controlname="lblCityView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtCityView" runat="server" Text='<%# Eval("City") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStateView" runat="server" controlname="lblStateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtStateView" runat="server" Text='<%# Eval("State") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblZIPView" runat="server" controlname="lblZIPView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtZIPView" runat="server" Text='<%# Eval("ZIP") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCountryView" runat="server" controlname="lblCountryView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtCountryView" runat="server" Text='<%# Eval("Country") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblHomePhoneView" runat="server" controlname="lblHomePhoneView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtHomePhoneView" runat="server" Text='<%# Eval("HomePhone") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMobilePhoneView" runat="server" controlname="lblMobilePhoneView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMobilePhoneView" runat="server" Text='<%# Eval("MobilePhone") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMobileCarrierView" runat="server" controlname="lblMobileCarrierView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMobileCarrierView" runat="server" Text='<%# Eval("MobileCarrier") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEMailView" runat="server" controlname="lblEMailView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtEMailView" runat="server" Text='<%# Eval("EMail") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPlainTextView" runat="server" controlname="lblPlainTextView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtPlainTextView" runat="server" Text='<%# Eval("PlainText") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUSATFNumberView" runat="server" controlname="lblUSATFNumberView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtUSATFNumberView" runat="server" Text='<%# Eval("USATFNumber") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemberTypeView" runat="server" controlname="lblMemberTypeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMemberTypeView" runat="server" Text='<%# Eval("MemberType") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemberNumberView" runat="server" controlname="lblMemberNumberView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMemberNumberView" runat="server" Text='<%# Eval("MemberNumber") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemberCodeView" runat="server" controlname="lblMemberCodeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMemberCodeView" runat="server" Text='<%# Eval("MemberCode") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDateJoinedView" runat="server" controlname="lblDateJoinedView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtDateJoinedView" runat="server" Text='<%# Eval("DateJoined") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastRenewalView" runat="server" controlname="lblLastRenewalView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtLastRenewalView" runat="server" Text='<%# Eval("LastRenewal") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPaidThruView" runat="server" controlname="lblPaidThruView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtPaidThruView" runat="server" Text='<%# Eval("PaidThru") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWaiverView" runat="server" controlname="lblWaiverView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtWaiverView" runat="server" Text='<%# Eval("Waiver") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPrimaryNoView" runat="server" controlname="lblPrimaryNoView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtPrimaryNoView" runat="server" Text='<%# Eval("PrimaryNo") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSurvivorView" runat="server" controlname="lblSurvivorView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtSurvivorView" runat="server" Text='<%# Eval("Survivor") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMailingExpirationView" runat="server" controlname="lblMailingExpirationView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMailingExpirationView" runat="server" Text='<%# Eval("MailingExpiration") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemoView" runat="server" controlname="lblMemoView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMemoView" runat="server" Text='<%# Eval("Memo") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMarkedView" runat="server" controlname="lblMarkedView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMarkedView" runat="server" Text='<%# Eval("Marked") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblKeywordsView" runat="server" controlname="lblKeywordsView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtKeywordsView" runat="server" Text='<%# Eval("Keywords") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCompanyView" runat="server" controlname="lblCompanyView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtCompanyView" runat="server" Text='<%# Eval("Company") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblTitleView" runat="server" controlname="lblTitleView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtTitleView" runat="server" Text='<%# Eval("Title") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkAddressView" runat="server" controlname="lblWorkAddressView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtWorkAddressView" runat="server" Text='<%# Eval("WorkAddress") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkCityView" runat="server" controlname="lblWorkCityView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtWorkCityView" runat="server" Text='<%# Eval("WorkCity") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkStateView" runat="server" controlname="lblWorkStateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtWorkStateView" runat="server" Text='<%# Eval("WorkState") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkZipView" runat="server" controlname="lblWorkZipView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtWorkZipView" runat="server" Text='<%# Eval("WorkZip") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkCountryView" runat="server" controlname="lblWorkCountryView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtWorkCountryView" runat="server" Text='<%# Eval("WorkCountry") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkPhoneView" runat="server" controlname="lblWorkPhoneView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtWorkPhoneView" runat="server" Text='<%# Eval("WorkPhone") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWorkEmailView" runat="server" controlname="lblWorkEmailView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtWorkEmailView" runat="server" Text='<%# Eval("WorkEmail") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblActiveIdView" runat="server" controlname="lblActiveIdView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtActiveIdView" runat="server" Text='<%# Eval("ActiveId") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInvalidEmailView" runat="server" controlname="lblInvalidEmailView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtInvalidEmailView" runat="server" Text='<%# Eval("InvalidEmail") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblResultsEmailOnlyView" runat="server" controlname="lblResultsEmailOnlyView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtResultsEmailOnlyView" runat="server" Text='<%# Eval("ResultsEmailOnly") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInvalidAddressView" runat="server" controlname="lblInvalidAddressView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtInvalidAddressView" runat="server" Text='<%# Eval("InvalidAddress") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUserNameView" runat="server" controlname="lblUserNameView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtUserNameView" runat="server" Text='<%# Eval("UserName") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPasswordView" runat="server" controlname="lblPasswordView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtPasswordView" runat="server" Text='<%# Eval("Password") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInsertionDateView" runat="server" controlname="lblInsertionDateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtInsertionDateView" runat="server" Text='<%# Eval("InsertionDate") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUpdateDateView" runat="server" controlname="lblUpdateDateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtUpdateDateView" runat="server" Text='<%# Eval("UpdateDate") %>' /></td>
        </tr>
       </table> 
         <p>
			 <asp:LinkButton ID="EditEntrantsItemButton" runat="server" 
                 CausesValidation="True" CommandName="Edit" Enabled="<%# IsEditable %>"  Visible="<%# IsEditable %>"
                 Text="Edit" OnClick="EditEntrantsItemButton_Click">
             </asp:LinkButton>&nbsp;
         </p>
    </ItemTemplate>
	<EmptyDataTemplate>
        There are no Entrants Records
    </EmptyDataTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="EntrantsDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.EntrantsInfo"
    DeleteMethod="DeleteEntrants" 
    InsertMethod="AddEntrants" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetEntrants" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateEntrants"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="00" Name="RunnerId" QueryStringField="RunnerId" Type="Int32" />
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
