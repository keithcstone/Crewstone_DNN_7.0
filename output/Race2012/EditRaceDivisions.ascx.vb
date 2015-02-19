Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditRaceDivisions
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormRaceDivisions As System.Web.UI.WebControls.FormView
        Protected WithEvents RaceDivisionsDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridRaceDivisions As System.Web.UI.WebControls.GridView
        Protected WithEvents AddRaceDivisionsItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddRaceDivisionsItemButton.Enabled = True
            Else
                AddRaceDivisionsItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetRaceDivisionsPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles RaceDivisionsDataSource.Selecting
		End Sub

        Protected Sub InsertingRaceDivisionsItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormRaceDivisions.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddRaceDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddRaceDivisionsItemButton.Click
            Me.FormRaceDivisions.Visible = True
        End Sub

        Protected Sub InsertRaceDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormRaceDivisions.Visible = False
            AddRaceDivisionsItemButton.Text = "RaceDivisions Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertRaceDivisionsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormRaceDivisions.Visible = False
        End Sub

        Protected Sub GridRaceDivisions_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridRaceDivisions.PageIndexChanging
            GridRaceDivisions.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridRaceDivisions_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridRaceDivisions.RowDataBound

        End Sub
		
		Protected Sub GridRaceDivisions_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridRaceDivisions.RowUpdating
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
