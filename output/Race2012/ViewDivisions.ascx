<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ViewDivisions.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ViewDivisions" %>
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
				<asp:ListItem Value="Description">Description</asp:ListItem>
				<asp:ListItem Value="Priority">Priority</asp:ListItem>
				<asp:ListItem Value="Overall">Overall</asp:ListItem>
				<asp:ListItem Value="Masters">Masters</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<br />
<asp:Button ID="AddDivisionsItemButton" runat="server" EnableViewState="False">Add Divisions</asp:Button>
<br /><br /><asp:label id="lblStatus" runat="server" /><br /><br />
<asp:FormView ID="FormDivisions" runat="server" 
	DataKeyNames="division" 
	DataSourceID="DivisionsDataSource"
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
        <td class="SubHead"><dnn:label id="lblDescriptionEdit" runat="server" controlname="lblDescription" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPriorityEdit" runat="server" controlname="lblPriority" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPriority" runat="server" Text='<%# Bind("Priority") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comPriority" CssClass="NormalRed" runat="server" resourcekey="valPriority.ErrorMessage" ControlToValidate="txtPriority" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOverallEdit" runat="server" controlname="lblOverall" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtOverall" runat="server" Checked='<%# Bind("Overall") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMastersEdit" runat="server" controlname="lblMasters" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtMasters" runat="server" Checked='<%# Bind("Masters") %>' /></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="UpdateDivisionsItemButton" runat="server" 
                 CausesValidation="True" CommandName="Update"
                 Text="Save" OnClick="UpdateDivisionsItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="UpdateDivisionsCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="UpdateDivisionsCancelButton_Click">
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
        <td class="SubHead"><dnn:label id="lblDescription" runat="server" controlname="lblDescription" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPriority" runat="server" controlname="lblPriority" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPriority" runat="server" Text='<%# Bind("Priority") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comPriority" CssClass="NormalRed" runat="server" resourcekey="valPriority.ErrorMessage" ControlToValidate="txtPriority" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOverall" runat="server" controlname="lblOverall" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtOverall" runat="server" Checked='<%# Bind("Overall") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMasters" runat="server" controlname="lblMasters" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtMasters" runat="server" Checked='<%# Bind("Masters") %>' /></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertDivisionsItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Save" OnClick="InsertDivisionsItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertDivisionsCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertDivisionsCancelButton_Click">
             </asp:LinkButton>
         </p>
    </InsertItemTemplate>
    <ItemTemplate>
	<table>
        <tr><td></td>
		<td><asp:TextBox ID="txtPortalIdView" runat="server" Text='<%# Bind("PortalId") %>' Visible="False"></asp:TextBox></td>
		</tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDescriptionView" runat="server" controlname="lblDescriptionView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtDescriptionView" runat="server" Text='<%# Eval("Description") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPriorityView" runat="server" controlname="lblPriorityView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtPriorityView" runat="server" Text='<%# Eval("Priority") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOverallView" runat="server" controlname="lblOverallView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtOverallView" runat="server" Text='<%# Eval("Overall") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMastersView" runat="server" controlname="lblMastersView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMastersView" runat="server" Text='<%# Eval("Masters") %>' /></td>
        </tr>
       </table> 
         <p>
			 <asp:LinkButton ID="EditDivisionsItemButton" runat="server" 
                 CausesValidation="True" CommandName="Edit" Enabled="<%# IsEditable %>"  Visible="<%# IsEditable %>"
                 Text="Edit" OnClick="EditDivisionsItemButton_Click">
             </asp:LinkButton>&nbsp;
         </p>
    </ItemTemplate>
	<EmptyDataTemplate>
        There are no Divisions Records
    </EmptyDataTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="DivisionsDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.DivisionsInfo"
    DeleteMethod="DeleteDivisions" 
    InsertMethod="AddDivisions" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetDivisions" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateDivisions"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="00" Name="Division" QueryStringField="Division" Type="String" />
	</SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="Division" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Priority" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Overall" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Masters" Type="Boolean" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="Division" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Priority" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Overall" Type="Boolean" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Masters" Type="Boolean" ConvertEmptyStringToNull="true" />
	</UpdateParameters>
</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
