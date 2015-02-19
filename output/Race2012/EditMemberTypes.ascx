<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EditMemberTypes.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.EditMemberTypes" %>
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
				<asp:ListItem Value="MemberType">MemberType</asp:ListItem>
				<asp:ListItem Value="MemberDues">MemberDues</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<asp:GridView ID="GridMemberTypes" runat="server" 
    AllowPaging="True" AutoGenerateColumns="False"
    DataKeyNames="memberTypeID"
    DataSourceID="MemberTypesDataSource"
    EnableViewState="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="MemberType" HeaderText="MemberType" SortExpression="MemberType" Visible="True" />
        <asp:BoundField DataField="MemberDues" HeaderText="MemberDues" SortExpression="MemberDues" Visible="True" />
    </Columns>
    <EmptyDataTemplate>
        There are no MemberTypes Records
    </EmptyDataTemplate>
</asp:GridView>
<br />
<asp:Button ID="AddMemberTypesItemButton" runat="server" EnableViewState="False" Text="Add MemberTypes"></asp:Button>
<br /><br />
<asp:FormView ID="FormMemberTypes" runat="server" 
	DataKeyNames="memberTypeID" 
	DataSourceID="MemberTypesDataSource"
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
        <td class="SubHead"><dnn:label id="lblMemberType" runat="server" controlname="lblMemberType" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMemberType" runat="server" Text='<%# Bind("MemberType") %>' EnableViewState="False"></asp:TextBox><asp:requiredfieldvalidator id="reqMemberType" CssClass="NormalRed" runat="server" resourcekey="valMemberTypeReq.ErrorMessage" ControlToValidate="txtMemberType" Display="Dynamic" ErrorMessage="Required Field."></asp:requiredfieldvalidator></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblMemberDues" runat="server" controlname="lblMemberDues" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtMemberDues" runat="server" Text='<%# Bind("MemberDues") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertMemberTypesItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Insert" OnClick="InsertMemberTypesItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertMemberTypesCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertMemberTypesCancelButton_Click">
             </asp:LinkButton>
         </p>
     </InsertItemTemplate>
     <ItemTemplate>
     </ItemTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="MemberTypesDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.MemberTypesInfo"
    DeleteMethod="DeleteMemberTypes" 
    InsertMethod="AddMemberTypes" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="ListMemberTypess" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateMemberTypes"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:Parameter DefaultValue="00" Name="PortalId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="MemberTypeID" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberType" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberDues" Type="decimal" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="MemberTypeID" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberType" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="MemberDues" Type="decimal" ConvertEmptyStringToNull="true" />
	</UpdateParameters>

</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />