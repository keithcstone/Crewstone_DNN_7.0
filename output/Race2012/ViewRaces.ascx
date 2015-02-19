<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ViewRaces.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ViewRaces" %>
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
				<asp:ListItem Value="EventType">EventType</asp:ListItem>
				<asp:ListItem Value="RaceName">RaceName</asp:ListItem>
				<asp:ListItem Value="RaceDate">RaceDate</asp:ListItem>
				<asp:ListItem Value="RaceDistance">RaceDistance</asp:ListItem>
				<asp:ListItem Value="RaceLocation">RaceLocation</asp:ListItem>
				<asp:ListItem Value="RaceCity">RaceCity</asp:ListItem>
				<asp:ListItem Value="RaceState">RaceState</asp:ListItem>
				<asp:ListItem Value="RaceCountry">RaceCountry</asp:ListItem>
				<asp:ListItem Value="RaceLogo">RaceLogo</asp:ListItem>
				<asp:ListItem Value="USATFNumber">USATFNumber</asp:ListItem>
				<asp:ListItem Value="RodaleEventId">RodaleEventId</asp:ListItem>
				<asp:ListItem Value="ActiveEventId">ActiveEventId</asp:ListItem>
				<asp:ListItem Value="PreregistrationDate">PreregistrationDate</asp:ListItem>
				<asp:ListItem Value="PreregistrationFee">PreregistrationFee</asp:ListItem>
				<asp:ListItem Value="RaceDayFee">RaceDayFee</asp:ListItem>
				<asp:ListItem Value="RegistrationURL">RegistrationURL</asp:ListItem>
				<asp:ListItem Value="RegistrationLogo">RegistrationLogo</asp:ListItem>
				<asp:ListItem Value="Description">Description</asp:ListItem>
				<asp:ListItem Value="EmailText">EmailText</asp:ListItem>
				<asp:ListItem Value="ResultsText">ResultsText</asp:ListItem>
				<asp:ListItem Value="ResultsURL">ResultsURL</asp:ListItem>
				<asp:ListItem Value="Annual">Annual</asp:ListItem>
				<asp:ListItem Value="Keyword">Keyword</asp:ListItem>
				<asp:ListItem Value="LastBibNumber">LastBibNumber</asp:ListItem>
				<asp:ListItem Value="ContactName">ContactName</asp:ListItem>
				<asp:ListItem Value="ContactAddress1">ContactAddress1</asp:ListItem>
				<asp:ListItem Value="ContactAddress2">ContactAddress2</asp:ListItem>
				<asp:ListItem Value="ContactCity">ContactCity</asp:ListItem>
				<asp:ListItem Value="ContactState">ContactState</asp:ListItem>
				<asp:ListItem Value="ContactZIP">ContactZIP</asp:ListItem>
				<asp:ListItem Value="ContactPhoneNumber">ContactPhoneNumber</asp:ListItem>
				<asp:ListItem Value="ContactFAX">ContactFAX</asp:ListItem>
				<asp:ListItem Value="ContactEMail">ContactEMail</asp:ListItem>
				<asp:ListItem Value="WEBSite">WEBSite</asp:ListItem>
				<asp:ListItem Value="RelatedRace">RelatedRace</asp:ListItem>
				<asp:ListItem Value="Organization">Organization</asp:ListItem>
				<asp:ListItem Value="VolunteerContact">VolunteerContact</asp:ListItem>
				<asp:ListItem Value="VolunteerPhone">VolunteerPhone</asp:ListItem>
				<asp:ListItem Value="VolunteerEmail">VolunteerEmail</asp:ListItem>
				<asp:ListItem Value="DisplayStartDate">DisplayStartDate</asp:ListItem>
				<asp:ListItem Value="DisplayEndDate">DisplayEndDate</asp:ListItem>
				<asp:ListItem Value="InsertionDate">InsertionDate</asp:ListItem>
				<asp:ListItem Value="ModificationDate">ModificationDate</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<br />
<asp:Button ID="AddRacesItemButton" runat="server" EnableViewState="False">Add Races</asp:Button>
<br /><br /><asp:label id="lblStatus" runat="server" /><br /><br />
<asp:FormView ID="FormRaces" runat="server" 
	DataKeyNames="raceId" 
	DataSourceID="RacesDataSource"
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
        <td class="SubHead"><dnn:label id="lblEventTypeEdit" runat="server" controlname="lblEventType" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEventType" runat="server" Text='<%# Bind("EventType") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comEventType" CssClass="NormalRed" runat="server" resourcekey="valEventType.ErrorMessage" ControlToValidate="txtEventType" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceNameEdit" runat="server" controlname="lblRaceName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceName" runat="server" Text='<%# Bind("RaceName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceDateEdit" runat="server" controlname="lblRaceDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceDate" runat="server" Text='<%# Bind("RaceDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comRaceDate" CssClass="NormalRed" runat="server" resourcekey="valRaceDate.ErrorMessage" ControlToValidate="txtRaceDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceDistanceEdit" runat="server" controlname="lblRaceDistance" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceDistance" runat="server" Text='<%# Bind("RaceDistance") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceLocationEdit" runat="server" controlname="lblRaceLocation" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceLocation" runat="server" Text='<%# Bind("RaceLocation") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceCityEdit" runat="server" controlname="lblRaceCity" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceCity" runat="server" Text='<%# Bind("RaceCity") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceStateEdit" runat="server" controlname="lblRaceState" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceState" runat="server" Text='<%# Bind("RaceState") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceCountryEdit" runat="server" controlname="lblRaceCountry" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceCountry" runat="server" Text='<%# Bind("RaceCountry") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceLogoEdit" runat="server" controlname="lblRaceLogo" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceLogo" runat="server" Text='<%# Bind("RaceLogo") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUSATFNumberEdit" runat="server" controlname="lblUSATFNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtUSATFNumber" runat="server" Text='<%# Bind("USATFNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRodaleEventIdEdit" runat="server" controlname="lblRodaleEventId" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRodaleEventId" runat="server" Text='<%# Bind("RodaleEventId") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comRodaleEventId" CssClass="NormalRed" runat="server" resourcekey="valRodaleEventId.ErrorMessage" ControlToValidate="txtRodaleEventId" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblActiveEventIdEdit" runat="server" controlname="lblActiveEventId" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtActiveEventId" runat="server" Text='<%# Bind("ActiveEventId") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comActiveEventId" CssClass="NormalRed" runat="server" resourcekey="valActiveEventId.ErrorMessage" ControlToValidate="txtActiveEventId" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPreregistrationDateEdit" runat="server" controlname="lblPreregistrationDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPreregistrationDate" runat="server" Text='<%# Bind("PreregistrationDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comPreregistrationDate" CssClass="NormalRed" runat="server" resourcekey="valPreregistrationDate.ErrorMessage" ControlToValidate="txtPreregistrationDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPreregistrationFeeEdit" runat="server" controlname="lblPreregistrationFee" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPreregistrationFee" runat="server" Text='<%# Bind("PreregistrationFee") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceDayFeeEdit" runat="server" controlname="lblRaceDayFee" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceDayFee" runat="server" Text='<%# Bind("RaceDayFee") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRegistrationURLEdit" runat="server" controlname="lblRegistrationURL" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRegistrationURL" runat="server" Text='<%# Bind("RegistrationURL") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRegistrationLogoEdit" runat="server" controlname="lblRegistrationLogo" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRegistrationLogo" runat="server" Text='<%# Bind("RegistrationLogo") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDescriptionEdit" runat="server" controlname="lblDescription" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEmailTextEdit" runat="server" controlname="lblEmailText" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEmailText" runat="server" Text='<%# Bind("EmailText") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblResultsTextEdit" runat="server" controlname="lblResultsText" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtResultsText" runat="server" Text='<%# Bind("ResultsText") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblResultsURLEdit" runat="server" controlname="lblResultsURL" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtResultsURL" runat="server" Text='<%# Bind("ResultsURL") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAnnualEdit" runat="server" controlname="lblAnnual" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAnnual" runat="server" Text='<%# Bind("Annual") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comAnnual" CssClass="NormalRed" runat="server" resourcekey="valAnnual.ErrorMessage" ControlToValidate="txtAnnual" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblKeywordEdit" runat="server" controlname="lblKeyword" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtKeyword" runat="server" Text='<%# Bind("Keyword") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastBibNumberEdit" runat="server" controlname="lblLastBibNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtLastBibNumber" runat="server" Text='<%# Bind("LastBibNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactNameEdit" runat="server" controlname="lblContactName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactName" runat="server" Text='<%# Bind("ContactName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactAddress1Edit" runat="server" controlname="lblContactAddress1" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactAddress1" runat="server" Text='<%# Bind("ContactAddress1") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactAddress2Edit" runat="server" controlname="lblContactAddress2" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactAddress2" runat="server" Text='<%# Bind("ContactAddress2") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactCityEdit" runat="server" controlname="lblContactCity" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactCity" runat="server" Text='<%# Bind("ContactCity") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactStateEdit" runat="server" controlname="lblContactState" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactState" runat="server" Text='<%# Bind("ContactState") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactZIPEdit" runat="server" controlname="lblContactZIP" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactZIP" runat="server" Text='<%# Bind("ContactZIP") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactPhoneNumberEdit" runat="server" controlname="lblContactPhoneNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactPhoneNumber" runat="server" Text='<%# Bind("ContactPhoneNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactFAXEdit" runat="server" controlname="lblContactFAX" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactFAX" runat="server" Text='<%# Bind("ContactFAX") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactEMailEdit" runat="server" controlname="lblContactEMail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactEMail" runat="server" Text='<%# Bind("ContactEMail") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWEBSiteEdit" runat="server" controlname="lblWEBSite" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWEBSite" runat="server" Text='<%# Bind("WEBSite") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRelatedRaceEdit" runat="server" controlname="lblRelatedRace" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRelatedRace" runat="server" Text='<%# Bind("RelatedRace") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comRelatedRace" CssClass="NormalRed" runat="server" resourcekey="valRelatedRace.ErrorMessage" ControlToValidate="txtRelatedRace" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOrganizationEdit" runat="server" controlname="lblOrganization" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtOrganization" runat="server" Text='<%# Bind("Organization") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comOrganization" CssClass="NormalRed" runat="server" resourcekey="valOrganization.ErrorMessage" ControlToValidate="txtOrganization" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblVolunteerContactEdit" runat="server" controlname="lblVolunteerContact" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtVolunteerContact" runat="server" Text='<%# Bind("VolunteerContact") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblVolunteerPhoneEdit" runat="server" controlname="lblVolunteerPhone" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtVolunteerPhone" runat="server" Text='<%# Bind("VolunteerPhone") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblVolunteerEmailEdit" runat="server" controlname="lblVolunteerEmail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtVolunteerEmail" runat="server" Text='<%# Bind("VolunteerEmail") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDisplayStartDateEdit" runat="server" controlname="lblDisplayStartDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDisplayStartDate" runat="server" Text='<%# Bind("DisplayStartDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDisplayStartDate" CssClass="NormalRed" runat="server" resourcekey="valDisplayStartDate.ErrorMessage" ControlToValidate="txtDisplayStartDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDisplayEndDateEdit" runat="server" controlname="lblDisplayEndDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDisplayEndDate" runat="server" Text='<%# Bind("DisplayEndDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDisplayEndDate" CssClass="NormalRed" runat="server" resourcekey="valDisplayEndDate.ErrorMessage" ControlToValidate="txtDisplayEndDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInsertionDateEdit" runat="server" controlname="lblInsertionDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtInsertionDate" runat="server" Text='<%# Bind("InsertionDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comInsertionDate" CssClass="NormalRed" runat="server" resourcekey="valInsertionDate.ErrorMessage" ControlToValidate="txtInsertionDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblModificationDateEdit" runat="server" controlname="lblModificationDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtModificationDate" runat="server" Text='<%# Bind("ModificationDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comModificationDate" CssClass="NormalRed" runat="server" resourcekey="valModificationDate.ErrorMessage" ControlToValidate="txtModificationDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="UpdateRacesItemButton" runat="server" 
                 CausesValidation="True" CommandName="Update"
                 Text="Save" OnClick="UpdateRacesItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="UpdateRacesCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="UpdateRacesCancelButton_Click">
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
        <td class="SubHead"><dnn:label id="lblEventType" runat="server" controlname="lblEventType" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEventType" runat="server" Text='<%# Bind("EventType") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comEventType" CssClass="NormalRed" runat="server" resourcekey="valEventType.ErrorMessage" ControlToValidate="txtEventType" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceName" runat="server" controlname="lblRaceName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceName" runat="server" Text='<%# Bind("RaceName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceDate" runat="server" controlname="lblRaceDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceDate" runat="server" Text='<%# Bind("RaceDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comRaceDate" CssClass="NormalRed" runat="server" resourcekey="valRaceDate.ErrorMessage" ControlToValidate="txtRaceDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceDistance" runat="server" controlname="lblRaceDistance" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceDistance" runat="server" Text='<%# Bind("RaceDistance") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceLocation" runat="server" controlname="lblRaceLocation" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceLocation" runat="server" Text='<%# Bind("RaceLocation") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceCity" runat="server" controlname="lblRaceCity" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceCity" runat="server" Text='<%# Bind("RaceCity") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceState" runat="server" controlname="lblRaceState" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceState" runat="server" Text='<%# Bind("RaceState") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceCountry" runat="server" controlname="lblRaceCountry" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceCountry" runat="server" Text='<%# Bind("RaceCountry") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceLogo" runat="server" controlname="lblRaceLogo" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceLogo" runat="server" Text='<%# Bind("RaceLogo") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUSATFNumber" runat="server" controlname="lblUSATFNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtUSATFNumber" runat="server" Text='<%# Bind("USATFNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRodaleEventId" runat="server" controlname="lblRodaleEventId" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRodaleEventId" runat="server" Text='<%# Bind("RodaleEventId") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comRodaleEventId" CssClass="NormalRed" runat="server" resourcekey="valRodaleEventId.ErrorMessage" ControlToValidate="txtRodaleEventId" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblActiveEventId" runat="server" controlname="lblActiveEventId" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtActiveEventId" runat="server" Text='<%# Bind("ActiveEventId") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comActiveEventId" CssClass="NormalRed" runat="server" resourcekey="valActiveEventId.ErrorMessage" ControlToValidate="txtActiveEventId" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPreregistrationDate" runat="server" controlname="lblPreregistrationDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPreregistrationDate" runat="server" Text='<%# Bind("PreregistrationDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comPreregistrationDate" CssClass="NormalRed" runat="server" resourcekey="valPreregistrationDate.ErrorMessage" ControlToValidate="txtPreregistrationDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPreregistrationFee" runat="server" controlname="lblPreregistrationFee" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPreregistrationFee" runat="server" Text='<%# Bind("PreregistrationFee") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceDayFee" runat="server" controlname="lblRaceDayFee" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRaceDayFee" runat="server" Text='<%# Bind("RaceDayFee") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRegistrationURL" runat="server" controlname="lblRegistrationURL" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRegistrationURL" runat="server" Text='<%# Bind("RegistrationURL") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRegistrationLogo" runat="server" controlname="lblRegistrationLogo" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRegistrationLogo" runat="server" Text='<%# Bind("RegistrationLogo") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDescription" runat="server" controlname="lblDescription" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEmailText" runat="server" controlname="lblEmailText" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEmailText" runat="server" Text='<%# Bind("EmailText") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblResultsText" runat="server" controlname="lblResultsText" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtResultsText" runat="server" Text='<%# Bind("ResultsText") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblResultsURL" runat="server" controlname="lblResultsURL" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtResultsURL" runat="server" Text='<%# Bind("ResultsURL") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAnnual" runat="server" controlname="lblAnnual" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAnnual" runat="server" Text='<%# Bind("Annual") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comAnnual" CssClass="NormalRed" runat="server" resourcekey="valAnnual.ErrorMessage" ControlToValidate="txtAnnual" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblKeyword" runat="server" controlname="lblKeyword" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtKeyword" runat="server" Text='<%# Bind("Keyword") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastBibNumber" runat="server" controlname="lblLastBibNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtLastBibNumber" runat="server" Text='<%# Bind("LastBibNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactName" runat="server" controlname="lblContactName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactName" runat="server" Text='<%# Bind("ContactName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactAddress1" runat="server" controlname="lblContactAddress1" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactAddress1" runat="server" Text='<%# Bind("ContactAddress1") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactAddress2" runat="server" controlname="lblContactAddress2" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactAddress2" runat="server" Text='<%# Bind("ContactAddress2") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactCity" runat="server" controlname="lblContactCity" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactCity" runat="server" Text='<%# Bind("ContactCity") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactState" runat="server" controlname="lblContactState" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactState" runat="server" Text='<%# Bind("ContactState") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactZIP" runat="server" controlname="lblContactZIP" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactZIP" runat="server" Text='<%# Bind("ContactZIP") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactPhoneNumber" runat="server" controlname="lblContactPhoneNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactPhoneNumber" runat="server" Text='<%# Bind("ContactPhoneNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactFAX" runat="server" controlname="lblContactFAX" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactFAX" runat="server" Text='<%# Bind("ContactFAX") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactEMail" runat="server" controlname="lblContactEMail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtContactEMail" runat="server" Text='<%# Bind("ContactEMail") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWEBSite" runat="server" controlname="lblWEBSite" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWEBSite" runat="server" Text='<%# Bind("WEBSite") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRelatedRace" runat="server" controlname="lblRelatedRace" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtRelatedRace" runat="server" Text='<%# Bind("RelatedRace") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comRelatedRace" CssClass="NormalRed" runat="server" resourcekey="valRelatedRace.ErrorMessage" ControlToValidate="txtRelatedRace" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOrganization" runat="server" controlname="lblOrganization" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtOrganization" runat="server" Text='<%# Bind("Organization") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comOrganization" CssClass="NormalRed" runat="server" resourcekey="valOrganization.ErrorMessage" ControlToValidate="txtOrganization" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblVolunteerContact" runat="server" controlname="lblVolunteerContact" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtVolunteerContact" runat="server" Text='<%# Bind("VolunteerContact") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblVolunteerPhone" runat="server" controlname="lblVolunteerPhone" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtVolunteerPhone" runat="server" Text='<%# Bind("VolunteerPhone") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblVolunteerEmail" runat="server" controlname="lblVolunteerEmail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtVolunteerEmail" runat="server" Text='<%# Bind("VolunteerEmail") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDisplayStartDate" runat="server" controlname="lblDisplayStartDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDisplayStartDate" runat="server" Text='<%# Bind("DisplayStartDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDisplayStartDate" CssClass="NormalRed" runat="server" resourcekey="valDisplayStartDate.ErrorMessage" ControlToValidate="txtDisplayStartDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDisplayEndDate" runat="server" controlname="lblDisplayEndDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDisplayEndDate" runat="server" Text='<%# Bind("DisplayEndDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDisplayEndDate" CssClass="NormalRed" runat="server" resourcekey="valDisplayEndDate.ErrorMessage" ControlToValidate="txtDisplayEndDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInsertionDate" runat="server" controlname="lblInsertionDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtInsertionDate" runat="server" Text='<%# Bind("InsertionDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comInsertionDate" CssClass="NormalRed" runat="server" resourcekey="valInsertionDate.ErrorMessage" ControlToValidate="txtInsertionDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblModificationDate" runat="server" controlname="lblModificationDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtModificationDate" runat="server" Text='<%# Bind("ModificationDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comModificationDate" CssClass="NormalRed" runat="server" resourcekey="valModificationDate.ErrorMessage" ControlToValidate="txtModificationDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertRacesItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Save" OnClick="InsertRacesItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertRacesCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertRacesCancelButton_Click">
             </asp:LinkButton>
         </p>
    </InsertItemTemplate>
    <ItemTemplate>
	<table>
        <tr><td></td>
		<td><asp:TextBox ID="txtPortalIdView" runat="server" Text='<%# Bind("PortalId") %>' Visible="False"></asp:TextBox></td>
		</tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEventTypeView" runat="server" controlname="lblEventTypeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtEventTypeView" runat="server" Text='<%# Eval("EventType") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceNameView" runat="server" controlname="lblRaceNameView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRaceNameView" runat="server" Text='<%# Eval("RaceName") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceDateView" runat="server" controlname="lblRaceDateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRaceDateView" runat="server" Text='<%# Eval("RaceDate") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceDistanceView" runat="server" controlname="lblRaceDistanceView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRaceDistanceView" runat="server" Text='<%# Eval("RaceDistance") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceLocationView" runat="server" controlname="lblRaceLocationView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRaceLocationView" runat="server" Text='<%# Eval("RaceLocation") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceCityView" runat="server" controlname="lblRaceCityView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRaceCityView" runat="server" Text='<%# Eval("RaceCity") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceStateView" runat="server" controlname="lblRaceStateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRaceStateView" runat="server" Text='<%# Eval("RaceState") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceCountryView" runat="server" controlname="lblRaceCountryView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRaceCountryView" runat="server" Text='<%# Eval("RaceCountry") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceLogoView" runat="server" controlname="lblRaceLogoView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRaceLogoView" runat="server" Text='<%# Eval("RaceLogo") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUSATFNumberView" runat="server" controlname="lblUSATFNumberView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtUSATFNumberView" runat="server" Text='<%# Eval("USATFNumber") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRodaleEventIdView" runat="server" controlname="lblRodaleEventIdView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRodaleEventIdView" runat="server" Text='<%# Eval("RodaleEventId") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblActiveEventIdView" runat="server" controlname="lblActiveEventIdView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtActiveEventIdView" runat="server" Text='<%# Eval("ActiveEventId") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPreregistrationDateView" runat="server" controlname="lblPreregistrationDateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtPreregistrationDateView" runat="server" Text='<%# Eval("PreregistrationDate") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPreregistrationFeeView" runat="server" controlname="lblPreregistrationFeeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtPreregistrationFeeView" runat="server" Text='<%# Eval("PreregistrationFee") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRaceDayFeeView" runat="server" controlname="lblRaceDayFeeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRaceDayFeeView" runat="server" Text='<%# Eval("RaceDayFee") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRegistrationURLView" runat="server" controlname="lblRegistrationURLView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRegistrationURLView" runat="server" Text='<%# Eval("RegistrationURL") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRegistrationLogoView" runat="server" controlname="lblRegistrationLogoView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRegistrationLogoView" runat="server" Text='<%# Eval("RegistrationLogo") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDescriptionView" runat="server" controlname="lblDescriptionView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtDescriptionView" runat="server" Text='<%# Eval("Description") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEmailTextView" runat="server" controlname="lblEmailTextView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtEmailTextView" runat="server" Text='<%# Eval("EmailText") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblResultsTextView" runat="server" controlname="lblResultsTextView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtResultsTextView" runat="server" Text='<%# Eval("ResultsText") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblResultsURLView" runat="server" controlname="lblResultsURLView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtResultsURLView" runat="server" Text='<%# Eval("ResultsURL") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAnnualView" runat="server" controlname="lblAnnualView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtAnnualView" runat="server" Text='<%# Eval("Annual") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblKeywordView" runat="server" controlname="lblKeywordView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtKeywordView" runat="server" Text='<%# Eval("Keyword") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastBibNumberView" runat="server" controlname="lblLastBibNumberView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtLastBibNumberView" runat="server" Text='<%# Eval("LastBibNumber") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactNameView" runat="server" controlname="lblContactNameView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtContactNameView" runat="server" Text='<%# Eval("ContactName") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactAddress1View" runat="server" controlname="lblContactAddress1View" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtContactAddress1View" runat="server" Text='<%# Eval("ContactAddress1") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactAddress2View" runat="server" controlname="lblContactAddress2View" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtContactAddress2View" runat="server" Text='<%# Eval("ContactAddress2") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactCityView" runat="server" controlname="lblContactCityView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtContactCityView" runat="server" Text='<%# Eval("ContactCity") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactStateView" runat="server" controlname="lblContactStateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtContactStateView" runat="server" Text='<%# Eval("ContactState") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactZIPView" runat="server" controlname="lblContactZIPView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtContactZIPView" runat="server" Text='<%# Eval("ContactZIP") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactPhoneNumberView" runat="server" controlname="lblContactPhoneNumberView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtContactPhoneNumberView" runat="server" Text='<%# Eval("ContactPhoneNumber") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactFAXView" runat="server" controlname="lblContactFAXView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtContactFAXView" runat="server" Text='<%# Eval("ContactFAX") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblContactEMailView" runat="server" controlname="lblContactEMailView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtContactEMailView" runat="server" Text='<%# Eval("ContactEMail") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWEBSiteView" runat="server" controlname="lblWEBSiteView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtWEBSiteView" runat="server" Text='<%# Eval("WEBSite") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblRelatedRaceView" runat="server" controlname="lblRelatedRaceView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtRelatedRaceView" runat="server" Text='<%# Eval("RelatedRace") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOrganizationView" runat="server" controlname="lblOrganizationView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtOrganizationView" runat="server" Text='<%# Eval("Organization") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblVolunteerContactView" runat="server" controlname="lblVolunteerContactView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtVolunteerContactView" runat="server" Text='<%# Eval("VolunteerContact") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblVolunteerPhoneView" runat="server" controlname="lblVolunteerPhoneView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtVolunteerPhoneView" runat="server" Text='<%# Eval("VolunteerPhone") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblVolunteerEmailView" runat="server" controlname="lblVolunteerEmailView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtVolunteerEmailView" runat="server" Text='<%# Eval("VolunteerEmail") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDisplayStartDateView" runat="server" controlname="lblDisplayStartDateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtDisplayStartDateView" runat="server" Text='<%# Eval("DisplayStartDate") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDisplayEndDateView" runat="server" controlname="lblDisplayEndDateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtDisplayEndDateView" runat="server" Text='<%# Eval("DisplayEndDate") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblInsertionDateView" runat="server" controlname="lblInsertionDateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtInsertionDateView" runat="server" Text='<%# Eval("InsertionDate") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblModificationDateView" runat="server" controlname="lblModificationDateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtModificationDateView" runat="server" Text='<%# Eval("ModificationDate") %>' /></td>
        </tr>
       </table> 
         <p>
			 <asp:LinkButton ID="EditRacesItemButton" runat="server" 
                 CausesValidation="True" CommandName="Edit" Enabled="<%# IsEditable %>"  Visible="<%# IsEditable %>"
                 Text="Edit" OnClick="EditRacesItemButton_Click">
             </asp:LinkButton>&nbsp;
         </p>
    </ItemTemplate>
	<EmptyDataTemplate>
        There are no Races Records
    </EmptyDataTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="RacesDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.RacesInfo"
    DeleteMethod="DeleteRaces" 
    InsertMethod="AddRaces" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetRaces" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateRaces"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="00" Name="RaceId" QueryStringField="RaceId" Type="Int32" />
	</SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="RaceId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EventType" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceDistance" Type="Single" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceLocation" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceCity" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceState" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceCountry" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceLogo" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="USATFNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RodaleEventId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ActiveEventId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PreregistrationDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PreregistrationFee" Type="decimal" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceDayFee" Type="decimal" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RegistrationURL" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RegistrationLogo" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EmailText" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ResultsText" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ResultsURL" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Annual" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Keyword" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastBibNumber" Type="double" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactAddress1" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactAddress2" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactCity" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactState" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactZIP" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactPhoneNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactFAX" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactEMail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WEBSite" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RelatedRace" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Organization" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="VolunteerContact" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="VolunteerPhone" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="VolunteerEmail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DisplayStartDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DisplayEndDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="InsertionDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ModificationDate" Type="DateTime" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="RaceId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EventType" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceDistance" Type="Single" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceLocation" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceCity" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceState" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceCountry" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceLogo" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="USATFNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RodaleEventId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ActiveEventId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PreregistrationDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PreregistrationFee" Type="decimal" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceDayFee" Type="decimal" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RegistrationURL" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RegistrationLogo" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EmailText" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ResultsText" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ResultsURL" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Annual" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Keyword" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastBibNumber" Type="double" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactAddress1" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactAddress2" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactCity" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactState" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactZIP" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactPhoneNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactFAX" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ContactEMail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WEBSite" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RelatedRace" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Organization" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="VolunteerContact" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="VolunteerPhone" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="VolunteerEmail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DisplayStartDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DisplayEndDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="InsertionDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ModificationDate" Type="DateTime" ConvertEmptyStringToNull="true" />
	</UpdateParameters>
</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
