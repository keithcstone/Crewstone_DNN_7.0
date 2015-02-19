Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditRaces
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormRaces As System.Web.UI.WebControls.FormView
        Protected WithEvents RacesDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridRaces As System.Web.UI.WebControls.GridView
        Protected WithEvents AddRacesItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddRacesItemButton.Enabled = True
            Else
                AddRacesItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetRacesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles RacesDataSource.Selecting
		End Sub

        Protected Sub InsertingRacesItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormRaces.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddRacesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddRacesItemButton.Click
            Me.FormRaces.Visible = True
        End Sub

        Protected Sub InsertRacesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormRaces.Visible = False
            AddRacesItemButton.Text = "Races Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertRacesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormRaces.Visible = False
        End Sub

        Protected Sub GridRaces_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridRaces.PageIndexChanging
            GridRaces.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridRaces_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridRaces.RowDataBound

        End Sub
		
		Protected Sub GridRaces_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridRaces.RowUpdating
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
