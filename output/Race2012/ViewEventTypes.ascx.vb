Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewEventTypes
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormEventTypes As System.Web.UI.WebControls.FormView
        Protected WithEvents EventTypesDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridEventTypes As System.Web.UI.WebControls.GridView
        Protected WithEvents AddEventTypesItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _eventTypeId as Integer

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine EventTypeId to display
            If Not (Request.QueryString("EventTypeId") Is Nothing) Then
            	_EventTypeId = Int32.Parse(Request.QueryString("EventTypeId"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddEventTypesItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormEventTypes.ChangeMode(FormViewMode.Insert)
                        Me.AddEventTypesItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormEventTypes.ChangeMode(FormViewMode.Edit)
                        Me.AddEventTypesItemButton.Visible = False
                    End If
                End If
           	Else
                AddEventTypesItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetEventTypesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles EventTypesDataSource.Selecting
        End Sub

        Protected Sub FormEventTypes_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormEventTypes.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormEventTypes_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormEventTypes.ItemInserted
            Me.FormEventTypes.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddEventTypesItemButton.Visible = True
         End Sub

        Protected Sub FormEventTypes_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormEventTypes.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormEventTypes_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormEventTypes.ItemUpdated
            Me.FormEventTypes.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddEventTypesItemButton.Visible = True
        End Sub

        Protected Sub AddEventTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddEventTypesItemButton.Click
            Me.FormEventTypes.ChangeMode(FormViewMode.Insert)
            Me.AddEventTypesItemButton.Visible = False
        End Sub

        Protected Sub InsertEventTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddEventTypesItemButton.Visible = False
        End Sub

        Protected Sub InsertEventTypesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEventTypes.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddEventTypesItemButton.Visible = True
        End Sub

		Protected Sub UpdateEventTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditEventTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEventTypes.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddEventTypesItemButton.Visible = True
        End Sub

        Protected Sub UpdateEventTypesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEventTypes.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateCancel", Me.LocalResourceFile)
        End Sub

        Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSearch.Click

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
