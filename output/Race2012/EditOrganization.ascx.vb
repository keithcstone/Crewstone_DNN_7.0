Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditOrganization
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormOrganization As System.Web.UI.WebControls.FormView
        Protected WithEvents OrganizationDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridOrganization As System.Web.UI.WebControls.GridView
        Protected WithEvents AddOrganizationItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddOrganizationItemButton.Enabled = True
            Else
                AddOrganizationItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetOrganizationPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles OrganizationDataSource.Selecting
		End Sub

        Protected Sub InsertingOrganizationItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormOrganization.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddOrganizationItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddOrganizationItemButton.Click
            Me.FormOrganization.Visible = True
        End Sub

        Protected Sub InsertOrganizationItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormOrganization.Visible = False
            AddOrganizationItemButton.Text = "Organization Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertOrganizationCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormOrganization.Visible = False
        End Sub

        Protected Sub GridOrganization_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridOrganization.PageIndexChanging
            GridOrganization.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridOrganization_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridOrganization.RowDataBound

        End Sub
		
		Protected Sub GridOrganization_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridOrganization.RowUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub
		
		#Region "Optional Interfaces"
        Public ReadOnly Property ModuleActions() As Entities.Modules.Actions.ModuleActionCollection Implements Entities.Modules.IActionable.ModuleActions
            Get
                Dim Actions As New Entities.Modules.Actions.ModuleActionCollection
                Try
                Catch exc As Exception
                    'ProcessModuleLoadException(Me, exc)
                End Try
                Return Actions
            End Get
        End Property
		#End Region
		
    End Class

End Namespace
