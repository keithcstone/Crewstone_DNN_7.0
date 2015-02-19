Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditDivisions
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormDivisions As System.Web.UI.WebControls.FormView
        Protected WithEvents DivisionsDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridDivisions As System.Web.UI.WebControls.GridView
        Protected WithEvents AddDivisionsItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddDivisionsItemButton.Enabled = True
            Else
                AddDivisionsItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetDivisionsPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles DivisionsDataSource.Selecting
		End Sub

        Protected Sub InsertingDivisionsItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormDivisions.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddDivisionsItemButton.Click
            Me.FormDivisions.Visible = True
        End Sub

        Protected Sub InsertDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormDivisions.Visible = False
            AddDivisionsItemButton.Text = "Divisions Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertDivisionsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormDivisions.Visible = False
        End Sub

        Protected Sub GridDivisions_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridDivisions.PageIndexChanging
            GridDivisions.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridDivisions_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridDivisions.RowDataBound

        End Sub
		
		Protected Sub GridDivisions_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridDivisions.RowUpdating
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
