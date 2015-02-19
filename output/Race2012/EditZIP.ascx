<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EditZIP.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.EditZIP" %>
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
<asp:GridView ID="GridZIP" runat="server" 
    AllowPaging="True" AutoGenerateColumns="False"
    DataKeyNames="fiveDigitZIP, sequence"
    DataSourceID="ZIPDataSource"
    EnableViewState="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="True" />
        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" Visible="True" />
        <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" Visible="True" />
        <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" Visible="True" />
    </Columns>
    <EmptyDataTemplate>
        There are no ZIP Records
    </EmptyDataTemplate>
</asp:GridView>
<br />
<asp:Button ID="AddZIPItemButton" runat="server" EnableViewState="False" Text="Add ZIP"></asp:Button>
<br /><br />
<asp:FormView ID="FormZIP" runat="server" 
	DataKeyNames="fiveDigitZIP, sequence" 
	DataSourceID="ZIPDataSource"
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
                 Text="Insert" OnClick="InsertZIPItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertZIPCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertZIPCancelButton_Click">
             </asp:LinkButton>
         </p>
     </InsertItemTemplate>
     <ItemTemplate>
     </ItemTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="ZIPDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.ZIPInfo"
    DeleteMethod="DeleteZIP" 
    InsertMethod="AddZIP" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListZIPs" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateZIP"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
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