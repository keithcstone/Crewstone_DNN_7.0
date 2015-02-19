<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EditOrganization.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.EditOrganization" %>
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
				<asp:ListItem Value="ClubName">ClubName</asp:ListItem>
				<asp:ListItem Value="Address">Address</asp:ListItem>
				<asp:ListItem Value="City">City</asp:ListItem>
				<asp:ListItem Value="StateOrProvince">StateOrProvince</asp:ListItem>
				<asp:ListItem Value="PostalCode">PostalCode</asp:ListItem>
				<asp:ListItem Value="Country">Country</asp:ListItem>
				<asp:ListItem Value="DefaultInvoiceDescription">DefaultInvoiceDescription</asp:ListItem>
				<asp:ListItem Value="PhoneNumber">PhoneNumber</asp:ListItem>
				<asp:ListItem Value="FaxNumber">FaxNumber</asp:ListItem>
				<asp:ListItem Value="EMail">EMail</asp:ListItem>
				<asp:ListItem Value="Nickname">Nickname</asp:ListItem>
				<asp:ListItem Value="MailingExpirePeriod">MailingExpirePeriod</asp:ListItem>
				<asp:ListItem Value="LastEmail">LastEmail</asp:ListItem>
				<asp:ListItem Value="LastLetters">LastLetters</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:GridView ID="GridOrganization" runat="server" 
    AllowPaging="True" AutoGenerateColumns="False"
    DataKeyNames="orgID"
    DataSourceID="OrganizationDataSource"
    EnableViewState="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="ClubName" HeaderText="ClubName" SortExpression="ClubName" Visible="True" />
        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" Visible="True" />
        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="True" />
        <asp:BoundField DataField="StateOrProvince" HeaderText="StateOrProvince" SortExpression="StateOrProvince" Visible="True" />
        <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" Visible="True" />
        <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" Visible="True" />
        <asp:BoundField DataField="DefaultInvoiceDescription" HeaderText="DefaultInvoiceDescription" SortExpression="DefaultInvoiceDescription" Visible="True" />
        <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" Visible="True" />
        <asp:BoundField DataField="FaxNumber" HeaderText="FaxNumber" SortExpression="FaxNumber" Visible="True" />
        <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail" Visible="True" />
        <asp:BoundField DataField="Nickname" HeaderText="Nickname" SortExpression="Nickname" Visible="True" />
        <asp:BoundField DataField="MailingExpirePeriod" HeaderText="MailingExpirePeriod" SortExpression="MailingExpirePeriod" Visible="True" />
        <asp:BoundField DataField="LastEmail" HeaderText="LastEmail" SortExpression="LastEmail" Visible="True" />
        <asp:BoundField DataField="LastLetters" HeaderText="LastLetters" SortExpression="LastLetters" Visible="True" />
    </Columns>
    <EmptyDataTemplate>
        There are no Organization Records
    </EmptyDataTemplate>
</asp:GridView>
<br />
<asp:Button ID="AddOrganizationItemButton" runat="server" EnableViewState="False" Text="Add Organization"></asp:Button>
<br /><br />
<asp:FormView ID="FormOrganization" runat="server" 
	DataKeyNames="orgID" 
	DataSourceID="OrganizationDataSource"
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
        <td class="SubHead"><dnn:label id="lblClubName" runat="server" controlname="lblClubName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtClubName" runat="server" Text='<%# Bind("ClubName") %>' EnableViewState="False"></asp:TextBox></td>
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
        <td class="SubHead"><dnn:label id="lblStateOrProvince" runat="server" controlname="lblStateOrProvince" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtStateOrProvince" runat="server" Text='<%# Bind("StateOrProvince") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPostalCode" runat="server" controlname="lblPostalCode" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPostalCode" runat="server" Text='<%# Bind("PostalCode") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCountry" runat="server" controlname="lblCountry" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDefaultInvoiceDescription" runat="server" controlname="lblDefaultInvoiceDescription" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDefaultInvoiceDescription" runat="server" Text='<%# Bind("DefaultInvoiceDescription") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPhoneNumber" runat="server" controlname="lblPhoneNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblFaxNumber" runat="server" controlname="lblFaxNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtFaxNumber" runat="server" Text='<%# Bind("FaxNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEMail" runat="server" controlname="lblEMail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEMail" runat="server" Text='<%# Bind("EMail") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblNickname" runat="server" controlname="lblNickname" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtNickname" runat="server" Text='<%# Bind("Nickname") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMailingExpirePeriod" runat="server" controlname="lblMailingExpirePeriod" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMailingExpirePeriod" runat="server" Text='<%# Bind("MailingExpirePeriod") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comMailingExpirePeriod" CssClass="NormalRed" runat="server" resourcekey="valMailingExpirePeriod.ErrorMessage" ControlToValidate="txtMailingExpirePeriod" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastEmail" runat="server" controlname="lblLastEmail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtLastEmail" runat="server" Text='<%# Bind("LastEmail") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comLastEmail" CssClass="NormalRed" runat="server" resourcekey="valLastEmail.ErrorMessage" ControlToValidate="txtLastEmail" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastLetters" runat="server" controlname="lblLastLetters" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtLastLetters" runat="server" Text='<%# Bind("LastLetters") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comLastLetters" CssClass="NormalRed" runat="server" resourcekey="valLastLetters.ErrorMessage" ControlToValidate="txtLastLetters" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertOrganizationItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Insert" OnClick="InsertOrganizationItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertOrganizationCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertOrganizationCancelButton_Click">
             </asp:LinkButton>
         </p>
     </InsertItemTemplate>
     <ItemTemplate>
     </ItemTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="OrganizationDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.OrganizationInfo"
    DeleteMethod="DeleteOrganization" 
    InsertMethod="AddOrganization" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListOrganizations" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateOrganization"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="OrgID" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ClubName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Address" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="City" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="StateOrProvince" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PostalCode" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Country" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultInvoiceDescription" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PhoneNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="FaxNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EMail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Nickname" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MailingExpirePeriod" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastEmail" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastLetters" Type="DateTime" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="OrgID" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="ClubName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Address" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="City" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="StateOrProvince" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PostalCode" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Country" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultInvoiceDescription" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PhoneNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="FaxNumber" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EMail" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Nickname" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MailingExpirePeriod" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastEmail" Type="DateTime" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="LastLetters" Type="DateTime" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />