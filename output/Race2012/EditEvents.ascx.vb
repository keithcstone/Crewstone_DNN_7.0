Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditEvents
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormEvents As System.Web.UI.WebControls.FormView
        Protected WithEvents EventsDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridEvents As System.Web.UI.WebControls.GridView
        Protected WithEvents AddEventsItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddEventsItemButton.Enabled = True
            Else
                AddEventsItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetEventsPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles EventsDataSource.Selecting
		End Sub

        Protected Sub InsertingEventsItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormEvents.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddEventsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddEventsItemButton.Click
            Me.FormEvents.Visible = True
        End Sub

        Protected Sub InsertEventsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEvents.Visible = False
            AddEventsItemButton.Text = "Events Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertEventsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEvents.Visible = False
        End Sub

        Protected Sub GridEvents_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridEvents.PageIndexChanging
            GridEvents.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridEvents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEvents.RowDataBound

        End Sub
		
		Protected Sub GridEvents_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridEvents.RowUpdating
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
