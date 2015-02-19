<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ViewDoNotEmail.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ViewDoNotEmail" %>
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
				<asp:ListItem Value="MovedBy">MovedBy</asp:ListItem>
				<asp:ListItem Value="OptOutReason">OptOutReason</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<br />
<asp:Button ID="AddDoNotEmailItemButton" runat="server" EnableViewState="False">Add DoNotEmail</asp:Button>
<br /><br /><asp:label id="lblStatus" runat="server" /><br /><br />
<asp:FormView ID="FormDoNotEmail" runat="server" 
	DataKeyNames="emailAddress" 
	DataSourceID="DoNotEmailDataSource"
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
        <td class="SubHead"><dnn:label id="lblMovedByEdit" runat="server" controlname="lblMovedBy" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMovedBy" runat="server" Text='<%# Bind("MovedBy") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOptOutReasonEdit" runat="server" controlname="lblOptOutReason" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtOptOutReason" runat="server" Text='<%# Bind("OptOutReason") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="UpdateDoNotEmailItemButton" runat="server" 
                 CausesValidation="True" CommandName="Update"
                 Text="Save" OnClick="UpdateDoNotEmailItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="UpdateDoNotEmailCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="UpdateDoNotEmailCancelButton_Click">
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
        <td class="SubHead"><dnn:label id="lblMovedBy" runat="server" controlname="lblMovedBy" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMovedBy" runat="server" Text='<%# Bind("MovedBy") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOptOutReason" runat="server" controlname="lblOptOutReason" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtOptOutReason" runat="server" Text='<%# Bind("OptOutReason") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertDoNotEmailItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Save" OnClick="InsertDoNotEmailItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertDoNotEmailCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertDoNotEmailCancelButton_Click">
             </asp:LinkButton>
         </p>
    </InsertItemTemplate>
    <ItemTemplate>
	<table>
        <tr><td></td>
		<td><asp:TextBox ID="txtPortalIdView" runat="server" Text='<%# Bind("PortalId") %>' Visible="False"></asp:TextBox></td>
		</tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMovedByView" runat="server" controlname="lblMovedByView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMovedByView" runat="server" Text='<%# Eval("MovedBy") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblOptOutReasonView" runat="server" controlname="lblOptOutReasonView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtOptOutReasonView" runat="server" Text='<%# Eval("OptOutReason") %>' /></td>
        </tr>
       </table> 
         <p>
			 <asp:LinkButton ID="EditDoNotEmailItemButton" runat="server" 
                 CausesValidation="True" CommandName="Edit" Enabled="<%# IsEditable %>"  Visible="<%# IsEditable %>"
                 Text="Edit" OnClick="EditDoNotEmailItemButton_Click">
             </asp:LinkButton>&nbsp;
         </p>
    </ItemTemplate>
	<EmptyDataTemplate>
        There are no DoNotEmail Records
    </EmptyDataTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="DoNotEmailDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.DoNotEmailInfo"
    DeleteMethod="DeleteDoNotEmail" 
    InsertMethod="AddDoNotEmail" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetDoNotEmail" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateDoNotEmail"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="00" Name="EmailAddress" QueryStringField="EmailAddress" Type="String" />
	</SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="EmailAddress" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MovedBy" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="OptOutReason" Type="String" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="EmailAddress" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MovedBy" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="OptOutReason" Type="String" ConvertEmptyStringToNull="true" />
	</UpdateParameters>
</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
