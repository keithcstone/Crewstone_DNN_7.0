Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports DotNetNuke.Common.Globals
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ListEntrants
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents EntrantsDataSource As System.Web.UI.WebControls.ObjectDataSource

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                '
            Else
                '
            End If
        End Sub


        Protected Sub SetEntrantsPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles EntrantsDataSource.Selecting
        End Sub
		
		Protected Sub ListViewEntrants_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs)
            Dim dataItem As ListViewDataItem = CType(e.Item, ListViewDataItem)
			
            If (e.Item.ItemType = ListViewItemType.DataItem) Then
			    Dim rowView As EntrantsInfo = CType(dataItem.DataItem, EntrantsInfo)

 				Dim lblContactType As Label = _
                    CType(e.Item.FindControl("lblContactType"), Label)	
 				Dim lblFullName As Label = _
                    CType(e.Item.FindControl("lblFullName"), Label)	
 				Dim lblFirstName As Label = _
                    CType(e.Item.FindControl("lblFirstName"), Label)	
 				Dim lblMiddleName As Label = _
                    CType(e.Item.FindControl("lblMiddleName"), Label)	
 				Dim lblLastName As Label = _
                    CType(e.Item.FindControl("lblLastName"), Label)	
 				Dim lblSuffix As Label = _
                    CType(e.Item.FindControl("lblSuffix"), Label)	
 				Dim lblNickname As Label = _
                    CType(e.Item.FindControl("lblNickname"), Label)	
 				Dim lblBirthDate As Label = _
                    CType(e.Item.FindControl("lblBirthDate"), Label)	
 				Dim lblAge As Label = _
                    CType(e.Item.FindControl("lblAge"), Label)	
 				Dim lblWeight As Label = _
                    CType(e.Item.FindControl("lblWeight"), Label)	
 				Dim lblSex As Label = _
                    CType(e.Item.FindControl("lblSex"), Label)	
 				Dim lblTShirt As Label = _
                    CType(e.Item.FindControl("lblTShirt"), Label)	
 				Dim lblSweats As Label = _
                    CType(e.Item.FindControl("lblSweats"), Label)	
 				Dim lblShorts As Label = _
                    CType(e.Item.FindControl("lblShorts"), Label)	
 				Dim lblShoes As Label = _
                    CType(e.Item.FindControl("lblShoes"), Label)	
 				Dim lblShoeStyle As Label = _
                    CType(e.Item.FindControl("lblShoeStyle"), Label)	
 				Dim lblClub As Label = _
                    CType(e.Item.FindControl("lblClub"), Label)	
 				Dim lblAddress As Label = _
                    CType(e.Item.FindControl("lblAddress"), Label)	
 				Dim lblCity As Label = _
                    CType(e.Item.FindControl("lblCity"), Label)	
 				Dim lblState As Label = _
                    CType(e.Item.FindControl("lblState"), Label)	
 				Dim lblZIP As Label = _
                    CType(e.Item.FindControl("lblZIP"), Label)	
 				Dim lblCountry As Label = _
                    CType(e.Item.FindControl("lblCountry"), Label)	
 				Dim lblHomePhone As Label = _
                    CType(e.Item.FindControl("lblHomePhone"), Label)	
 				Dim lblMobilePhone As Label = _
                    CType(e.Item.FindControl("lblMobilePhone"), Label)	
 				Dim lblMobileCarrier As Label = _
                    CType(e.Item.FindControl("lblMobileCarrier"), Label)	
 				Dim lblEMail As Label = _
                    CType(e.Item.FindControl("lblEMail"), Label)	
 				Dim lblPlainText As Label = _
                    CType(e.Item.FindControl("lblPlainText"), Label)	
 				Dim lblUSATFNumber As Label = _
                    CType(e.Item.FindControl("lblUSATFNumber"), Label)	
 				Dim lblMemberType As Label = _
                    CType(e.Item.FindControl("lblMemberType"), Label)	
 				Dim lblMemberNumber As Label = _
                    CType(e.Item.FindControl("lblMemberNumber"), Label)	
 				Dim lblMemberCode As Label = _
                    CType(e.Item.FindControl("lblMemberCode"), Label)	
 				Dim lblDateJoined As Label = _
                    CType(e.Item.FindControl("lblDateJoined"), Label)	
 				Dim lblLastRenewal As Label = _
                    CType(e.Item.FindControl("lblLastRenewal"), Label)	
 				Dim lblPaidThru As Label = _
                    CType(e.Item.FindControl("lblPaidThru"), Label)	
 				Dim lblWaiver As Label = _
                    CType(e.Item.FindControl("lblWaiver"), Label)	
 				Dim lblPrimaryNo As Label = _
                    CType(e.Item.FindControl("lblPrimaryNo"), Label)	
 				Dim lblSurvivor As Label = _
                    CType(e.Item.FindControl("lblSurvivor"), Label)	
 				Dim lblMailingExpiration As Label = _
                    CType(e.Item.FindControl("lblMailingExpiration"), Label)	
 				Dim lblMemo As Label = _
                    CType(e.Item.FindControl("lblMemo"), Label)	
 				Dim lblMarked As Label = _
                    CType(e.Item.FindControl("lblMarked"), Label)	
 				Dim lblKeywords As Label = _
                    CType(e.Item.FindControl("lblKeywords"), Label)	
 				Dim lblCompany As Label = _
                    CType(e.Item.FindControl("lblCompany"), Label)	
 				Dim lblTitle As Label = _
                    CType(e.Item.FindControl("lblTitle"), Label)	
 				Dim lblWorkAddress As Label = _
                    CType(e.Item.FindControl("lblWorkAddress"), Label)	
 				Dim lblWorkCity As Label = _
                    CType(e.Item.FindControl("lblWorkCity"), Label)	
 				Dim lblWorkState As Label = _
                    CType(e.Item.FindControl("lblWorkState"), Label)	
 				Dim lblWorkZip As Label = _
                    CType(e.Item.FindControl("lblWorkZip"), Label)	
 				Dim lblWorkCountry As Label = _
                    CType(e.Item.FindControl("lblWorkCountry"), Label)	
 				Dim lblWorkPhone As Label = _
                    CType(e.Item.FindControl("lblWorkPhone"), Label)	
 				Dim lblWorkEmail As Label = _
                    CType(e.Item.FindControl("lblWorkEmail"), Label)	
 				Dim lblActiveId As Label = _
                    CType(e.Item.FindControl("lblActiveId"), Label)	
 				Dim lblInvalidEmail As Label = _
                    CType(e.Item.FindControl("lblInvalidEmail"), Label)	
 				Dim lblResultsEmailOnly As Label = _
                    CType(e.Item.FindControl("lblResultsEmailOnly"), Label)	
 				Dim lblInvalidAddress As Label = _
                    CType(e.Item.FindControl("lblInvalidAddress"), Label)	
 				Dim lblUserName As Label = _
                    CType(e.Item.FindControl("lblUserName"), Label)	
 				Dim lblPassword As Label = _
                    CType(e.Item.FindControl("lblPassword"), Label)	
 				Dim lblInsertionDate As Label = _
                    CType(e.Item.FindControl("lblInsertionDate"), Label)	
 				Dim lblUpdateDate As Label = _
                    CType(e.Item.FindControl("lblUpdateDate"), Label)	
            End If
        End Sub

        Protected Sub ListViewEntrants_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs)

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
