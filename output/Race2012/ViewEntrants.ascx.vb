Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ViewEntrants
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
		
#Region "Private Members"
        Protected WithEvents FormEntrants As System.Web.UI.WebControls.FormView
        Protected WithEvents EntrantsDataSource As System.Web.UI.WebControls.ObjectDataSource
        Protected WithEvents GridEntrants As System.Web.UI.WebControls.GridView
        Protected WithEvents AddEntrantsItemButton As System.Web.UI.WebControls.Button
        Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
        Protected WithEvents btnSearch As System.Web.UI.WebControls.ImageButton

		Private _runnerId as Integer

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		
		    ' Determine RunnerId to display
            If Not (Request.QueryString("RunnerId") Is Nothing) Then
            	_RunnerId = Int32.Parse(Request.QueryString("RunnerId"))
        	End If

            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                AddEntrantsItemButton.Enabled = True
				
                 If Not (Request.QueryString("Mode") Is Nothing) Then
                    If Request.QueryString("Mode").ToString = "Insert" Then
                        Me.FormEntrants.ChangeMode(FormViewMode.Insert)
                        Me.AddEntrantsItemButton.Visible = False
                    End If
					
                    If Request.QueryString("Mode").ToString = "Update" Then
                        Me.FormEntrants.ChangeMode(FormViewMode.Edit)
                        Me.AddEntrantsItemButton.Visible = False
                    End If
                End If
           	Else
                AddEntrantsItemButton.Enabled = False
            End If
        End Sub

        Protected Sub SetEntrantsPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles EntrantsDataSource.Selecting
        End Sub

        Protected Sub FormEntrants_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormEntrants.ItemInserting
			e.Values.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormEntrants_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormEntrants.ItemInserted
            Me.FormEntrants.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertSuccess", Me.LocalResourceFile)
            Me.AddEntrantsItemButton.Visible = True
         End Sub

        Protected Sub FormEntrants_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormEntrants.ItemUpdating
			e.NewValues.Item("PortalId") = PortalId.ToString()
        End Sub

        Protected Sub FormEntrants_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormEntrants.ItemUpdated
            Me.FormEntrants.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("UpdateSuccess", Me.LocalResourceFile)
            Me.AddEntrantsItemButton.Visible = True
        End Sub

        Protected Sub AddEntrantsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddEntrantsItemButton.Click
            Me.FormEntrants.ChangeMode(FormViewMode.Insert)
            Me.AddEntrantsItemButton.Visible = False
        End Sub

        Protected Sub InsertEntrantsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddEntrantsItemButton.Visible = False
        End Sub

        Protected Sub InsertEntrantsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEntrants.ChangeMode(FormViewMode.ReadOnly)
            lblStatus.Text = Localization.GetString("InsertCancel", Me.LocalResourceFile)
            Me.AddEntrantsItemButton.Visible = True
        End Sub

		Protected Sub UpdateEntrantsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub EditEntrantsItemButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEntrants.ChangeMode(FormViewMode.Edit)
            lblStatus.Text = Localization.GetString("CompleteSave", Me.LocalResourceFile)
            Me.AddEntrantsItemButton.Visible = True
        End Sub

        Protected Sub UpdateEntrantsCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.FormEntrants.ChangeMode(FormViewMode.ReadOnly)
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
