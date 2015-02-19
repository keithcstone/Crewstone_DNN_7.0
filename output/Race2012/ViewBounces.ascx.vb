Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewBounces
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormBounces As System.Web.UI.WebControls.FormView
        Protected WithEvents BouncesDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridBounces As System.Web.UI.WebControls.GridView
        Protected WithEvents AddBouncesItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _eMail as String = string.Empty

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine EMail to display
            If Not (Request.QueryString("EMail") Is Nothing) Then
            	_EMail = Trim(Request.QueryString("EMail"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddBouncesItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormBounces.ChangeMode(FormViewMode.Insert)
                        Me.AddBouncesItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormBounces.ChangeMode(FormViewMode.Edit)
                        Me.AddBouncesItemButton.Visible = False
                    End If
                End If
           	Else
                AddBouncesItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetBouncesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles BouncesDataSource.Selecting
        End Sub

        Protected Sub FormBounces_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormBounces.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormBounces_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormBounces.ItemInserted
            Me.FormBounces.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddBouncesItemButton.Visible = True
         End Sub

        Protected Sub FormBounces_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormBounces.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormBounces_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormBounces.ItemUpdated
            Me.FormBounces.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddBouncesItemButton.Visible = True
        End Sub

        Protected Sub AddBouncesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddBouncesItemButton.Click
            Me.FormBounces.ChangeMode(FormViewMode.Insert)
            Me.AddBouncesItemButton.Visible = False
        End Sub

        Protected Sub InsertBouncesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddBouncesItemButton.Visible = False
        End Sub

        Protected Sub InsertBouncesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormBounces.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddBouncesItemButton.Visible = True
        End Sub

		Protected Sub UpdateBouncesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditBouncesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormBounces.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddBouncesItemButton.Visible = True
        End Sub

        Protected Sub UpdateBouncesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormBounces.ChangeMode(FormViewMode.ReadOnly)
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
