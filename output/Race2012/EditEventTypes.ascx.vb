Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditEventTypes
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormEventTypes As System.Web.UI.WebControls.FormView
        Protected WithEvents EventTypesDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridEventTypes As System.Web.UI.WebControls.GridView
        Protected WithEvents AddEventTypesItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddEventTypesItemButton.Enabled = True
            Else
                AddEventTypesItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetEventTypesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles EventTypesDataSource.Selecting
		End Sub

        Protected Sub InsertingEventTypesItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormEventTypes.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddEventTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddEventTypesItemButton.Click
            Me.FormEventTypes.Visible = True
        End Sub

        Protected Sub InsertEventTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEventTypes.Visible = False
            AddEventTypesItemButton.Text = "EventTypes Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertEventTypesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEventTypes.Visible = False
        End Sub

        Protected Sub GridEventTypes_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridEventTypes.PageIndexChanging
            GridEventTypes.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridEventTypes_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEventTypes.RowDataBound

        End Sub
		
		Protected Sub GridEventTypes_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridEventTypes.RowUpdating
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
