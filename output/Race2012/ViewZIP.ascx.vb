Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewZIP
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormZIP As System.Web.UI.WebControls.FormView
        Protected WithEvents ZIPDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridZIP As System.Web.UI.WebControls.GridView
        Protected WithEvents AddZIPItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _fiveDigitZIP as String = string.Empty
		Private _sequence as short

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine FiveDigitZIP to display
            If Not (Request.QueryString("FiveDigitZIP") Is Nothing) Then
            	_FiveDigitZIP = Trim(Request.QueryString("FiveDigitZIP"))
        	End If
		    ' Determine Sequence to display
            If Not (Request.QueryString("Sequence") Is Nothing) Then
            	_Sequence = Int16.Parse(Request.QueryString("Sequence"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddZIPItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormZIP.ChangeMode(FormViewMode.Insert)
                        Me.AddZIPItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormZIP.ChangeMode(FormViewMode.Edit)
                        Me.AddZIPItemButton.Visible = False
                    End If
                End If
           	Else
                AddZIPItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetZIPPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ZIPDataSource.Selecting
        End Sub

        Protected Sub FormZIP_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormZIP.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormZIP_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormZIP.ItemInserted
            Me.FormZIP.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddZIPItemButton.Visible = True
         End Sub

        Protected Sub FormZIP_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormZIP.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormZIP_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormZIP.ItemUpdated
            Me.FormZIP.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddZIPItemButton.Visible = True
        End Sub

        Protected Sub AddZIPItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddZIPItemButton.Click
            Me.FormZIP.ChangeMode(FormViewMode.Insert)
            Me.AddZIPItemButton.Visible = False
        End Sub

        Protected Sub InsertZIPItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddZIPItemButton.Visible = False
        End Sub

        Protected Sub InsertZIPCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormZIP.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddZIPItemButton.Visible = True
        End Sub

		Protected Sub UpdateZIPItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditZIPItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormZIP.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddZIPItemButton.Visible = True
        End Sub

        Protected Sub UpdateZIPCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormZIP.ChangeMode(FormViewMode.ReadOnly)
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
