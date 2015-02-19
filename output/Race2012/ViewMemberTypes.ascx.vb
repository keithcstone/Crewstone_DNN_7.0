Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewMemberTypes
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormMemberTypes As System.Web.UI.WebControls.FormView
        Protected WithEvents MemberTypesDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridMemberTypes As System.Web.UI.WebControls.GridView
        Protected WithEvents AddMemberTypesItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _memberTypeID as Integer

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine MemberTypeID to display
            If Not (Request.QueryString("MemberTypeID") Is Nothing) Then
            	_MemberTypeID = Int32.Parse(Request.QueryString("MemberTypeID"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddMemberTypesItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormMemberTypes.ChangeMode(FormViewMode.Insert)
                        Me.AddMemberTypesItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormMemberTypes.ChangeMode(FormViewMode.Edit)
                        Me.AddMemberTypesItemButton.Visible = False
                    End If
                End If
           	Else
                AddMemberTypesItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetMemberTypesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles MemberTypesDataSource.Selecting
        End Sub

        Protected Sub FormMemberTypes_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormMemberTypes.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormMemberTypes_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormMemberTypes.ItemInserted
            Me.FormMemberTypes.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddMemberTypesItemButton.Visible = True
         End Sub

        Protected Sub FormMemberTypes_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormMemberTypes.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormMemberTypes_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormMemberTypes.ItemUpdated
            Me.FormMemberTypes.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddMemberTypesItemButton.Visible = True
        End Sub

        Protected Sub AddMemberTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddMemberTypesItemButton.Click
            Me.FormMemberTypes.ChangeMode(FormViewMode.Insert)
            Me.AddMemberTypesItemButton.Visible = False
        End Sub

        Protected Sub InsertMemberTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddMemberTypesItemButton.Visible = False
        End Sub

        Protected Sub InsertMemberTypesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormMemberTypes.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddMemberTypesItemButton.Visible = True
        End Sub

		Protected Sub UpdateMemberTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditMemberTypesItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormMemberTypes.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddMemberTypesItemButton.Visible = True
        End Sub

        Protected Sub UpdateMemberTypesCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormMemberTypes.ChangeMode(FormViewMode.ReadOnly)
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
