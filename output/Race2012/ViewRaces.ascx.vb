Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewRaces
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormRaces As System.Web.UI.WebControls.FormView
        Protected WithEvents RacesDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridRaces As System.Web.UI.WebControls.GridView
        Protected WithEvents AddRacesItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _raceId as Integer

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine RaceId to display
            If Not (Request.QueryString("RaceId") Is Nothing) Then
            	_RaceId = Int32.Parse(Request.QueryString("RaceId"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddRacesItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormRaces.ChangeMode(FormViewMode.Insert)
                        Me.AddRacesItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormRaces.ChangeMode(FormViewMode.Edit)
                        Me.AddRacesItemButton.Visible = False
                    End If
                End If
           	Else
                AddRacesItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetRacesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles RacesDataSource.Selecting
        End Sub

        Protected Sub FormRaces_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormRaces.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormRaces_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormRaces.ItemInserted
            Me.FormRaces.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddRacesItemButton.Visible = True
         End Sub

        Protected Sub FormRaces_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormRaces.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormRaces_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormRaces.ItemUpdated
            Me.FormRaces.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddRacesItemButton.Visible = True
        End Sub

        Protected Sub AddRacesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddRacesItemButton.Click
            Me.FormRaces.ChangeMode(FormViewMode.Insert)
            Me.AddRacesItemButton.Visible = False
        End Sub

        Protected Sub InsertRacesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddRacesItemButton.Visible = False
        End Sub

        Protected Sub InsertRacesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormRaces.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddRacesItemButton.Visible = True
        End Sub

		Protected Sub UpdateRacesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditRacesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormRaces.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddRacesItemButton.Visible = True
        End Sub

        Protected Sub UpdateRacesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormRaces.ChangeMode(FormViewMode.ReadOnly)
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
