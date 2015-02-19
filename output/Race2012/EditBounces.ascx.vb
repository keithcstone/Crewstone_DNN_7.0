Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditBounces
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormBounces As System.Web.UI.WebControls.FormView
        Protected WithEvents BouncesDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridBounces As System.Web.UI.WebControls.GridView
        Protected WithEvents AddBouncesItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddBouncesItemButton.Enabled = True
            Else
                AddBouncesItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetBouncesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles BouncesDataSource.Selecting
		End Sub

        Protected Sub InsertingBouncesItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormBounces.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddBouncesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddBouncesItemButton.Click
            Me.FormBounces.Visible = True
        End Sub

        Protected Sub InsertBouncesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormBounces.Visible = False
            AddBouncesItemButton.Text = "Bounces Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertBouncesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormBounces.Visible = False
        End Sub

        Protected Sub GridBounces_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridBounces.PageIndexChanging
            GridBounces.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridBounces_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridBounces.RowDataBound

        End Sub
		
		Protected Sub GridBounces_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridBounces.RowUpdating
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
