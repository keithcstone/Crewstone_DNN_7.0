Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditContactTypes
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormContactTypes As System.Web.UI.WebControls.FormView
        Protected WithEvents ContactTypesDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridContactTypes As System.Web.UI.WebControls.GridView
        Protected WithEvents AddContactTypesItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddContactTypesItemButton.Enabled = True
            Else
                AddContactTypesItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetContactTypesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ContactTypesDataSource.Selecting
		End Sub

        Protected Sub InsertingContactTypesItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormContactTypes.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddContactTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddContactTypesItemButton.Click
            Me.FormContactTypes.Visible = True
        End Sub

        Protected Sub InsertContactTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormContactTypes.Visible = False
            AddContactTypesItemButton.Text = "ContactTypes Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertContactTypesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormContactTypes.Visible = False
        End Sub

        Protected Sub GridContactTypes_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridContactTypes.PageIndexChanging
            GridContactTypes.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridContactTypes_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridContactTypes.RowDataBound

        End Sub
		
		Protected Sub GridContactTypes_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridContactTypes.RowUpdating
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
