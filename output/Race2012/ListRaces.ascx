<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ListRaces.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ListRaces" %>
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
<asp:ListView ID="ListViewRaces" runat="server" 
    DataKeyNames="raceId"
    DataSourceID="RacesDataSource"
	ItemPlaceHolderId="RacesContent"
	OnItemDataBound="ListViewRaces_ItemDataBound"
    EnableViewState="False">
    <LayoutTemplate>
		<div id="RacesHeader">
			<h1 id="RacesLogo">Races List</h1>
		</div>
		<div runat="server">
			<table>
				<thead>
					<tr>
        		<th><asp:Label runat="server" id="hdrEventType" Text='EventType' /></th>
        		<th><asp:Label runat="server" id="hdrRaceName" Text='RaceName' /></th>
        		<th><asp:Label runat="server" id="hdrRaceDate" Text='RaceDate' /></th>
        		<th><asp:Label runat="server" id="hdrRaceDistance" Text='RaceDistance' /></th>
        		<th><asp:Label runat="server" id="hdrRaceLocation" Text='RaceLocation' /></th>
        		<th><asp:Label runat="server" id="hdrRaceCity" Text='RaceCity' /></th>
        		<th><asp:Label runat="server" id="hdrRaceState" Text='RaceState' /></th>
        		<th><asp:Label runat="server" id="hdrRaceCountry" Text='RaceCountry' /></th>
        		<th><asp:Label runat="server" id="hdrRaceLogo" Text='RaceLogo' /></th>
        		<th><asp:Label runat="server" id="hdrUSATFNumber" Text='USATFNumber' /></th>
        		<th><asp:Label runat="server" id="hdrRodaleEventId" Text='RodaleEventId' /></th>
        		<th><asp:Label runat="server" id="hdrActiveEventId" Text='ActiveEventId' /></th>
        		<th><asp:Label runat="server" id="hdrPreregistrationDate" Text='PreregistrationDate' /></th>
        		<th><asp:Label runat="server" id="hdrPreregistrationFee" Text='PreregistrationFee' /></th>
        		<th><asp:Label runat="server" id="hdrRaceDayFee" Text='RaceDayFee' /></th>
        		<th><asp:Label runat="server" id="hdrRegistrationURL" Text='RegistrationURL' /></th>
        		<th><asp:Label runat="server" id="hdrRegistrationLogo" Text='RegistrationLogo' /></th>
        		<th><asp:Label runat="server" id="hdrDescription" Text='Description' /></th>
        		<th><asp:Label runat="server" id="hdrEmailText" Text='EmailText' /></th>
        		<th><asp:Label runat="server" id="hdrResultsText" Text='ResultsText' /></th>
        		<th><asp:Label runat="server" id="hdrResultsURL" Text='ResultsURL' /></th>
        		<th><asp:Label runat="server" id="hdrAnnual" Text='Annual' /></th>
        		<th><asp:Label runat="server" id="hdrKeyword" Text='Keyword' /></th>
        		<th><asp:Label runat="server" id="hdrLastBibNumber" Text='LastBibNumber' /></th>
        		<th><asp:Label runat="server" id="hdrContactName" Text='ContactName' /></th>
        		<th><asp:Label runat="server" id="hdrContactAddress1" Text='ContactAddress1' /></th>
        		<th><asp:Label runat="server" id="hdrContactAddress2" Text='ContactAddress2' /></th>
        		<th><asp:Label runat="server" id="hdrContactCity" Text='ContactCity' /></th>
        		<th><asp:Label runat="server" id="hdrContactState" Text='ContactState' /></th>
        		<th><asp:Label runat="server" id="hdrContactZIP" Text='ContactZIP' /></th>
        		<th><asp:Label runat="server" id="hdrContactPhoneNumber" Text='ContactPhoneNumber' /></th>
        		<th><asp:Label runat="server" id="hdrContactFAX" Text='ContactFAX' /></th>
        		<th><asp:Label runat="server" id="hdrContactEMail" Text='ContactEMail' /></th>
        		<th><asp:Label runat="server" id="hdrWEBSite" Text='WEBSite' /></th>
        		<th><asp:Label runat="server" id="hdrRelatedRace" Text='RelatedRace' /></th>
        		<th><asp:Label runat="server" id="hdrOrganization" Text='Organization' /></th>
        		<th><asp:Label runat="server" id="hdrVolunteerContact" Text='VolunteerContact' /></th>
        		<th><asp:Label runat="server" id="hdrVolunteerPhone" Text='VolunteerPhone' /></th>
        		<th><asp:Label runat="server" id="hdrVolunteerEmail" Text='VolunteerEmail' /></th>
        		<th><asp:Label runat="server" id="hdrDisplayStartDate" Text='DisplayStartDate' /></th>
        		<th><asp:Label runat="server" id="hdrDisplayEndDate" Text='DisplayEndDate' /></th>
        		<th><asp:Label runat="server" id="hdrInsertionDate" Text='InsertionDate' /></th>
        		<th><asp:Label runat="server" id="hdrModificationDate" Text='ModificationDate' /></th>
					</tr>
				</thead>
				<tbody runat="server" id="RacesContent">
				</tbody>
			</table>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<tr>
        		<td><asp:Label runat="server" id="lblEventType" Text='<%# Eval("EventType") %>' /></td>
        		<td><asp:Label runat="server" id="lblRaceName" Text='<%# Eval("RaceName") %>' /></td>
        		<td><asp:Label runat="server" id="lblRaceDate" Text='<%# Eval("RaceDate") %>' /></td>
        		<td><asp:Label runat="server" id="lblRaceDistance" Text='<%# Eval("RaceDistance") %>' /></td>
        		<td><asp:Label runat="server" id="lblRaceLocation" Text='<%# Eval("RaceLocation") %>' /></td>
        		<td><asp:Label runat="server" id="lblRaceCity" Text='<%# Eval("RaceCity") %>' /></td>
        		<td><asp:Label runat="server" id="lblRaceState" Text='<%# Eval("RaceState") %>' /></td>
        		<td><asp:Label runat="server" id="lblRaceCountry" Text='<%# Eval("RaceCountry") %>' /></td>
        		<td><asp:Label runat="server" id="lblRaceLogo" Text='<%# Eval("RaceLogo") %>' /></td>
        		<td><asp:Label runat="server" id="lblUSATFNumber" Text='<%# Eval("USATFNumber") %>' /></td>
        		<td><asp:Label runat="server" id="lblRodaleEventId" Text='<%# Eval("RodaleEventId") %>' /></td>
        		<td><asp:Label runat="server" id="lblActiveEventId" Text='<%# Eval("ActiveEventId") %>' /></td>
        		<td><asp:Label runat="server" id="lblPreregistrationDate" Text='<%# Eval("PreregistrationDate") %>' /></td>
        		<td><asp:Label runat="server" id="lblPreregistrationFee" Text='<%# Eval("PreregistrationFee") %>' /></td>
        		<td><asp:Label runat="server" id="lblRaceDayFee" Text='<%# Eval("RaceDayFee") %>' /></td>
        		<td><asp:Label runat="server" id="lblRegistrationURL" Text='<%# Eval("RegistrationURL") %>' /></td>
        		<td><asp:Label runat="server" id="lblRegistrationLogo" Text='<%# Eval("RegistrationLogo") %>' /></td>
        		<td><asp:Label runat="server" id="lblDescription" Text='<%# Eval("Description") %>' /></td>
        		<td><asp:Label runat="server" id="lblEmailText" Text='<%# Eval("EmailText") %>' /></td>
        		<td><asp:Label runat="server" id="lblResultsText" Text='<%# Eval("ResultsText") %>' /></td>
        		<td><asp:Label runat="server" id="lblResultsURL" Text='<%# Eval("ResultsURL") %>' /></td>
        		<td><asp:Label runat="server" id="lblAnnual" Text='<%# Eval("Annual") %>' /></td>
        		<td><asp:Label runat="server" id="lblKeyword" Text='<%# Eval("Keyword") %>' /></td>
        		<td><asp:Label runat="server" id="lblLastBibNumber" Text='<%# Eval("LastBibNumber") %>' /></td>
        		<td><asp:Label runat="server" id="lblContactName" Text='<%# Eval("ContactName") %>' /></td>
        		<td><asp:Label runat="server" id="lblContactAddress1" Text='<%# Eval("ContactAddress1") %>' /></td>
        		<td><asp:Label runat="server" id="lblContactAddress2" Text='<%# Eval("ContactAddress2") %>' /></td>
        		<td><asp:Label runat="server" id="lblContactCity" Text='<%# Eval("ContactCity") %>' /></td>
        		<td><asp:Label runat="server" id="lblContactState" Text='<%# Eval("ContactState") %>' /></td>
        		<td><asp:Label runat="server" id="lblContactZIP" Text='<%# Eval("ContactZIP") %>' /></td>
        		<td><asp:Label runat="server" id="lblContactPhoneNumber" Text='<%# Eval("ContactPhoneNumber") %>' /></td>
        		<td><asp:Label runat="server" id="lblContactFAX" Text='<%# Eval("ContactFAX") %>' /></td>
        		<td><asp:Label runat="server" id="lblContactEMail" Text='<%# Eval("ContactEMail") %>' /></td>
        		<td><asp:Label runat="server" id="lblWEBSite" Text='<%# Eval("WEBSite") %>' /></td>
        		<td><asp:Label runat="server" id="lblRelatedRace" Text='<%# Eval("RelatedRace") %>' /></td>
        		<td><asp:Label runat="server" id="lblOrganization" Text='<%# Eval("Organization") %>' /></td>
        		<td><asp:Label runat="server" id="lblVolunteerContact" Text='<%# Eval("VolunteerContact") %>' /></td>
        		<td><asp:Label runat="server" id="lblVolunteerPhone" Text='<%# Eval("VolunteerPhone") %>' /></td>
        		<td><asp:Label runat="server" id="lblVolunteerEmail" Text='<%# Eval("VolunteerEmail") %>' /></td>
        		<td><asp:Label runat="server" id="lblDisplayStartDate" Text='<%# Eval("DisplayStartDate") %>' /></td>
        		<td><asp:Label runat="server" id="lblDisplayEndDate" Text='<%# Eval("DisplayEndDate") %>' /></td>
        		<td><asp:Label runat="server" id="lblInsertionDate" Text='<%# Eval("InsertionDate") %>' /></td>
        		<td><asp:Label runat="server" id="lblModificationDate" Text='<%# Eval("ModificationDate") %>' /></td>
		</tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        There are no Races Records
    </EmptyDataTemplate>
</asp:ListView>
<br />

<asp:ObjectDataSource ID="RacesDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.RacesInfo"
    DeleteMethod="DeleteRaces" 
    InsertMethod="AddRaces" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListRacess" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateRaces"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
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
