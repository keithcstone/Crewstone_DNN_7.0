<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EditEvents.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.EditEvents" %>
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
<asp:GridView ID="GridEvents" runat="server" 
    AllowPaging="True" AutoGenerateColumns="False"
    DataKeyNames="runnerId, raceId"
    DataSourceID="EventsDataSource"
    EnableViewState="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="BibNumber" HeaderText="BibNumber" SortExpression="BibNumber" Visible="True" />
        <asp:BoundField DataField="Division" HeaderText="Division" SortExpression="Division" Visible="True" />
        <asp:BoundField DataField="DivisionPlace" HeaderText="DivisionPlace" SortExpression="DivisionPlace" Visible="True" />
        <asp:BoundField DataField="DivisionTotal" HeaderText="DivisionTotal" SortExpression="DivisionTotal" Visible="True" />
        <asp:BoundField DataField="SexPlace" HeaderText="SexPlace" SortExpression="SexPlace" Visible="True" />
        <asp:BoundField DataField="SexTotal" HeaderText="SexTotal" SortExpression="SexTotal" Visible="True" />
        <asp:BoundField DataField="GunTime" HeaderText="GunTime" SortExpression="GunTime" Visible="True" />
        <asp:BoundField DataField="NetTime" HeaderText="NetTime" SortExpression="NetTime" Visible="True" />
        <asp:BoundField DataField="Pace" HeaderText="Pace" SortExpression="Pace" Visible="True" />
        <asp:BoundField DataField="Place" HeaderText="Place" SortExpression="Place" Visible="True" />
        <asp:BoundField DataField="Seed" HeaderText="Seed" SortExpression="Seed" Visible="True" />
        <asp:BoundField DataField="Team" HeaderText="Team" SortExpression="Team" Visible="True" />
        <asp:BoundField DataField="Fee" HeaderText="Fee" SortExpression="Fee" Visible="True" />
        <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" SortExpression="EntryDate" Visible="True" />
        <asp:BoundField DataField="Clydesdale" HeaderText="Clydesdale" SortExpression="Clydesdale" Visible="True" />
        <asp:BoundField DataField="Survivor" HeaderText="Survivor" SortExpression="Survivor" Visible="True" />
        <asp:BoundField DataField="NonCompetitive" HeaderText="NonCompetitive" SortExpression="NonCompetitive" Visible="True" />
        <asp:BoundField DataField="USATF" HeaderText="USATF" SortExpression="USATF" Visible="True" />
        <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" Visible="True" />
        <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" Visible="True" />
        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" Visible="True" />
        <asp:BoundField DataField="Heat" HeaderText="Heat" SortExpression="Heat" Visible="True" />
        <asp:BoundField DataField="WaveOffset" HeaderText="WaveOffset" SortExpression="WaveOffset" Visible="True" />
        <asp:BoundField DataField="WAVATime" HeaderText="WAVATime" SortExpression="WAVATime" Visible="True" />
        <asp:BoundField DataField="PerformancePercent" HeaderText="PerformancePercent" SortExpression="PerformancePercent" Visible="True" />
        <asp:BoundField DataField="SeriesPlace" HeaderText="SeriesPlace" SortExpression="SeriesPlace" Visible="True" />
        <asp:BoundField DataField="SeriesAge" HeaderText="SeriesAge" SortExpression="SeriesAge" Visible="True" />
        <asp:BoundField DataField="SeriesDivision" HeaderText="SeriesDivision" SortExpression="SeriesDivision" Visible="True" />
        <asp:BoundField DataField="SeriesPoints" HeaderText="SeriesPoints" SortExpression="SeriesPoints" Visible="True" />
        <asp:BoundField DataField="Confirmation" HeaderText="Confirmation" SortExpression="Confirmation" Visible="True" />
        <asp:BoundField DataField="Results" HeaderText="Results" SortExpression="Results" Visible="True" />
        <asp:BoundField DataField="ChipId" HeaderText="ChipId" SortExpression="ChipId" Visible="True" />
        <asp:BoundField DataField="AwardDivision" HeaderText="AwardDivision" SortExpression="AwardDivision" Visible="True" />
        <asp:BoundField DataField="AwardPlace" HeaderText="AwardPlace" SortExpression="AwardPlace" Visible="True" />
        <asp:BoundField DataField="AwardPriority" HeaderText="AwardPriority" SortExpression="AwardPriority" Visible="True" />
    </Columns>
    <EmptyDataTemplate>
        There are no Events Records
    </EmptyDataTemplate>
</asp:GridView>
<br />
<asp:Button ID="AddEventsItemButton" runat="server" EnableViewState="False" Text="Add Events"></asp:Button>
<br /><br />
<asp:FormView ID="FormEvents" runat="server" 
	DataKeyNames="runnerId, raceId" 
	DataSourceID="EventsDataSource"
    DefaultMode="Insert" Visible="False">
    <EditItemTemplate>
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
        <td class="SubHead"><dnn:label id="lblBibNumber" runat="server" controlname="lblBibNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtBibNumber" runat="server" Text='<%# Bind("BibNumber") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comBibNumber" CssClass="NormalRed" runat="server" resourcekey="valBibNumber.ErrorMessage" ControlToValidate="txtBibNumber" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDivision" runat="server" controlname="lblDivision" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDivision" runat="server" Text='<%# Bind("Division") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDivisionPlace" runat="server" controlname="lblDivisionPlace" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDivisionPlace" runat="server" Text='<%# Bind("DivisionPlace") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDivisionPlace" CssClass="NormalRed" runat="server" resourcekey="valDivisionPlace.ErrorMessage" ControlToValidate="txtDivisionPlace" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDivisionTotal" runat="server" controlname="lblDivisionTotal" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDivisionTotal" runat="server" Text='<%# Bind("DivisionTotal") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDivisionTotal" CssClass="NormalRed" runat="server" resourcekey="valDivisionTotal.ErrorMessage" ControlToValidate="txtDivisionTotal" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSexPlace" runat="server" controlname="lblSexPlace" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSexPlace" runat="server" Text='<%# Bind("SexPlace") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comSexPlace" CssClass="NormalRed" runat="server" resourcekey="valSexPlace.ErrorMessage" ControlToValidate="txtSexPlace" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSexTotal" runat="server" controlname="lblSexTotal" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSexTotal" runat="server" Text='<%# Bind("SexTotal") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comSexTotal" CssClass="NormalRed" runat="server" resourcekey="valSexTotal.ErrorMessage" ControlToValidate="txtSexTotal" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblGunTime" runat="server" controlname="lblGunTime" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtGunTime" runat="server" Text='<%# Bind("GunTime") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comGunTime" CssClass="NormalRed" runat="server" resourcekey="valGunTime.ErrorMessage" ControlToValidate="txtGunTime" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblNetTime" runat="server" controlname="lblNetTime" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtNetTime" runat="server" Text='<%# Bind("NetTime") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comNetTime" CssClass="NormalRed" runat="server" resourcekey="valNetTime.ErrorMessage" ControlToValidate="txtNetTime" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPace" runat="server" controlname="lblPace" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPace" runat="server" Text='<%# Bind("Pace") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comPace" CssClass="NormalRed" runat="server" resourcekey="valPace.ErrorMessage" ControlToValidate="txtPace" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPlace" runat="server" controlname="lblPlace" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPlace" runat="server" Text='<%# Bind("Place") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comPlace" CssClass="NormalRed" runat="server" resourcekey="valPlace.ErrorMessage" ControlToValidate="txtPlace" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSeed" runat="server" controlname="lblSeed" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSeed" runat="server" Text='<%# Bind("Seed") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comSeed" CssClass="NormalRed" runat="server" resourcekey="valSeed.ErrorMessage" ControlToValidate="txtSeed" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblTeam" runat="server" controlname="lblTeam" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtTeam" runat="server" Text='<%# Bind("Team") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblFee" runat="server" controlname="lblFee" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtFee" runat="server" Text='<%# Bind("Fee") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEntryDate" runat="server" controlname="lblEntryDate" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEntryDate" runat="server" Text='<%# Bind("EntryDate") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comEntryDate" CssClass="NormalRed" runat="server" resourcekey="valEntryDate.ErrorMessage" ControlToValidate="txtEntryDate" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblClydesdale" runat="server" controlname="lblClydesdale" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtClydesdale" runat="server" Checked='<%# Bind("Clydesdale") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSurvivor" runat="server" controlname="lblSurvivor" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtSurvivor" runat="server" Checked='<%# Bind("Survivor") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblNonCompetitive" runat="server" controlname="lblNonCompetitive" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtNonCompetitive" runat="server" Checked='<%# Bind("NonCompetitive") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUSATF" runat="server" controlname="lblUSATF" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtUSATF" runat="server" Checked='<%# Bind("USATF") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAge" runat="server" controlname="lblAge" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAge" runat="server" Text='<%# Bind("Age") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comAge" CssClass="NormalRed" runat="server" resourcekey="valAge.ErrorMessage" ControlToValidate="txtAge" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSex" runat="server" controlname="lblSex" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSex" runat="server" Text='<%# Bind("Sex") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWeight" runat="server" controlname="lblWeight" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWeight" runat="server" Text='<%# Bind("Weight") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comWeight" CssClass="NormalRed" runat="server" resourcekey="valWeight.ErrorMessage" ControlToValidate="txtWeight" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblHeat" runat="server" controlname="lblHeat" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtHeat" runat="server" Text='<%# Bind("Heat") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comHeat" CssClass="NormalRed" runat="server" resourcekey="valHeat.ErrorMessage" ControlToValidate="txtHeat" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWaveOffset" runat="server" controlname="lblWaveOffset" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWaveOffset" runat="server" Text='<%# Bind("WaveOffset") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comWaveOffset" CssClass="NormalRed" runat="server" resourcekey="valWaveOffset.ErrorMessage" ControlToValidate="txtWaveOffset" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblWAVATime" runat="server" controlname="lblWAVATime" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtWAVATime" runat="server" Text='<%# Bind("WAVATime") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comWAVATime" CssClass="NormalRed" runat="server" resourcekey="valWAVATime.ErrorMessage" ControlToValidate="txtWAVATime" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPerformancePercent" runat="server" controlname="lblPerformancePercent" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPerformancePercent" runat="server" Text='<%# Bind("PerformancePercent") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSeriesPlace" runat="server" controlname="lblSeriesPlace" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSeriesPlace" runat="server" Text='<%# Bind("SeriesPlace") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comSeriesPlace" CssClass="NormalRed" runat="server" resourcekey="valSeriesPlace.ErrorMessage" ControlToValidate="txtSeriesPlace" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSeriesAge" runat="server" controlname="lblSeriesAge" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSeriesAge" runat="server" Text='<%# Bind("SeriesAge") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comSeriesAge" CssClass="NormalRed" runat="server" resourcekey="valSeriesAge.ErrorMessage" ControlToValidate="txtSeriesAge" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSeriesDivision" runat="server" controlname="lblSeriesDivision" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSeriesDivision" runat="server" Text='<%# Bind("SeriesDivision") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSeriesPoints" runat="server" controlname="lblSeriesPoints" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSeriesPoints" runat="server" Text='<%# Bind("SeriesPoints") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comSeriesPoints" CssClass="NormalRed" runat="server" resourcekey="valSeriesPoints.ErrorMessage" ControlToValidate="txtSeriesPoints" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblConfirmation" runat="server" controlname="lblConfirmation" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtConfirmation" runat="server" Checked='<%# Bind("Confirmation") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblResults" runat="server" controlname="lblResults" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtResults" runat="server" Checked='<%# Bind("Results") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblChipId" runat="server" controlname="lblChipId" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtChipId" runat="server" Text='<%# Bind("ChipId") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAwardDivision" runat="server" controlname="lblAwardDivision" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAwardDivision" runat="server" Text='<%# Bind("AwardDivision") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAwardPlace" runat="server" controlname="lblAwardPlace" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAwardPlace" runat="server" Text='<%# Bind("AwardPlace") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comAwardPlace" CssClass="NormalRed" runat="server" resourcekey="valAwardPlace.ErrorMessage" ControlToValidate="txtAwardPlace" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAwardPriority" runat="server" controlname="lblAwardPriority" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAwardPriority" runat="server" Text='<%# Bind("AwardPriority") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comAwardPriority" CssClass="NormalRed" runat="server" resourcekey="valAwardPriority.ErrorMessage" ControlToValidate="txtAwardPriority" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertEventsItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Insert" OnClick="InsertEventsItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertEventsCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertEventsCancelButton_Click">
             </asp:LinkButton>
         </p>
     </InsertItemTemplate>
     <ItemTemplate>
     </ItemTemplate>
</asp:FormView>
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