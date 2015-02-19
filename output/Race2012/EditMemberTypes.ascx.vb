Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditMemberTypes
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormMemberTypes As System.Web.UI.WebControls.FormView
        Protected WithEvents MemberTypesDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridMemberTypes As System.Web.UI.WebControls.GridView
        Protected WithEvents AddMemberTypesItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddMemberTypesItemButton.Enabled = True
            Else
                AddMemberTypesItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetMemberTypesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles MemberTypesDataSource.Selecting
		End Sub

        Protected Sub InsertingMemberTypesItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormMemberTypes.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddMemberTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddMemberTypesItemButton.Click
            Me.FormMemberTypes.Visible = True
        End Sub

        Protected Sub InsertMemberTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormMemberTypes.Visible = False
            AddMemberTypesItemButton.Text = "MemberTypes Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertMemberTypesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormMemberTypes.Visible = False
        End Sub

        Protected Sub GridMemberTypes_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridMemberTypes.PageIndexChanging
            GridMemberTypes.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridMemberTypes_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridMemberTypes.RowDataBound

        End Sub
		
		Protected Sub GridMemberTypes_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridMemberTypes.RowUpdating
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
