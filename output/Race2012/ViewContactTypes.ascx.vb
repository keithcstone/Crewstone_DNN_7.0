Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewContactTypes
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormContactTypes As System.Web.UI.WebControls.FormView
        Protected WithEvents ContactTypesDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridContactTypes As System.Web.UI.WebControls.GridView
        Protected WithEvents AddContactTypesItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _contactType as Integer

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine ContactType to display
            If Not (Request.QueryString("ContactType") Is Nothing) Then
            	_ContactType = Int32.Parse(Request.QueryString("ContactType"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddContactTypesItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormContactTypes.ChangeMode(FormViewMode.Insert)
                        Me.AddContactTypesItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormContactTypes.ChangeMode(FormViewMode.Edit)
                        Me.AddContactTypesItemButton.Visible = False
                    End If
                End If
           	Else
                AddContactTypesItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetContactTypesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ContactTypesDataSource.Selecting
        End Sub

        Protected Sub FormContactTypes_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormContactTypes.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormContactTypes_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormContactTypes.ItemInserted
            Me.FormContactTypes.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddContactTypesItemButton.Visible = True
         End Sub

        Protected Sub FormContactTypes_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormContactTypes.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormContactTypes_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormContactTypes.ItemUpdated
            Me.FormContactTypes.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddContactTypesItemButton.Visible = True
        End Sub

        Protected Sub AddContactTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddContactTypesItemButton.Click
            Me.FormContactTypes.ChangeMode(FormViewMode.Insert)
            Me.AddContactTypesItemButton.Visible = False
        End Sub

        Protected Sub InsertContactTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddContactTypesItemButton.Visible = False
        End Sub

        Protected Sub InsertContactTypesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormContactTypes.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddContactTypesItemButton.Visible = True
        End Sub

		Protected Sub UpdateContactTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditContactTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormContactTypes.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddContactTypesItemButton.Visible = True
        End Sub

        Protected Sub UpdateContactTypesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormContactTypes.ChangeMode(FormViewMode.ReadOnly)
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
