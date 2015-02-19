<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ListRaceDivisions.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ListRaceDivisions" %>
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
				<asp:ListItem Value="Sex">Sex</asp:ListItem>
				<asp:ListItem Value="StartAge">StartAge</asp:ListItem>
				<asp:ListItem Value="EndAge">EndAge</asp:ListItem>
				<asp:ListItem Value="StartWeight">StartWeight</asp:ListItem>
				<asp:ListItem Value="EndWeight">EndWeight</asp:ListItem>
				<asp:ListItem Value="Survivor">Survivor</asp:ListItem>
				<asp:ListItem Value="Division">Division</asp:ListItem>
				<asp:ListItem Value="Depth">Depth</asp:ListItem>
				<asp:ListItem Value="Overall">Overall</asp:ListItem>
				<asp:ListItem Value="Masters">Masters</asp:ListItem>
				<asp:ListItem Value="USATF">USATF</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:ListView ID="ListViewRaceDivisions" runat="server" 
    DataKeyNames="raceId, priority"
    DataSourceID="RaceDivisionsDataSource"
	ItemPlaceHolderId="RaceDivisionsContent"
	OnItemDataBound="ListViewRaceDivisions_ItemDataBound"
    EnableViewState="False">
    <LayoutTemplate>
		<div id="RaceDivisionsHeader">
			<h1 id="RaceDivisionsLogo">RaceDivisions List</h1>
		</div>
		<div runat="server">
			<table>
				<thead>
					<tr>
        		<th><asp:Label runat="server" id="hdrSex" Text='Sex' /></th>
        		<th><asp:Label runat="server" id="hdrStartAge" Text='StartAge' /></th>
        		<th><asp:Label runat="server" id="hdrEndAge" Text='EndAge' /></th>
        		<th><asp:Label runat="server" id="hdrStartWeight" Text='StartWeight' /></th>
        		<th><asp:Label runat="server" id="hdrEndWeight" Text='EndWeight' /></th>
        		<th><asp:Label runat="server" id="hdrSurvivor" Text='Survivor' /></th>
        		<th><asp:Label runat="server" id="hdrDivision" Text='Division' /></th>
        		<th><asp:Label runat="server" id="hdrDepth" Text='Depth' /></th>
        		<th><asp:Label runat="server" id="hdrOverall" Text='Overall' /></th>
        		<th><asp:Label runat="server" id="hdrMasters" Text='Masters' /></th>
        		<th><asp:Label runat="server" id="hdrUSATF" Text='USATF' /></th>
					</tr>
				</thead>
				<tbody runat="server" id="RaceDivisionsContent">
				</tbody>
			</table>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<tr>
        		<td><asp:Label runat="server" id="lblSex" Text='<%# Eval("Sex") %>' /></td>
        		<td><asp:Label runat="server" id="lblStartAge" Text='<%# Eval("StartAge") %>' /></td>
        		<td><asp:Label runat="server" id="lblEndAge" Text='<%# Eval("EndAge") %>' /></td>
        		<td><asp:Label runat="server" id="lblStartWeight" Text='<%# Eval("StartWeight") %>' /></td>
        		<td><asp:Label runat="server" id="lblEndWeight" Text='<%# Eval("EndWeight") %>' /></td>
        		<td><asp:Label runat="server" id="lblSurvivor" Text='<%# Eval("Survivor") %>' /></td>
        		<td><asp:Label runat="server" id="lblDivision" Text='<%# Eval("Division") %>' /></td>
        		<td><asp:Label runat="server" id="lblDepth" Text='<%# Eval("Depth") %>' /></td>
        		<td><asp:Label runat="server" id="lblOverall" Text='<%# Eval("Overall") %>' /></td>
        		<td><asp:Label runat="server" id="lblMasters" Text='<%# Eval("Masters") %>' /></td>
        		<td><asp:Label runat="server" id="lblUSATF" Text='<%# Eval("USATF") %>' /></td>
		</tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        There are no RaceDivisions Records
    </EmptyDataTemplate>
</asp:ListView>
<br />

<asp:ObjectDataSource ID="RaceDivisionsDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.RaceDivisionsInfo"
    DeleteMethod="DeleteRaceDivisions" 
    InsertMethod="AddRaceDivisions" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListRaceDivisionss" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateRaceDivisions"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="RaceId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Priority" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sex" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="StartAge" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EndAge" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="StartWeight" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EndWeight" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Survivor" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Division" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Depth" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Overall" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Masters" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="USATF" Type="Boolean" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="RaceId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Priority" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sex" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="StartAge" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EndAge" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="StartWeight" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EndWeight" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Survivor" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Division" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Depth" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Overall" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Masters" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="USATF" Type="Boolean" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
