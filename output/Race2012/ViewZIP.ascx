<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ViewZIP.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ViewZIP" %>
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
				<asp:ListItem Value="City">City</asp:ListItem>
				<asp:ListItem Value="State">State</asp:ListItem>
				<asp:ListItem Value="County">County</asp:ListItem>
				<asp:ListItem Value="Country">Country</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<br />
<asp:Button ID="AddZIPItemButton" runat="server" EnableViewState="False">Add ZIP</asp:Button>
<br /><br /><asp:label id="lblStatus" runat="server" /><br /><br />
<asp:FormView ID="FormZIP" runat="server" 
	DataKeyNames="fiveDigitZIP, sequence" 
	DataSourceID="ZIPDataSource"
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
        <td class="SubHead"><dnn:label id="lblCityEdit" runat="server" controlname="lblCity" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStateEdit" runat="server" controlname="lblState" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtState" runat="server" Text='<%# Bind("State") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCountyEdit" runat="server" controlname="lblCounty" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCounty" runat="server" Text='<%# Bind("County") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCountryEdit" runat="server" controlname="lblCountry" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="UpdateZIPItemButton" runat="server" 
                 CausesValidation="True" CommandName="Update"
                 Text="Save" OnClick="UpdateZIPItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="UpdateZIPCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="UpdateZIPCancelButton_Click">
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
        <td class="SubHead"><dnn:label id="lblCity" runat="server" controlname="lblCity" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblState" runat="server" controlname="lblState" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtState" runat="server" Text='<%# Bind("State") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCounty" runat="server" controlname="lblCounty" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCounty" runat="server" Text='<%# Bind("County") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCountry" runat="server" controlname="lblCountry" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertZIPItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Save" OnClick="InsertZIPItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertZIPCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertZIPCancelButton_Click">
             </asp:LinkButton>
         </p>
    </InsertItemTemplate>
    <ItemTemplate>
	<table>
        <tr><td></td>
		<td><asp:TextBox ID="txtPortalIdView" runat="server" Text='<%# Bind("PortalId") %>' Visible="False"></asp:TextBox></td>
		</tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCityView" runat="server" controlname="lblCityView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtCityView" runat="server" Text='<%# Eval("City") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblStateView" runat="server" controlname="lblStateView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtStateView" runat="server" Text='<%# Eval("State") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCountyView" runat="server" controlname="lblCountyView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtCountyView" runat="server" Text='<%# Eval("County") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblCountryView" runat="server" controlname="lblCountryView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtCountryView" runat="server" Text='<%# Eval("Country") %>' /></td>
        </tr>
       </table> 
         <p>
			 <asp:LinkButton ID="EditZIPItemButton" runat="server" 
                 CausesValidation="True" CommandName="Edit" Enabled="<%# IsEditable %>"  Visible="<%# IsEditable %>"
                 Text="Edit" OnClick="EditZIPItemButton_Click">
             </asp:LinkButton>&nbsp;
         </p>
    </ItemTemplate>
	<EmptyDataTemplate>
        There are no ZIP Records
    </EmptyDataTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="ZIPDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.ZIPInfo"
    DeleteMethod="DeleteZIP" 
    InsertMethod="AddZIP" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetZIP" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateZIP"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="00" Name="FiveDigitZIP" QueryStringField="FiveDigitZIP" Type="String" />
        <asp:QueryStringParameter DefaultValue="00" Name="Sequence" QueryStringField="Sequence" Type="Int16" />
	</SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="FiveDigitZIP" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sequence" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="City" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="State" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="County" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Country" Type="String" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="FiveDigitZIP" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Sequence" Type="Int16" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="City" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="State" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="County" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Country" Type="String" ConvertEmptyStringToNull="true" />
	</UpdateParameters>
</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
