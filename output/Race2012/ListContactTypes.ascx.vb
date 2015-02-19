﻿Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports DotNetNuke.Common.Globals
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ListContactTypes
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents ContactTypesDataSource As System.Web.UI.WebControls.ObjectDataSource

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                '
            Else
                '
            End If
        End Sub


        Protected Sub SetContactTypesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ContactTypesDataSource.Selecting
        End Sub
		
		Protected Sub ListViewContactTypes_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs)
            Dim dataItem As ListViewDataItem = CType(e.Item, ListViewDataItem)
			
            If (e.Item.ItemType = ListViewItemType.DataItem) Then
			    Dim rowView As ContactTypesInfo = CType(dataItem.DataItem, ContactTypesInfo)

 				Dim lblAbbreviation As Label = _
                    CType(e.Item.FindControl("lblAbbreviation"), Label)	
 				Dim lblDescription As Label = _
                    CType(e.Item.FindControl("lblDescription"), Label)	
 				Dim lblDefaultType As Label = _
                    CType(e.Item.FindControl("lblDefaultType"), Label)	
            End If
        End Sub

        Protected Sub ListViewContactTypes_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs)

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