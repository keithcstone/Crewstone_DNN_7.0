Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewDivisions
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormDivisions As System.Web.UI.WebControls.FormView
        Protected WithEvents DivisionsDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridDivisions As System.Web.UI.WebControls.GridView
        Protected WithEvents AddDivisionsItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _division as String = string.Empty

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine Division to display
            If Not (Request.QueryString("Division") Is Nothing) Then
            	_Division = Trim(Request.QueryString("Division"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddDivisionsItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormDivisions.ChangeMode(FormViewMode.Insert)
                        Me.AddDivisionsItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormDivisions.ChangeMode(FormViewMode.Edit)
                        Me.AddDivisionsItemButton.Visible = False
                    End If
                End If
           	Else
                AddDivisionsItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetDivisionsPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles DivisionsDataSource.Selecting
        End Sub

        Protected Sub FormDivisions_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormDivisions.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormDivisions_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormDivisions.ItemInserted
            Me.FormDivisions.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddDivisionsItemButton.Visible = True
         End Sub

        Protected Sub FormDivisions_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormDivisions.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormDivisions_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormDivisions.ItemUpdated
            Me.FormDivisions.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddDivisionsItemButton.Visible = True
        End Sub

        Protected Sub AddDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddDivisionsItemButton.Click
            Me.FormDivisions.ChangeMode(FormViewMode.Insert)
            Me.AddDivisionsItemButton.Visible = False
        End Sub

        Protected Sub InsertDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddDivisionsItemButton.Visible = False
        End Sub

        Protected Sub InsertDivisionsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormDivisions.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddDivisionsItemButton.Visible = True
        End Sub

		Protected Sub UpdateDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditDivisionsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormDivisions.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddDivisionsItemButton.Visible = True
        End Sub

        Protected Sub UpdateDivisionsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormDivisions.ChangeMode(FormViewMode.ReadOnly)
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
