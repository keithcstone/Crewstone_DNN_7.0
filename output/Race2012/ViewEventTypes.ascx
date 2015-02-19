<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ViewEventTypes.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ViewEventTypes" %>
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
				<asp:ListItem Value="EventTypeName">EventTypeName</asp:ListItem>
				<asp:ListItem Value="DefaultType">DefaultType</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<br />
<asp:Button ID="AddEventTypesItemButton" runat="server" EnableViewState="False">Add EventTypes</asp:Button>
<br /><br /><asp:label id="lblStatus" runat="server" /><br /><br />
<asp:FormView ID="FormEventTypes" runat="server" 
	DataKeyNames="eventTypeId" 
	DataSourceID="EventTypesDataSource"
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
        <td class="SubHead"><dnn:label id="lblEventTypeNameEdit" runat="server" controlname="lblEventTypeName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEventTypeName" runat="server" Text='<%# Bind("EventTypeName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDefaultTypeEdit" runat="server" controlname="lblDefaultType" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDefaultType" runat="server" Text='<%# Bind("DefaultType") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDefaultType" CssClass="NormalRed" runat="server" resourcekey="valDefaultType.ErrorMessage" ControlToValidate="txtDefaultType" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="UpdateEventTypesItemButton" runat="server" 
                 CausesValidation="True" CommandName="Update"
                 Text="Save" OnClick="UpdateEventTypesItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="UpdateEventTypesCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="UpdateEventTypesCancelButton_Click">
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
        <td class="SubHead"><dnn:label id="lblEventTypeName" runat="server" controlname="lblEventTypeName" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtEventTypeName" runat="server" Text='<%# Bind("EventTypeName") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDefaultType" runat="server" controlname="lblDefaultType" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDefaultType" runat="server" Text='<%# Bind("DefaultType") %>' EnableViewState="False"></asp:TextBox><asp:comparevalidator id="comDefaultType" CssClass="NormalRed" runat="server" resourcekey="valDefaultType.ErrorMessage" ControlToValidate="txtDefaultType" Display="Dynamic" ErrorMessage="Not Integer" Type="Integer" Operator="DataTypeCheck" /></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertEventTypesItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Save" OnClick="InsertEventTypesItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertEventTypesCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertEventTypesCancelButton_Click">
             </asp:LinkButton>
         </p>
    </InsertItemTemplate>
    <ItemTemplate>
	<table>
        <tr><td></td>
		<td><asp:TextBox ID="txtPortalIdView" runat="server" Text='<%# Bind("PortalId") %>' Visible="False"></asp:TextBox></td>
		</tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblEventTypeNameView" runat="server" controlname="lblEventTypeNameView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtEventTypeNameView" runat="server" Text='<%# Eval("EventTypeName") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDefaultTypeView" runat="server" controlname="lblDefaultTypeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtDefaultTypeView" runat="server" Text='<%# Eval("DefaultType") %>' /></td>
        </tr>
       </table> 
         <p>
			 <asp:LinkButton ID="EditEventTypesItemButton" runat="server" 
                 CausesValidation="True" CommandName="Edit" Enabled="<%# IsEditable %>"  Visible="<%# IsEditable %>"
                 Text="Edit" OnClick="EditEventTypesItemButton_Click">
             </asp:LinkButton>&nbsp;
         </p>
    </ItemTemplate>
	<EmptyDataTemplate>
        There are no EventTypes Records
    </EmptyDataTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="EventTypesDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.EventTypesInfo"
    DeleteMethod="DeleteEventTypes" 
    InsertMethod="AddEventTypes" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetEventTypes" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateEventTypes"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="00" Name="EventTypeId" QueryStringField="EventTypeId" Type="Int32" />
	</SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="EventTypeId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EventTypeName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultType" Type="Int16" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="EventTypeId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="EventTypeName" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultType" Type="Int16" ConvertEmptyStringToNull="true" />
	</UpdateParameters>
</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
