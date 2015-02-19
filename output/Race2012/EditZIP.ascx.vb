Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class EditZIP
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents FormZIP As System.Web.UI.WebControls.FormView
        Protected WithEvents ZIPDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridZIP As System.Web.UI.WebControls.GridView
        Protected WithEvents AddZIPItemButton As System.Web.UI.WebControls.Button

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddZIPItemButton.Enabled = True
            Else
                AddZIPItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetZIPPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ZIPDataSource.Selecting
		End Sub

        Protected Sub InsertingZIPItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormZIP.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub AddZIPItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddZIPItemButton.Click
            Me.FormZIP.Visible = True
        End Sub

        Protected Sub InsertZIPItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormZIP.Visible = False
            AddZIPItemButton.Text = "ZIP Successfully Added - Click To Add Another"
        End Sub

        Protected Sub InsertZIPCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormZIP.Visible = False
        End Sub

        Protected Sub GridZIP_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridZIP.PageIndexChanging
            GridZIP.PageIndex = e.NewPageIndex
        End Sub
		
		Protected Sub GridZIP_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridZIP.RowDataBound

        End Sub
		
		Protected Sub GridZIP_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridZIP.RowUpdating
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
