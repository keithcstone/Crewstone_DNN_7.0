Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewRaceDivisions
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormRaceDivisions As System.Web.UI.WebControls.FormView
        Protected WithEvents RaceDivisionsDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridRaceDivisions As System.Web.UI.WebControls.GridView
        Protected WithEvents AddRaceDivisionsItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _raceId as Integer
		Private _priority as Integer

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine RaceId to display
            If Not (Request.QueryString("RaceId") Is Nothing) Then
            	_RaceId = Int32.Parse(Request.QueryString("RaceId"))
        	End If
		    ' Determine Priority to display
            If Not (Request.QueryString("Priority") Is Nothing) Then
            	_Priority = Int32.Parse(Request.QueryString("Priority"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddRaceDivisionsItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormRaceDivisions.ChangeMode(FormViewMode.Insert)
                        Me.AddRaceDivisionsItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormRaceDivisions.ChangeMode(FormViewMode.Edit)
                        Me.AddRaceDivisionsItemButton.Visible = False
                    End If
                End If
           	Else
                AddRaceDivisionsItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetRaceDivisionsPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles RaceDivisionsDataSource.Selecting
        End Sub

        Protected Sub FormRaceDivisions_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormRaceDivisions.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormRaceDivisions_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormRaceDivisions.ItemInserted
            Me.FormRaceDivisions.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddRaceDivisionsItemButton.Visible = True
         End Sub

        Protected Sub FormRaceDivisions_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormRaceDivisions.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormRaceDivisions_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormRaceDivisions.ItemUpdated
            Me.FormRaceDivisions.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddRaceDivisionsItemButton.Visible = True
        End Sub

        Protected Sub AddRaceDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddRaceDivisionsItemButton.Click
            Me.FormRaceDivisions.ChangeMode(FormViewMode.Insert)
            Me.AddRaceDivisionsItemButton.Visible = False
        End Sub

        Protected Sub InsertRaceDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddRaceDivisionsItemButton.Visible = False
        End Sub

        Protected Sub InsertRaceDivisionsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormRaceDivisions.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddRaceDivisionsItemButton.Visible = True
        End Sub

		Protected Sub UpdateRaceDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditRaceDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormRaceDivisions.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddRaceDivisionsItemButton.Visible = True
        End Sub

        Protected Sub UpdateRaceDivisionsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormRaceDivisions.ChangeMode(FormViewMode.ReadOnly)
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
