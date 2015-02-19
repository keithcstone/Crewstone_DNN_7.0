Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports DotNetNuke.Common.Globals
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ListRaceDivisions
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents RaceDivisionsDataSource As System.Web.UI.WebControls.ObjectDataSource

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                '
            Else
                '
            End If
        End Sub


        Protected Sub SetRaceDivisionsPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles RaceDivisionsDataSource.Selecting
        End Sub
		
		Protected Sub ListViewRaceDivisions_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs)
            Dim dataItem As ListViewDataItem = CType(e.Item, ListViewDataItem)
			
            If (e.Item.ItemType = ListViewItemType.DataItem) Then
			    Dim rowView As RaceDivisionsInfo = CType(dataItem.DataItem, RaceDivisionsInfo)

 				Dim lblSex As Label = _
                    CType(e.Item.FindControl("lblSex"), Label)	
 				Dim lblStartAge As Label = _
                    CType(e.Item.FindControl("lblStartAge"), Label)	
 				Dim lblEndAge As Label = _
                    CType(e.Item.FindControl("lblEndAge"), Label)	
 				Dim lblStartWeight As Label = _
                    CType(e.Item.FindControl("lblStartWeight"), Label)	
 				Dim lblEndWeight As Label = _
                    CType(e.Item.FindControl("lblEndWeight"), Label)	
 				Dim lblSurvivor As Label = _
                    CType(e.Item.FindControl("lblSurvivor"), Label)	
 				Dim lblDivision As Label = _
                    CType(e.Item.FindControl("lblDivision"), Label)	
 				Dim lblDepth As Label = _
                    CType(e.Item.FindControl("lblDepth"), Label)	
 				Dim lblOverall As Label = _
                    CType(e.Item.FindControl("lblOverall"), Label)	
 				Dim lblMasters As Label = _
                    CType(e.Item.FindControl("lblMasters"), Label)	
 				Dim lblUSATF As Label = _
                    CType(e.Item.FindControl("lblUSATF"), Label)	
            End If
        End Sub

        Protected Sub ListViewRaceDivisions_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs)

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
