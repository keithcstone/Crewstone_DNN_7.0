﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ViewContactTypes.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.ViewContactTypes" %>
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
				<asp:ListItem Value="Abbreviation">Abbreviation</asp:ListItem>
				<asp:ListItem Value="Description">Description</asp:ListItem>
				<asp:ListItem Value="DefaultType">DefaultType</asp:ListItem>
			</asp:DropDownList>
			<asp:imagebutton id="btnSearch" Runat="server" ImageUrl="~/images/icon_search_16px.gif"></asp:imagebutton>
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
</table>
<br />
<asp:Button ID="AddContactTypesItemButton" runat="server" EnableViewState="False">Add ContactTypes</asp:Button>
<br /><br /><asp:label id="lblStatus" runat="server" /><br /><br />
<asp:FormView ID="FormContactTypes" runat="server" 
	DataKeyNames="contactType" 
	DataSourceID="ContactTypesDataSource"
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
        <td class="SubHead"><dnn:label id="lblAbbreviationEdit" runat="server" controlname="lblAbbreviation" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAbbreviation" runat="server" Text='<%# Bind("Abbreviation") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDescriptionEdit" runat="server" controlname="lblDescription" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDefaultTypeEdit" runat="server" controlname="lblDefaultType" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtDefaultType" runat="server" Checked='<%# Bind("DefaultType") %>' /></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="UpdateContactTypesItemButton" runat="server" 
                 CausesValidation="True" CommandName="Update"
                 Text="Save" OnClick="UpdateContactTypesItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="UpdateContactTypesCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="UpdateContactTypesCancelButton_Click">
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
        <td class="SubHead"><dnn:label id="lblAbbreviation" runat="server" controlname="lblAbbreviation" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtAbbreviation" runat="server" Text='<%# Bind("Abbreviation") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDescription" runat="server" controlname="lblDescription" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' EnableViewState="False"></asp:TextBox></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDefaultType" runat="server" controlname="lblDefaultType" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:checkbox id="txtDefaultType" runat="server" Checked='<%# Bind("DefaultType") %>' /></td>
        </tr>
       </table> 
         <p>
             <asp:LinkButton ID="InsertContactTypesItemButton" runat="server" 
                 CausesValidation="True" CommandName="Insert"
                 Text="Save" OnClick="InsertContactTypesItemButton_Click">
             </asp:LinkButton>&nbsp;
             <asp:LinkButton ID="InsertContactTypesCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel"
                 Text="Cancel" OnClick="InsertContactTypesCancelButton_Click">
             </asp:LinkButton>
         </p>
    </InsertItemTemplate>
    <ItemTemplate>
	<table>
        <tr><td></td>
		<td><asp:TextBox ID="txtPortalIdView" runat="server" Text='<%# Bind("PortalId") %>' Visible="False"></asp:TextBox></td>
		</tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblAbbreviationView" runat="server" controlname="lblAbbreviationView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtAbbreviationView" runat="server" Text='<%# Eval("Abbreviation") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDescriptionView" runat="server" controlname="lblDescriptionView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtDescriptionView" runat="server" Text='<%# Eval("Description") %>' /></td>
        </tr>
        <tr>
        <td class="SubHead"><dnn:label id="lblDefaultTypeView" runat="server" controlname="lblDefaultTypeView" suffix=":"></dnn:label></td>
        <td class="Normal"><asp:Label ID="txtDefaultTypeView" runat="server" Text='<%# Eval("DefaultType") %>' /></td>
        </tr>
       </table> 
         <p>
			 <asp:LinkButton ID="EditContactTypesItemButton" runat="server" 
                 CausesValidation="True" CommandName="Edit" Enabled="<%# IsEditable %>"  Visible="<%# IsEditable %>"
                 Text="Edit" OnClick="EditContactTypesItemButton_Click">
             </asp:LinkButton>&nbsp;
         </p>
    </ItemTemplate>
	<EmptyDataTemplate>
        There are no ContactTypes Records
    </EmptyDataTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="ContactTypesDataSource" runat="server" 
    DataObjectTypeName="Crewstone Consulting ltd.Modules.Race2012.ContactTypesInfo"
    DeleteMethod="DeleteContactTypes" 
    InsertMethod="AddContactTypes" 
    OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetContactTypes" 
    TypeName="Crewstone Consulting ltd.Modules.Race2012.Race2012Controller"
    UpdateMethod="UpdateContactTypes"
	ConvertNullToDBNull="true">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="00" Name="ContactType" QueryStringField="ContactType" Type="Int32" />
	</SelectParameters>
    <InsertParameters>
		<asp:Parameter Name="ContactType" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Abbreviation" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultType" Type="Boolean" ConvertEmptyStringToNull="true" />
	</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="ContactType" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="PortalId" Type="Int32" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Abbreviation" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="true" />
		<asp:Parameter Name="DefaultType" Type="Boolean" ConvertEmptyStringToNull="true" />
	</UpdateParameters>
</asp:ObjectDataSource>

<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ceHidden" />
