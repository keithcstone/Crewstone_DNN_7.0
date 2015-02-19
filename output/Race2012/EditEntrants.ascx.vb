Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditEntrants
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormEntrants As System.Web.UI.WebControls.FormView
        Protected WithEvents EntrantsDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridEntrants As System.Web.UI.WebControls.GridView
        Protected WithEvents AddEntrantsItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddEntrantsItemButton.Enabled = True
            Else
                AddEntrantsItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetEntrantsPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles EntrantsDataSource.Selecting
		End Sub

        Protected Sub InsertingEntrantsItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormEntrants.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddEntrantsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddEntrantsItemButton.Click
            Me.FormEntrants.Visible = True
        End Sub

        Protected Sub InsertEntrantsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEntrants.Visible = False
            AddEntrantsItemButton.Text = "Entrants Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertEntrantsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEntrants.Visible = False
        End Sub

        Protected Sub GridEntrants_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridEntrants.PageIndexChanging
            GridEntrants.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridEntrants_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEntrants.RowDataBound

        End Sub
		
		Protected Sub GridEntrants_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridEntrants.RowUpdating
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
