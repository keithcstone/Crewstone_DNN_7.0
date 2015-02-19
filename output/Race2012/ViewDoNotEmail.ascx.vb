Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewDoNotEmail
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormDoNotEmail As System.Web.UI.WebControls.FormView
        Protected WithEvents DoNotEmailDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridDoNotEmail As System.Web.UI.WebControls.GridView
        Protected WithEvents AddDoNotEmailItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _emailAddress as String = string.Empty

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine EmailAddress to display
            If Not (Request.QueryString("EmailAddress") Is Nothing) Then
            	_EmailAddress = Trim(Request.QueryString("EmailAddress"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddDoNotEmailItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormDoNotEmail.ChangeMode(FormViewMode.Insert)
                        Me.AddDoNotEmailItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormDoNotEmail.ChangeMode(FormViewMode.Edit)
                        Me.AddDoNotEmailItemButton.Visible = False
                    End If
                End If
           	Else
                AddDoNotEmailItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetDoNotEmailPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles DoNotEmailDataSource.Selecting
        End Sub

        Protected Sub FormDoNotEmail_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormDoNotEmail.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormDoNotEmail_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormDoNotEmail.ItemInserted
            Me.FormDoNotEmail.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddDoNotEmailItemButton.Visible = True
         End Sub

        Protected Sub FormDoNotEmail_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormDoNotEmail.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormDoNotEmail_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormDoNotEmail.ItemUpdated
            Me.FormDoNotEmail.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddDoNotEmailItemButton.Visible = True
        End Sub

        Protected Sub AddDoNotEmailItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddDoNotEmailItemButton.Click
            Me.FormDoNotEmail.ChangeMode(FormViewMode.Insert)
            Me.AddDoNotEmailItemButton.Visible = False
        End Sub

        Protected Sub InsertDoNotEmailItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddDoNotEmailItemButton.Visible = False
        End Sub

        Protected Sub InsertDoNotEmailCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormDoNotEmail.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddDoNotEmailItemButton.Visible = True
        End Sub

		Protected Sub UpdateDoNotEmailItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditDoNotEmailItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormDoNotEmail.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddDoNotEmailItemButton.Visible = True
        End Sub

        Protected Sub UpdateDoNotEmailCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormDoNotEmail.ChangeMode(FormViewMode.ReadOnly)
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
