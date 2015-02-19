Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditDoNotEmail
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormDoNotEmail As System.Web.UI.WebControls.FormView
        Protected WithEvents DoNotEmailDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridDoNotEmail As System.Web.UI.WebControls.GridView
        Protected WithEvents AddDoNotEmailItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddDoNotEmailItemButton.Enabled = True
            Else
                AddDoNotEmailItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetDoNotEmailPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles DoNotEmailDataSource.Selecting
		End Sub

        Protected Sub InsertingDoNotEmailItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormDoNotEmail.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddDoNotEmailItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddDoNotEmailItemButton.Click
            Me.FormDoNotEmail.Visible = True
        End Sub

        Protected Sub InsertDoNotEmailItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormDoNotEmail.Visible = False
            AddDoNotEmailItemButton.Text = "DoNotEmail Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertDoNotEmailCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormDoNotEmail.Visible = False
        End Sub

        Protected Sub GridDoNotEmail_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridDoNotEmail.PageIndexChanging
            GridDoNotEmail.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridDoNotEmail_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridDoNotEmail.RowDataBound

        End Sub
		
		Protected Sub GridDoNotEmail_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridDoNotEmail.RowUpdating
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
