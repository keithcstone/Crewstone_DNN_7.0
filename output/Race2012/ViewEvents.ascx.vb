Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewEvents
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormEvents As System.Web.UI.WebControls.FormView
        Protected WithEvents EventsDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridEvents As System.Web.UI.WebControls.GridView
        Protected WithEvents AddEventsItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _runnerId as Integer
		Private _raceId as Integer

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine RunnerId to display
            If Not (Request.QueryString("RunnerId") Is Nothing) Then
            	_RunnerId = Int32.Parse(Request.QueryString("RunnerId"))
        	End If
		    ' Determine RaceId to display
            If Not (Request.QueryString("RaceId") Is Nothing) Then
            	_RaceId = Int32.Parse(Request.QueryString("RaceId"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddEventsItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormEvents.ChangeMode(FormViewMode.Insert)
                        Me.AddEventsItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormEvents.ChangeMode(FormViewMode.Edit)
                        Me.AddEventsItemButton.Visible = False
                    End If
                End If
           	Else
                AddEventsItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetEventsPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles EventsDataSource.Selecting
        End Sub

        Protected Sub FormEvents_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormEvents.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormEvents_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormEvents.ItemInserted
            Me.FormEvents.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddEventsItemButton.Visible = True
         End Sub

        Protected Sub FormEvents_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormEvents.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormEvents_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormEvents.ItemUpdated
            Me.FormEvents.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddEventsItemButton.Visible = True
        End Sub

        Protected Sub AddEventsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddEventsItemButton.Click
            Me.FormEvents.ChangeMode(FormViewMode.Insert)
            Me.AddEventsItemButton.Visible = False
        End Sub

        Protected Sub InsertEventsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddEventsItemButton.Visible = False
        End Sub

        Protected Sub InsertEventsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEvents.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddEventsItemButton.Visible = True
        End Sub

		Protected Sub UpdateEventsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditEventsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEvents.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddEventsItemButton.Visible = True
        End Sub

        Protected Sub UpdateEventsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEvents.ChangeMode(FormViewMode.ReadOnly)
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
