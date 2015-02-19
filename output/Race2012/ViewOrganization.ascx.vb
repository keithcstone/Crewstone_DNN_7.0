Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewOrganization
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormOrganization As System.Web.UI.WebControls.FormView
        Protected WithEvents OrganizationDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridOrganization As System.Web.UI.WebControls.GridView
        Protected WithEvents AddOrganizationItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _orgID as Integer

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine OrgID to display
            If Not (Request.QueryString("OrgID") Is Nothing) Then
            	_OrgID = Int32.Parse(Request.QueryString("OrgID"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddOrganizationItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormOrganization.ChangeMode(FormViewMode.Insert)
                        Me.AddOrganizationItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormOrganization.ChangeMode(FormViewMode.Edit)
                        Me.AddOrganizationItemButton.Visible = False
                    End If
                End If
           	Else
                AddOrganizationItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetOrganizationPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles OrganizationDataSource.Selecting
        End Sub

        Protected Sub FormOrganization_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormOrganization.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormOrganization_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormOrganization.ItemInserted
            Me.FormOrganization.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddOrganizationItemButton.Visible = True
         End Sub

        Protected Sub FormOrganization_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormOrganization.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormOrganization_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormOrganization.ItemUpdated
            Me.FormOrganization.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddOrganizationItemButton.Visible = True
        End Sub

        Protected Sub AddOrganizationItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddOrganizationItemButton.Click
            Me.FormOrganization.ChangeMode(FormViewMode.Insert)
            Me.AddOrganizationItemButton.Visible = False
        End Sub

        Protected Sub InsertOrganizationItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddOrganizationItemButton.Visible = False
        End Sub

        Protected Sub InsertOrganizationCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormOrganization.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddOrganizationItemButton.Visible = True
        End Sub

		Protected Sub UpdateOrganizationItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditOrganizationItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormOrganization.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddOrganizationItemButton.Visible = True
        End Sub

        Protected Sub UpdateOrganizationCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormOrganization.ChangeMode(FormViewMode.ReadOnly)
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
