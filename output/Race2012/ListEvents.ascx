<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ListEvents.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ListEvents" %>
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
				<asp:ListItem Value="BibNumber">BibNumber</asp:ListItem>
				<asp:ListItem Value="Division">Division</asp:ListItem>
				<asp:ListItem Value="DivisionPlace">DivisionPlace</asp:ListItem>
				<asp:ListItem Value="DivisionTotal">DivisionTotal</asp:ListItem>
				<asp:ListItem Value="SexPlace">SexPlace</asp:ListItem>
				<asp:ListItem Value="SexTotal">SexTotal</asp:ListItem>
				<asp:ListItem Value="GunTime">GunTime</asp:ListItem>
				<asp:ListItem Value="NetTime">NetTime</asp:ListItem>
				<asp:ListItem Value="Pace">Pace</asp:ListItem>
				<asp:ListItem Value="Place">Place</asp:ListItem>
				<asp:ListItem Value="Seed">Seed</asp:ListItem>
				<asp:ListItem Value="Team">Team</asp:ListItem>
				<asp:ListItem Value="Fee">Fee</asp:ListItem>
				<asp:ListItem Value="EntryDate">EntryDate</asp:ListItem>
				<asp:ListItem Value="Clydesdale">Clydesdale</asp:ListItem>
				<asp:ListItem Value="Survivor">Survivor</asp:ListItem>
				<asp:ListItem Value="NonCompetitive">NonCompetitive</asp:ListItem>
				<asp:ListItem Value="USATF">USATF</asp:ListItem>
				<asp:ListItem Value="Age">Age</asp:ListItem>
				<asp:ListItem Value="Sex">Sex</asp:ListItem>
				<asp:ListItem Value="Weight">Weight</asp:ListItem>
				<asp:ListItem Value="Heat">Heat</asp:ListItem>
				<asp:ListItem Value="WaveOffset">WaveOffset</asp:ListItem>
				<asp:ListItem Value="WAVATime">WAVATime</asp:ListItem>
				<asp:ListItem Value="PerformancePercent">PerformancePercent</asp:ListItem>
				<asp:ListItem Value="SeriesPlace">SeriesPlace</asp:ListItem>
				<asp:ListItem Value="SeriesAge">SeriesAge</asp:ListItem>
				<asp:ListItem Value="SeriesDivision">SeriesDivision</asp:ListItem>
				<asp:ListItem Value="SeriesPoints">SeriesPoints</asp:ListItem>
				<asp:ListItem Value="Confirmation">Confirmation</asp:ListItem>
				<asp:ListItem Value="Results">Results</asp:ListItem>
				<asp:ListItem Value="ChipId">ChipId</asp:ListItem>
				<asp:ListItem Value="AwardDivision">AwardDivision</asp:ListItem>
				<asp:ListItem Value="AwardPlace">AwardPlace</asp:ListItem>
				<asp:ListItem Value="AwardPriority">AwardPriority</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:ListView ID="ListViewEvents" runat="server" 
    DataKeyNames="runnerId, raceId"
    DataSourceID="EventsDataSource"
	ItemPlaceHolderId="EventsContent"
	OnItemDataBound="ListViewEvents_ItemDataBound"
    EnableViewState="False">
    <LayoutTemplate>
		<div id="EventsHeader">
			<h1 id="EventsLogo">Events List</h1>
		</div>
		<div runat="server">
			<table>
				<thead>
					<tr>
        		<th><asp:Label runat="server" id="hdrBibNumber" Text='BibNumber' /></th>
        		<th><asp:Label runat="server" id="hdrDivision" Text='Division' /></th>
        		<th><asp:Label runat="server" id="hdrDivisionPlace" Text='DivisionPlace' /></th>
        		<th><asp:Label runat="server" id="hdrDivisionTotal" Text='DivisionTotal' /></th>
        		<th><asp:Label runat="server" id="hdrSexPlace" Text='SexPlace' /></th>
        		<th><asp:Label runat="server" id="hdrSexTotal" Text='SexTotal' /></th>
        		<th><asp:Label runat="server" id="hdrGunTime" Text='GunTime' /></th>
        		<th><asp:Label runat="server" id="hdrNetTime" Text='NetTime' /></th>
        		<th><asp:Label runat="server" id="hdrPace" Text='Pace' /></th>
        		<th><asp:Label runat="server" id="hdrPlace" Text='Place' /></th>
        		<th><asp:Label runat="server" id="hdrSeed" Text='Seed' /></th>
        		<th><asp:Label runat="server" id="hdrTeam" Text='Team' /></th>
        		<th><asp:Label runat="server" id="hdrFee" Text='Fee' /></th>
        		<th><asp:Label runat="server" id="hdrEntryDate" Text='EntryDate' /></th>
        		<th><asp:Label runat="server" id="hdrClydesdale" Text='Clydesdale' /></th>
        		<th><asp:Label runat="server" id="hdrSurvivor" Text='Survivor' /></th>
        		<th><asp:Label runat="server" id="hdrNonCompetitive" Text='NonCompetitive' /></th>
        		<th><asp:Label runat="server" id="hdrUSATF" Text='USATF' /></th>
        		<th><asp:Label runat="server" id="hdrAge" Text='Age' /></th>
        		<th><asp:Label runat="server" id="hdrSex" Text='Sex' /></th>
        		<th><asp:Label runat="server" id="hdrWeight" Text='Weight' /></th>
        		<th><asp:Label runat="server" id="hdrHeat" Text='Heat' /></th>
        		<th><asp:Label runat="server" id="hdrWaveOffset" Text='WaveOffset' /></th>
        		<th><asp:Label runat="server" id="hdrWAVATime" Text='WAVATime' /></th>
        		<th><asp:Label runat="server" id="hdrPerformancePercent" Text='PerformancePercent' /></th>
        		<th><asp:Label runat="server" id="hdrSeriesPlace" Text='SeriesPlace' /></th>
        		<th><asp:Label runat="server" id="hdrSeriesAge" Text='SeriesAge' /></th>
        		<th><asp:Label runat="server" id="hdrSeriesDivision" Text='SeriesDivision' /></th>
        		<th><asp:Label runat="server" id="hdrSeriesPoints" Text='SeriesPoints' /></th>
        		<th><asp:Label runat="server" id="hdrConfirmation" Text='Confirmation' /></th>
        		<th><asp:Label runat="server" id="hdrResults" Text='Results' /></th>
        		<th><asp:Label runat="server" id="hdrChipId" Text='ChipId' /></th>
        		<th><asp:Label runat="server" id="hdrAwardDivision" Text='AwardDivision' /></th>
        		<th><asp:Label runat="server" id="hdrAwardPlace" Text='AwardPlace' /></th>
        		<th><asp:Label runat="server" id="hdrAwardPriority" Text='AwardPriority' /></th>
					</tr>
				</thead>
				<tbody runat="server" id="EventsContent">
				</tbody>
			</table>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<tr>
        		<td><asp:Label runat="server" id="lblBibNumber" Text='<%# Eval("BibNumber") %>' /></td>
        		<td><asp:Label runat="server" id="lblDivision" Text='<%# Eval("Division") %>' /></td>
        		<td><asp:Label runat="server" id="lblDivisionPlace" Text='<%# Eval("DivisionPlace") %>' /></td>
        		<td><asp:Label runat="server" id="lblDivisionTotal" Text='<%# Eval("DivisionTotal") %>' /></td>
        		<td><asp:Label runat="server" id="lblSexPlace" Text='<%# Eval("SexPlace") %>' /></td>
        		<td><asp:Label runat="server" id="lblSexTotal" Text='<%# Eval("SexTotal") %>' /></td>
        		<td><asp:Label runat="server" id="lblGunTime" Text='<%# Eval("GunTime") %>' /></td>
        		<td><asp:Label runat="server" id="lblNetTime" Text='<%# Eval("NetTime") %>' /></td>
        		<td><asp:Label runat="server" id="lblPace" Text='<%# Eval("Pace") %>' /></td>
        		<td><asp:Label runat="server" id="lblPlace" Text='<%# Eval("Place") %>' /></td>
        		<td><asp:Label runat="server" id="lblSeed" Text='<%# Eval("Seed") %>' /></td>
        		<td><asp:Label runat="server" id="lblTeam" Text='<%# Eval("Team") %>' /></td>
        		<td><asp:Label runat="server" id="lblFee" Text='<%# Eval("Fee") %>' /></td>
        		<td><asp:Label runat="server" id="lblEntryDate" Text='<%# Eval("EntryDate") %>' /></td>
        		<td><asp:Label runat="server" id="lblClydesdale" Text='<%# Eval("Clydesdale") %>' /></td>
        		<td><asp:Label runat="server" id="lblSurvivor" Text='<%# Eval("Survivor") %>' /></td>
        		<td><asp:Label runat="server" id="lblNonCompetitive" Text='<%# Eval("NonCompetitive") %>' /></td>
        		<td><asp:Label runat="server" id="lblUSATF" Text='<%# Eval("USATF") %>' /></td>
        		<td><asp:Label runat="server" id="lblAge" Text='<%# Eval("Age") %>' /></td>
        		<td><asp:Label runat="server" id="lblSex" Text='<%# Eval("Sex") %>' /></td>
        		<td><asp:Label runat="server" id="lblWeight" Text='<%# Eval("Weight") %>' /></td>
        		<td><asp:Label runat="server" id="lblHeat" Text='<%# Eval("Heat") %>' /></td>
        		<td><asp:Label runat="server" id="lblWaveOffset" Text='<%# Eval("WaveOffset") %>' /></td>
        		<td><asp:Label runat="server" id="lblWAVATime" Text='<%# Eval("WAVATime") %>' /></td>
        		<td><asp:Label runat="server" id="lblPerformancePercent" Text='<%# Eval("PerformancePercent") %>' /></td>
        		<td><asp:Label runat="server" id="lblSeriesPlace" Text='<%# Eval("SeriesPlace") %>' /></td>
        		<td><asp:Label runat="server" id="lblSeriesAge" Text='<%# Eval("SeriesAge") %>' /></td>
        		<td><asp:Label runat="server" id="lblSeriesDivision" Text='<%# Eval("SeriesDivision") %>' /></td>
        		<td><asp:Label runat="server" id="lblSeriesPoints" Text='<%# Eval("SeriesPoints") %>' /></td>
        		<td><asp:Label runat="server" id="lblConfirmation" Text='<%# Eval("Confirmation") %>' /></td>
        		<td><asp:Label runat="server" id="lblResults" Text='<%# Eval("Results") %>' /></td>
        		<td><asp:Label runat="server" id="lblChipId" Text='<%# Eval("ChipId") %>' /></td>
        		<td><asp:Label runat="server" id="lblAwardDivision" Text='<%# Eval("AwardDivision") %>' /></td>
        		<td><asp:Label runat="server" id="lblAwardPlace" Text='<%# Eval("AwardPlace") %>' /></td>
        		<td><asp:Label runat="server" id="lblAwardPriority" Text='<%# Eval("AwardPriority") %>' /></td>
		</tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        There are no Events Records
    </EmptyDataTemplate>
</asp:ListView>
<br />

<asp:ObjectDataSource ID="EventsDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.EventsInfo"
    DeleteMethod="DeleteEvents" 
    InsertMethod="AddEvents" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListEventss" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateEvents"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="RunnerId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="BibNumber" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Division" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DivisionPlace" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DivisionTotal" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SexPlace" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SexTotal" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="GunTime" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="NetTime" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Pace" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Place" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Seed" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Team" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Fee" Type="decimal" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EntryDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Clydesdale" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Survivor" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="NonCompetitive" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="USATF" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Age" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sex" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Weight" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Heat" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WaveOffset" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WAVATime" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PerformancePercent" Type="Single" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SeriesPlace" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SeriesAge" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SeriesDivision" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SeriesPoints" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Confirmation" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Results" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ChipId" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="AwardDivision" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="AwardPlace" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="AwardPriority" Type="Int16" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="RunnerId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="RaceId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="BibNumber" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Division" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DivisionPlace" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DivisionTotal" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SexPlace" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SexTotal" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="GunTime" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="NetTime" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Pace" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Place" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Seed" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Team" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Fee" Type="decimal" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EntryDate" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Clydesdale" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Survivor" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="NonCompetitive" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="USATF" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Age" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sex" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Weight" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Heat" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WaveOffset" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="WAVATime" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PerformancePercent" Type="Single" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SeriesPlace" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SeriesAge" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SeriesDivision" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="SeriesPoints" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Confirmation" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Results" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ChipId" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="AwardDivision" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="AwardPlace" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="AwardPriority" Type="Int16" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
