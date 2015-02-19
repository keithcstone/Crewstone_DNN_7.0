<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EditDoNotEmail.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.EditDoNotEmail" %>
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
<asp:GridView ID="GridDoNotEmail" runat="server" 
    AllowPaging="True" AutoGenerateColumns="False"
    DataKeyNames="emailAddress"
    DataSourceID="DoNotEmailDataSource"
    EnableViewState="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="MovedBy" HeaderText="MovedBy" SortExpression="MovedBy" Visible="True" />
        <asp:BoundField DataField="OptOutReason" HeaderText="OptOutReason" SortExpression="OptOutReason" Visible="True" />
    </Columns>
    <EmptyDataTemplate>
        There are no DoNotEmail Records
    </EmptyDataTemplate>
</asp:GridView>
<br />
<asp:Button ID="AddDoNotEmailItemButton" runat="server" EnableViewState="False" Text="Add DoNotEmail"></asp:Button>
<br /><br />
<asp:FormView ID="FormDoNotEmail" runat="server" 
	DataKeyNames="emailAddress" 
	DataSourceID="DoNotEmailDataSource"
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
                 Text="Insert" OnClick="InsertDoNotEmailItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertDoNotEmailCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertDoNotEmailCancelButton_Click">
             </asp:LinkButton>
         </p>
     </InsertItemTemplate>
     <ItemTemplate>
     </ItemTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="DoNotEmailDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.DoNotEmailInfo"
    DeleteMethod="DeleteDoNotEmail" 
    InsertMethod="AddDoNotEmail" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListDoNotEmails" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateDoNotEmail"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
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