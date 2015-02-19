<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ViewRaceDivisions.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ViewRaceDivisions" %>
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
<br />
<asp:Button ID="AddRaceDivisionsItemButton" runat="server" EnableViewState="False">Add RaceDivisions</asp:Button>
<br /><br /><asp:label id="lblStatus" runat="server" /><br /><br />
<asp:FormView ID="FormRaceDivisions" runat="server" 
	DataKeyNames="raceId, priority" 
	DataSourceID="RaceDivisionsDataSource"
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
        <td class="SubHead"><dnn:label id="lblSexEdit" runat="server" controlname="lblSex" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSex" runat="server" Text='<%# Bind("Sex") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStartAgeEdit" runat="server" controlname="lblStartAge" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtStartAge" runat="server" Text='<%# Bind("StartAge") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comStartAge" CssClass="NormalRed" runat="server" resourcekey="valStartAge.ErrorMessage" ControlToValidate="txtStartAge" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEndAgeEdit" runat="server" controlname="lblEndAge" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEndAge" runat="server" Text='<%# Bind("EndAge") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comEndAge" CssClass="NormalRed" runat="server" resourcekey="valEndAge.ErrorMessage" ControlToValidate="txtEndAge" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStartWeightEdit" runat="server" controlname="lblStartWeight" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtStartWeight" runat="server" Text='<%# Bind("StartWeight") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comStartWeight" CssClass="NormalRed" runat="server" resourcekey="valStartWeight.ErrorMessage" ControlToValidate="txtStartWeight" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEndWeightEdit" runat="server" controlname="lblEndWeight" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEndWeight" runat="server" Text='<%# Bind("EndWeight") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comEndWeight" CssClass="NormalRed" runat="server" resourcekey="valEndWeight.ErrorMessage" ControlToValidate="txtEndWeight" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSurvivorEdit" runat="server" controlname="lblSurvivor" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtSurvivor" runat="server" Checked='<%# Bind("Survivor") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDivisionEdit" runat="server" controlname="lblDivision" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDivision" runat="server" Text='<%# Bind("Division") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDepthEdit" runat="server" controlname="lblDepth" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDepth" runat="server" Text='<%# Bind("Depth") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDepth" CssClass="NormalRed" runat="server" resourcekey="valDepth.ErrorMessage" ControlToValidate="txtDepth" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOverallEdit" runat="server" controlname="lblOverall" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtOverall" runat="server" Checked='<%# Bind("Overall") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMastersEdit" runat="server" controlname="lblMasters" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtMasters" runat="server" Checked='<%# Bind("Masters") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUSATFEdit" runat="server" controlname="lblUSATF" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtUSATF" runat="server" Checked='<%# Bind("USATF") %>' /></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="UpdateRaceDivisionsItemButton" runat="server" 
                 CausesValidation="True" CommandName="Update"
                 Text="Save" OnClick="UpdateRaceDivisionsItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="UpdateRaceDivisionsCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="UpdateRaceDivisionsCancelButton_Click">
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
        <td class="SubHead"><dnn:label id="lblSex" runat="server" controlname="lblSex" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtSex" runat="server" Text='<%# Bind("Sex") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStartAge" runat="server" controlname="lblStartAge" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtStartAge" runat="server" Text='<%# Bind("StartAge") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comStartAge" CssClass="NormalRed" runat="server" resourcekey="valStartAge.ErrorMessage" ControlToValidate="txtStartAge" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEndAge" runat="server" controlname="lblEndAge" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEndAge" runat="server" Text='<%# Bind("EndAge") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comEndAge" CssClass="NormalRed" runat="server" resourcekey="valEndAge.ErrorMessage" ControlToValidate="txtEndAge" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStartWeight" runat="server" controlname="lblStartWeight" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtStartWeight" runat="server" Text='<%# Bind("StartWeight") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comStartWeight" CssClass="NormalRed" runat="server" resourcekey="valStartWeight.ErrorMessage" ControlToValidate="txtStartWeight" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEndWeight" runat="server" controlname="lblEndWeight" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEndWeight" runat="server" Text='<%# Bind("EndWeight") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comEndWeight" CssClass="NormalRed" runat="server" resourcekey="valEndWeight.ErrorMessage" ControlToValidate="txtEndWeight" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSurvivor" runat="server" controlname="lblSurvivor" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtSurvivor" runat="server" Checked='<%# Bind("Survivor") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDivision" runat="server" controlname="lblDivision" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDivision" runat="server" Text='<%# Bind("Division") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDepth" runat="server" controlname="lblDepth" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDepth" runat="server" Text='<%# Bind("Depth") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDepth" CssClass="NormalRed" runat="server" resourcekey="valDepth.ErrorMessage" ControlToValidate="txtDepth" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOverall" runat="server" controlname="lblOverall" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtOverall" runat="server" Checked='<%# Bind("Overall") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMasters" runat="server" controlname="lblMasters" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtMasters" runat="server" Checked='<%# Bind("Masters") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUSATF" runat="server" controlname="lblUSATF" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtUSATF" runat="server" Checked='<%# Bind("USATF") %>' /></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertRaceDivisionsItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Save" OnClick="InsertRaceDivisionsItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertRaceDivisionsCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertRaceDivisionsCancelButton_Click">
             </asp:LinkButton>
         </p>
    </InsertItemTemplate>
    <ItemTemplate>
	<table>
        <tr><td></td>
		<td><asp:TextBox ID="txtPortalIdView" runat="server" Text='<%# Bind("PortalId") %>' Visible="False"></asp:TextBox></td>
		</tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSexView" runat="server" controlname="lblSexView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtSexView" runat="server" Text='<%# Eval("Sex") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStartAgeView" runat="server" controlname="lblStartAgeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtStartAgeView" runat="server" Text='<%# Eval("StartAge") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEndAgeView" runat="server" controlname="lblEndAgeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtEndAgeView" runat="server" Text='<%# Eval("EndAge") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStartWeightView" runat="server" controlname="lblStartWeightView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtStartWeightView" runat="server" Text='<%# Eval("StartWeight") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEndWeightView" runat="server" controlname="lblEndWeightView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtEndWeightView" runat="server" Text='<%# Eval("EndWeight") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblSurvivorView" runat="server" controlname="lblSurvivorView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtSurvivorView" runat="server" Text='<%# Eval("Survivor") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDivisionView" runat="server" controlname="lblDivisionView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtDivisionView" runat="server" Text='<%# Eval("Division") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDepthView" runat="server" controlname="lblDepthView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtDepthView" runat="server" Text='<%# Eval("Depth") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOverallView" runat="server" controlname="lblOverallView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtOverallView" runat="server" Text='<%# Eval("Overall") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMastersView" runat="server" controlname="lblMastersView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMastersView" runat="server" Text='<%# Eval("Masters") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblUSATFView" runat="server" controlname="lblUSATFView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtUSATFView" runat="server" Text='<%# Eval("USATF") %>' /></td>
        </tr>
       </table> 
         <p>
			 <asp:LinkButton ID="EditRaceDivisionsItemButton" runat="server" 
                 CausesValidation="True" CommandName="Edit" Enabled="<%# IsEditable %>"  Visible="<%# IsEditable %>"
                 Text="Edit" OnClick="EditRaceDivisionsItemButton_Click">
             </asp:LinkButton>&nbsp;
         </p>
    </ItemTemplate>
	<EmptyDataTemplate>
        There are no RaceDivisions Records
    </EmptyDataTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="RaceDivisionsDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.RaceDivisionsInfo"
    DeleteMethod="DeleteRaceDivisions" 
    InsertMethod="AddRaceDivisions" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetRaceDivisions" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateRaceDivisions"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="00" Name="RaceId" QueryStringField="RaceId" Type="Int32" />
        <asp:QueryStringParameter DefaultValue="00" Name="Priority" QueryStringField="Priority" Type="Int32" />
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
