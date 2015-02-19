<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Race2012.ascx.vb" Inherits="Crewstone Consulting ltd.Modules.Race2012.Race2012Menu" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="0" cellpadding="2" border="0" summary="Race2012 Settings Design Table">
    <tr>
        <td class="SubHead" width="150"><dnn:label id="lblTemplate" runat="server" controlname="txtTemplate" suffix=":"></dnn:label></td>
        <td valign="bottom" >
            <asp:textbox id="txtTemplate" cssclass="NormalTextBox" width="390" columns="30" textmode="MultiLine" rows="10" maxlength="2000" runat="server" />
        </td>
    </tr>

	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblBounces" runat="server" ControlName="hypBounces"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypBounces" runat="server" EnableViewState="False" />
        </td>
    </tr>
	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblContactTypes" runat="server" ControlName="hypContactTypes"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypContactTypes" runat="server" EnableViewState="False" />
        </td>
    </tr>
	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblDivisions" runat="server" ControlName="hypDivisions"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypDivisions" runat="server" EnableViewState="False" />
        </td>
    </tr>
	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblDoNotEmail" runat="server" ControlName="hypDoNotEmail"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypDoNotEmail" runat="server" EnableViewState="False" />
        </td>
    </tr>
	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblEntrants" runat="server" ControlName="hypEntrants"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypEntrants" runat="server" EnableViewState="False" />
        </td>
    </tr>
	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblEvents" runat="server" ControlName="hypEvents"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypEvents" runat="server" EnableViewState="False" />
        </td>
    </tr>
	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblEventTypes" runat="server" ControlName="hypEventTypes"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypEventTypes" runat="server" EnableViewState="False" />
        </td>
    </tr>
	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblMemberTypes" runat="server" ControlName="hypMemberTypes"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypMemberTypes" runat="server" EnableViewState="False" />
        </td>
    </tr>
	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblOrganization" runat="server" ControlName="hypOrganization"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypOrganization" runat="server" EnableViewState="False" />
        </td>
    </tr>
	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblRaceDivisions" runat="server" ControlName="hypRaceDivisions"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypRaceDivisions" runat="server" EnableViewState="False" />
        </td>
    </tr>
	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblRaces" runat="server" ControlName="hypRaces"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypRaces" runat="server" EnableViewState="False" />
        </td>
    </tr>
	    <tr>
        <td class="SubHead" width="25">
            <dnn:Label ID="lblZIP" runat="server" ControlName="hypZIP"
                Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:HyperLink ID="hypZIP" runat="server" EnableViewState="False" />
        </td>
    </tr>
</table>
<asp:LinkButton ID="AddItemButton" runat="server" EnableViewState="False">Add Race2012</asp:LinkButton>

