Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports DotNetNuke.Common.Globals
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ListRaces
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents RacesDataSource As System.Web.UI.WebControls.ObjectDataSource

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                '
            Else
                '
            End If
        End Sub


        Protected Sub SetRacesPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles RacesDataSource.Selecting
        End Sub
		
		Protected Sub ListViewRaces_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs)
            Dim dataItem As ListViewDataItem = CType(e.Item, ListViewDataItem)
			
            If (e.Item.ItemType = ListViewItemType.DataItem) Then
			    Dim rowView As RacesInfo = CType(dataItem.DataItem, RacesInfo)

 				Dim lblEventType As Label = _
                    CType(e.Item.FindControl("lblEventType"), Label)	
 				Dim lblRaceName As Label = _
                    CType(e.Item.FindControl("lblRaceName"), Label)	
 				Dim lblRaceDate As Label = _
                    CType(e.Item.FindControl("lblRaceDate"), Label)	
 				Dim lblRaceDistance As Label = _
                    CType(e.Item.FindControl("lblRaceDistance"), Label)	
 				Dim lblRaceLocation As Label = _
                    CType(e.Item.FindControl("lblRaceLocation"), Label)	
 				Dim lblRaceCity As Label = _
                    CType(e.Item.FindControl("lblRaceCity"), Label)	
 				Dim lblRaceState As Label = _
                    CType(e.Item.FindControl("lblRaceState"), Label)	
 				Dim lblRaceCountry As Label = _
                    CType(e.Item.FindControl("lblRaceCountry"), Label)	
 				Dim lblRaceLogo As Label = _
                    CType(e.Item.FindControl("lblRaceLogo"), Label)	
 				Dim lblUSATFNumber As Label = _
                    CType(e.Item.FindControl("lblUSATFNumber"), Label)	
 				Dim lblRodaleEventId As Label = _
                    CType(e.Item.FindControl("lblRodaleEventId"), Label)	
 				Dim lblActiveEventId As Label = _
                    CType(e.Item.FindControl("lblActiveEventId"), Label)	
 				Dim lblPreregistrationDate As Label = _
                    CType(e.Item.FindControl("lblPreregistrationDate"), Label)	
 				Dim lblPreregistrationFee As Label = _
                    CType(e.Item.FindControl("lblPreregistrationFee"), Label)	
 				Dim lblRaceDayFee As Label = _
                    CType(e.Item.FindControl("lblRaceDayFee"), Label)	
 				Dim lblRegistrationURL As Label = _
                    CType(e.Item.FindControl("lblRegistrationURL"), Label)	
 				Dim lblRegistrationLogo As Label = _
                    CType(e.Item.FindControl("lblRegistrationLogo"), Label)	
 				Dim lblDescription As Label = _
                    CType(e.Item.FindControl("lblDescription"), Label)	
 				Dim lblEmailText As Label = _
                    CType(e.Item.FindControl("lblEmailText"), Label)	
 				Dim lblResultsText As Label = _
                    CType(e.Item.FindControl("lblResultsText"), Label)	
 				Dim lblResultsURL As Label = _
                    CType(e.Item.FindControl("lblResultsURL"), Label)	
 				Dim lblAnnual As Label = _
                    CType(e.Item.FindControl("lblAnnual"), Label)	
 				Dim lblKeyword As Label = _
                    CType(e.Item.FindControl("lblKeyword"), Label)	
 				Dim lblLastBibNumber As Label = _
                    CType(e.Item.FindControl("lblLastBibNumber"), Label)	
 				Dim lblContactName As Label = _
                    CType(e.Item.FindControl("lblContactName"), Label)	
 				Dim lblContactAddress1 As Label = _
                    CType(e.Item.FindControl("lblContactAddress1"), Label)	
 				Dim lblContactAddress2 As Label = _
                    CType(e.Item.FindControl("lblContactAddress2"), Label)	
 				Dim lblContactCity As Label = _
                    CType(e.Item.FindControl("lblContactCity"), Label)	
 				Dim lblContactState As Label = _
                    CType(e.Item.FindControl("lblContactState"), Label)	
 				Dim lblContactZIP As Label = _
                    CType(e.Item.FindControl("lblContactZIP"), Label)	
 				Dim lblContactPhoneNumber As Label = _
                    CType(e.Item.FindControl("lblContactPhoneNumber"), Label)	
 				Dim lblContactFAX As Label = _
                    CType(e.Item.FindControl("lblContactFAX"), Label)	
 				Dim lblContactEMail As Label = _
                    CType(e.Item.FindControl("lblContactEMail"), Label)	
 				Dim lblWEBSite As Label = _
                    CType(e.Item.FindControl("lblWEBSite"), Label)	
 				Dim lblRelatedRace As Label = _
                    CType(e.Item.FindControl("lblRelatedRace"), Label)	
 				Dim lblOrganization As Label = _
                    CType(e.Item.FindControl("lblOrganization"), Label)	
 				Dim lblVolunteerContact As Label = _
                    CType(e.Item.FindControl("lblVolunteerContact"), Label)	
 				Dim lblVolunteerPhone As Label = _
                    CType(e.Item.FindControl("lblVolunteerPhone"), Label)	
 				Dim lblVolunteerEmail As Label = _
                    CType(e.Item.FindControl("lblVolunteerEmail"), Label)	
 				Dim lblDisplayStartDate As Label = _
                    CType(e.Item.FindControl("lblDisplayStartDate"), Label)	
 				Dim lblDisplayEndDate As Label = _
                    CType(e.Item.FindControl("lblDisplayEndDate"), Label)	
 				Dim lblInsertionDate As Label = _
                    CType(e.Item.FindControl("lblInsertionDate"), Label)	
 				Dim lblModificationDate As Label = _
                    CType(e.Item.FindControl("lblModificationDate"), Label)	
            End If
        End Sub

        Protected Sub ListViewRaces_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs)

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
