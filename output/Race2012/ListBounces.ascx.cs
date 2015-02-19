using DotNetNuke;
using System.Web.UI;
using System.Collections.Generic;
using System.Reflection;
using DotNetNuke.Security.PortalSecurity;

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ListBounces
        Inherits Entities.Modules.PortalModuleBase

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasEditPermissions(ModuleId, TabId) Then
                AddItemButton.Enabled = True
            Else
                AddItemButton.Enabled = False
            End If
        End Sub

        Protected Sub AddItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddItemButton.Click
            Me.FormBounces.Visible = True
        End Sub

        Protected Sub InsertItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormBounces.Visible = False
            AddItemButton.Text = "Bounces Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormBounces.Visible = False
        End Sub

        Protected Sub GridBounces_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridBounces.PageIndexChanging
            GridBounces.PageIndex = e.NewPageIndex
        End Sub

    End Class

End Namespace
