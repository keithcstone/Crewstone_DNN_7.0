Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports DotNetNuke.Common.Globals
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    Partial Class ListOrganization
        Inherits Entities.Modules.PortalModuleBase
		Implements Entities.Modules.IActionable
        
        Protected WithEvents OrganizationDataSource As System.Web.UI.WebControls.ObjectDataSource

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                '
            Else
                '
            End If
        End Sub


        Protected Sub SetOrganizationPortalId(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles OrganizationDataSource.Selecting
        End Sub
		
		Protected Sub ListViewOrganization_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs)
            Dim dataItem As ListViewDataItem = CType(e.Item, ListViewDataItem)
			
            If (e.Item.ItemType = ListViewItemType.DataItem) Then
			    Dim rowView As OrganizationInfo = CType(dataItem.DataItem, OrganizationInfo)

 				Dim lblClubName As Label = _
                    CType(e.Item.FindControl("lblClubName"), Label)	
 				Dim lblAddress As Label = _
                    CType(e.Item.FindControl("lblAddress"), Label)	
 				Dim lblCity As Label = _
                    CType(e.Item.FindControl("lblCity"), Label)	
 				Dim lblStateOrProvince As Label = _
                    CType(e.Item.FindControl("lblStateOrProvince"), Label)	
 				Dim lblPostalCode As Label = _
                    CType(e.Item.FindControl("lblPostalCode"), Label)	
 				Dim lblCountry As Label = _
                    CType(e.Item.FindControl("lblCountry"), Label)	
 				Dim lblDefaultInvoiceDescription As Label = _
                    CType(e.Item.FindControl("lblDefaultInvoiceDescription"), Label)	
 				Dim lblPhoneNumber As Label = _
                    CType(e.Item.FindControl("lblPhoneNumber"), Label)	
 				Dim lblFaxNumber As Label = _
                    CType(e.Item.FindControl("lblFaxNumber"), Label)	
 				Dim lblEMail As Label = _
                    CType(e.Item.FindControl("lblEMail"), Label)	
 				Dim lblNickname As Label = _
                    CType(e.Item.FindControl("lblNickname"), Label)	
 				Dim lblMailingExpirePeriod As Label = _
                    CType(e.Item.FindControl("lblMailingExpirePeriod"), Label)	
 				Dim lblLastEmail As Label = _
                    CType(e.Item.FindControl("lblLastEmail"), Label)	
 				Dim lblLastLetters As Label = _
                    CType(e.Item.FindControl("lblLastLetters"), Label)	
            End If
        End Sub

        Protected Sub ListViewOrganization_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs)

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
