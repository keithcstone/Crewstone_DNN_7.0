<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ViewOrganization.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ViewOrganization" %>
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
<br />
<asp:Button ID="AddOrganizationItemButton" runat="server" EnableViewState="False">Add Organization</asp:Button>
<br /><br /><asp:label id="lblStatus" runat="server" /><br /><br />
<asp:FormView ID="FormOrganization" runat="server" 
	DataKeyNames="orgID" 
	DataSourceID="OrganizationDataSource"
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
        <td class="SubHead"><dnn:label id="lblClubNameEdit" runat="server" controlname="lblClubName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtClubName" runat="server" Text='<%# Bind("ClubName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAddressEdit" runat="server" controlname="lblAddress" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCityEdit" runat="server" controlname="lblCity" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStateOrProvinceEdit" runat="server" controlname="lblStateOrProvince" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtStateOrProvince" runat="server" Text='<%# Bind("StateOrProvince") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPostalCodeEdit" runat="server" controlname="lblPostalCode" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPostalCode" runat="server" Text='<%# Bind("PostalCode") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCountryEdit" runat="server" controlname="lblCountry" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDefaultInvoiceDescriptionEdit" runat="server" controlname="lblDefaultInvoiceDescription" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDefaultInvoiceDescription" runat="server" Text='<%# Bind("DefaultInvoiceDescription") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPhoneNumberEdit" runat="server" controlname="lblPhoneNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblFaxNumberEdit" runat="server" controlname="lblFaxNumber" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtFaxNumber" runat="server" Text='<%# Bind("FaxNumber") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEMailEdit" runat="server" controlname="lblEMail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEMail" runat="server" Text='<%# Bind("EMail") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblNicknameEdit" runat="server" controlname="lblNickname" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtNickname" runat="server" Text='<%# Bind("Nickname") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMailingExpirePeriodEdit" runat="server" controlname="lblMailingExpirePeriod" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMailingExpirePeriod" runat="server" Text='<%# Bind("MailingExpirePeriod") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comMailingExpirePeriod" CssClass="NormalRed" runat="server" resourcekey="valMailingExpirePeriod.ErrorMessage" ControlToValidate="txtMailingExpirePeriod" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastEmailEdit" runat="server" controlname="lblLastEmail" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtLastEmail" runat="server" Text='<%# Bind("LastEmail") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comLastEmail" CssClass="NormalRed" runat="server" resourcekey="valLastEmail.ErrorMessage" ControlToValidate="txtLastEmail" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastLettersEdit" runat="server" controlname="lblLastLetters" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtLastLetters" runat="server" Text='<%# Bind("LastLetters") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comLastLetters" CssClass="NormalRed" runat="server" resourcekey="valLastLetters.ErrorMessage" ControlToValidate="txtLastLetters" Display="Dynamic" ErrorMessage="Not Date" Type="Date" Operator="DataTypeCheck"></asp:comparevalidator></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="UpdateOrganizationItemButton" runat="server" 
                 CausesValidation="True" CommandName="Update"
                 Text="Save" OnClick="UpdateOrganizationItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="UpdateOrganizationCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="UpdateOrganizationCancelButton_Click">
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
                 Text="Save" OnClick="InsertOrganizationItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertOrganizationCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertOrganizationCancelButton_Click">
             </asp:LinkButton>
         </p>
    </InsertItemTemplate>
    <ItemTemplate>
	<table>
        <tr><td></td>
		<td><asp:TextBox ID="txtPortalIdView" runat="server" Text='<%# Bind("PortalId") %>' Visible="False"></asp:TextBox></td>
		</tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblClubNameView" runat="server" controlname="lblClubNameView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtClubNameView" runat="server" Text='<%# Eval("ClubName") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAddressView" runat="server" controlname="lblAddressView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtAddressView" runat="server" Text='<%# Eval("Address") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCityView" runat="server" controlname="lblCityView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtCityView" runat="server" Text='<%# Eval("City") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStateOrProvinceView" runat="server" controlname="lblStateOrProvinceView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtStateOrProvinceView" runat="server" Text='<%# Eval("StateOrProvince") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPostalCodeView" runat="server" controlname="lblPostalCodeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtPostalCodeView" runat="server" Text='<%# Eval("PostalCode") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCountryView" runat="server" controlname="lblCountryView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtCountryView" runat="server" Text='<%# Eval("Country") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDefaultInvoiceDescriptionView" runat="server" controlname="lblDefaultInvoiceDescriptionView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtDefaultInvoiceDescriptionView" runat="server" Text='<%# Eval("DefaultInvoiceDescription") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblPhoneNumberView" runat="server" controlname="lblPhoneNumberView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtPhoneNumberView" runat="server" Text='<%# Eval("PhoneNumber") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblFaxNumberView" runat="server" controlname="lblFaxNumberView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtFaxNumberView" runat="server" Text='<%# Eval("FaxNumber") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEMailView" runat="server" controlname="lblEMailView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtEMailView" runat="server" Text='<%# Eval("EMail") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblNicknameView" runat="server" controlname="lblNicknameView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtNicknameView" runat="server" Text='<%# Eval("Nickname") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMailingExpirePeriodView" runat="server" controlname="lblMailingExpirePeriodView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtMailingExpirePeriodView" runat="server" Text='<%# Eval("MailingExpirePeriod") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastEmailView" runat="server" controlname="lblLastEmailView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtLastEmailView" runat="server" Text='<%# Eval("LastEmail") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblLastLettersView" runat="server" controlname="lblLastLettersView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtLastLettersView" runat="server" Text='<%# Eval("LastLetters") %>' /></td>
        </tr>
       </table> 
         <p>
			 <asp:LinkButton ID="EditOrganizationItemButton" runat="server" 
                 CausesValidation="True" CommandName="Edit" Enabled="<%# IsEditable %>"  Visible="<%# IsEditable %>"
                 Text="Edit" OnClick="EditOrganizationItemButton_Click">
             </asp:LinkButton>&nbsp;
         </p>
    </ItemTemplate>
	<EmptyDataTemplate>
        There are no Organization Records
    </EmptyDataTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="OrganizationDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.OrganizationInfo"
    DeleteMethod="DeleteOrganization" 
    InsertMethod="AddOrganization" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetOrganization" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateOrganization"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="00" Name="OrgID" QueryStringField="OrgID" Type="Int32" />
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
