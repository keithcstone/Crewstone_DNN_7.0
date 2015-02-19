<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Settings.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.Settings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="0" cellpadding="2" border="0" summary="Race2012 Settings Design Table">
    <tr>
        <td class="SubHead" width="150">
            <dnn:Label ID="lblTemplate" runat="server" ControlName="txtTemplate" Suffix=":">
            </dnn:Label>
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtTemplate" CssClass="NormalTextBox" Width="390" Columns="30" TextMode="MultiLine"
                Rows="10" MaxLength="2000" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <dnn:Label ID="lblPurgeBeforeImport" runat="server" ControlName="chkPurge" Suffix=":">
            </dnn:Label>
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkPurge" CssClass="NormalTextBox" runat="server" />
        </td>
    </tr>
</table>
