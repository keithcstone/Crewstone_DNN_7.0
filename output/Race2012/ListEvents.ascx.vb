Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports DotNetNuke.Common.Globals
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ListEvents
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents EventsDataSource As System.Web.UI.WebControls.ObjectDataSource

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                '
            Else
                '
            End If
        End Sub


        Protected Sub SetEventsPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles EventsDataSource.Selecting
        End Sub
		
		Protected Sub ListViewEvents_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs)
            Dim dataItem As ListViewDataItem = CType(e.Item, ListViewDataItem)
			
            If (e.Item.ItemType = ListViewItemType.DataItem) Then
			    Dim rowView As EventsInfo = CType(dataItem.DataItem, EventsInfo)

 				Dim lblBibNumber As Label = _
                    CType(e.Item.FindControl("lblBibNumber"), Label)	
 				Dim lblDivision As Label = _
                    CType(e.Item.FindControl("lblDivision"), Label)	
 				Dim lblDivisionPlace As Label = _
                    CType(e.Item.FindControl("lblDivisionPlace"), Label)	
 				Dim lblDivisionTotal As Label = _
                    CType(e.Item.FindControl("lblDivisionTotal"), Label)	
 				Dim lblSexPlace As Label = _
                    CType(e.Item.FindControl("lblSexPlace"), Label)	
 				Dim lblSexTotal As Label = _
                    CType(e.Item.FindControl("lblSexTotal"), Label)	
 				Dim lblGunTime As Label = _
                    CType(e.Item.FindControl("lblGunTime"), Label)	
 				Dim lblNetTime As Label = _
                    CType(e.Item.FindControl("lblNetTime"), Label)	
 				Dim lblPace As Label = _
                    CType(e.Item.FindControl("lblPace"), Label)	
 				Dim lblPlace As Label = _
                    CType(e.Item.FindControl("lblPlace"), Label)	
 				Dim lblSeed As Label = _
                    CType(e.Item.FindControl("lblSeed"), Label)	
 				Dim lblTeam As Label = _
                    CType(e.Item.FindControl("lblTeam"), Label)	
 				Dim lblFee As Label = _
                    CType(e.Item.FindControl("lblFee"), Label)	
 				Dim lblEntryDate As Label = _
                    CType(e.Item.FindControl("lblEntryDate"), Label)	
 				Dim lblClydesdale As Label = _
                    CType(e.Item.FindControl("lblClydesdale"), Label)	
 				Dim lblSurvivor As Label = _
                    CType(e.Item.FindControl("lblSurvivor"), Label)	
 				Dim lblNonCompetitive As Label = _
                    CType(e.Item.FindControl("lblNonCompetitive"), Label)	
 				Dim lblUSATF As Label = _
                    CType(e.Item.FindControl("lblUSATF"), Label)	
 				Dim lblAge As Label = _
                    CType(e.Item.FindControl("lblAge"), Label)	
 				Dim lblSex As Label = _
                    CType(e.Item.FindControl("lblSex"), Label)	
 				Dim lblWeight As Label = _
                    CType(e.Item.FindControl("lblWeight"), Label)	
 				Dim lblHeat As Label = _
                    CType(e.Item.FindControl("lblHeat"), Label)	
 				Dim lblWaveOffset As Label = _
                    CType(e.Item.FindControl("lblWaveOffset"), Label)	
 				Dim lblWAVATime As Label = _
                    CType(e.Item.FindControl("lblWAVATime"), Label)	
 				Dim lblPerformancePercent As Label = _
                    CType(e.Item.FindControl("lblPerformancePercent"), Label)	
 				Dim lblSeriesPlace As Label = _
                    CType(e.Item.FindControl("lblSeriesPlace"), Label)	
 				Dim lblSeriesAge As Label = _
                    CType(e.Item.FindControl("lblSeriesAge"), Label)	
 				Dim lblSeriesDivision As Label = _
                    CType(e.Item.FindControl("lblSeriesDivision"), Label)	
 				Dim lblSeriesPoints As Label = _
                    CType(e.Item.FindControl("lblSeriesPoints"), Label)	
 				Dim lblConfirmation As Label = _
                    CType(e.Item.FindControl("lblConfirmation"), Label)	
 				Dim lblResults As Label = _
                    CType(e.Item.FindControl("lblResults"), Label)	
 				Dim lblChipId As Label = _
                    CType(e.Item.FindControl("lblChipId"), Label)	
 				Dim lblAwardDivision As Label = _
                    CType(e.Item.FindControl("lblAwardDivision"), Label)	
 				Dim lblAwardPlace As Label = _
                    CType(e.Item.FindControl("lblAwardPlace"), Label)	
 				Dim lblAwardPriority As Label = _
                    CType(e.Item.FindControl("lblAwardPriority"), Label)	
            End If
        End Sub

        Protected Sub ListViewEvents_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs)

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
