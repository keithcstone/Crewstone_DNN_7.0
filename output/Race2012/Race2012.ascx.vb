﻿Option Strict On
Option Explicit On

Imports DotNetNuke
Imports DotNetNuke.Common
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports DotNetNuke.Security.PortalSecurity

Namespace Crewstone Consulting ltd.Modules.Race2012

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' This class manages the mainline operation of the module
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
 	''' Generated by CodeSmith on Friday, January 17, 2014
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class Race2012Menu
        Inherits Entities.Modules.PortalModuleBase
	 	Implements Entities.Modules.IActionable
        
        Protected WithEvents HypBounces As System.Web.UI.WebControls.HyperLink
        Protected WithEvents HypContactTypes As System.Web.UI.WebControls.HyperLink
        Protected WithEvents HypDivisions As System.Web.UI.WebControls.HyperLink
        Protected WithEvents HypDoNotEmail As System.Web.UI.WebControls.HyperLink
        Protected WithEvents HypEntrants As System.Web.UI.WebControls.HyperLink
        Protected WithEvents HypEvents As System.Web.UI.WebControls.HyperLink
        Protected WithEvents HypEventTypes As System.Web.UI.WebControls.HyperLink
        Protected WithEvents HypMemberTypes As System.Web.UI.WebControls.HyperLink
        Protected WithEvents HypOrganization As System.Web.UI.WebControls.HyperLink
        Protected WithEvents HypRaceDivisions As System.Web.UI.WebControls.HyperLink
        Protected WithEvents HypRaces As System.Web.UI.WebControls.HyperLink
        Protected WithEvents HypZIP As System.Web.UI.WebControls.HyperLink
		
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            If HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserInfo.Username) Then
               ' AddItemButton.Enabled = True
            Else
               ' AddItemButton.Enabled = False
            End If
			
            hypBounces.Text = Localization.GetString("MenuListBounces", LocalResourceFile)
            hypBounces.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListBounces", "mid=" & ModuleId)
                   
            hypContactTypes.Text = Localization.GetString("MenuListContactTypes", LocalResourceFile)
            hypContactTypes.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListContactTypes", "mid=" & ModuleId)
                   
            hypDivisions.Text = Localization.GetString("MenuListDivisions", LocalResourceFile)
            hypDivisions.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListDivisions", "mid=" & ModuleId)
                   
            hypDoNotEmail.Text = Localization.GetString("MenuListDoNotEmail", LocalResourceFile)
            hypDoNotEmail.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListDoNotEmail", "mid=" & ModuleId)
                   
            hypEntrants.Text = Localization.GetString("MenuListEntrants", LocalResourceFile)
            hypEntrants.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListEntrants", "mid=" & ModuleId)
                   
            hypEvents.Text = Localization.GetString("MenuListEvents", LocalResourceFile)
            hypEvents.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListEvents", "mid=" & ModuleId)
                   
            hypEventTypes.Text = Localization.GetString("MenuListEventTypes", LocalResourceFile)
            hypEventTypes.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListEventTypes", "mid=" & ModuleId)
                   
            hypMemberTypes.Text = Localization.GetString("MenuListMemberTypes", LocalResourceFile)
            hypMemberTypes.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListMemberTypes", "mid=" & ModuleId)
                   
            hypOrganization.Text = Localization.GetString("MenuListOrganization", LocalResourceFile)
            hypOrganization.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListOrganization", "mid=" & ModuleId)
                   
            hypRaceDivisions.Text = Localization.GetString("MenuListRaceDivisions", LocalResourceFile)
            hypRaceDivisions.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListRaceDivisions", "mid=" & ModuleId)
                   
            hypRaces.Text = Localization.GetString("MenuListRaces", LocalResourceFile)
            hypRaces.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListRaces", "mid=" & ModuleId)
                   
            hypZIP.Text = Localization.GetString("MenuListZIP", LocalResourceFile)
            hypZIP.NavigateUrl = DotNetNuke.Common.NavigateURL(TabId, "ListZIP", "mid=" & ModuleId)
                   
        End Sub
		
#Region "Base Method Implementations"

#End Region

#Region "Optional Interfaces"
        Public ReadOnly Property ModuleActions() As Entities.Modules.Actions.ModuleActionCollection Implements Entities.Modules.IActionable.ModuleActions
            Get
                Dim Actions As New Entities.Modules.Actions.ModuleActionCollection
                    
					' Add EditBounces
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditBounces", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditBounces"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If
                    
					' Add EditContactTypes
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditContactTypes", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditContactTypes"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If
                    
					' Add EditDivisions
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditDivisions", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditDivisions"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If
                    
					' Add EditDoNotEmail
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditDoNotEmail", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditDoNotEmail"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If
                    
					' Add EditEntrants
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditEntrants", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditEntrants"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If
                    
					' Add EditEvents
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditEvents", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditEvents"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If
                    
					' Add EditEventTypes
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditEventTypes", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditEventTypes"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If
                    
					' Add EditMemberTypes
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditMemberTypes", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditMemberTypes"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If
                    
					' Add EditOrganization
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditOrganization", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditOrganization"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If
                    
					' Add EditRaceDivisions
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditRaceDivisions", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditRaceDivisions"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If
                    
					' Add EditRaces
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditRaces", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditRaces"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If
                    
					' Add EditZIP
                    If DotNetNuke.Security.PortalSecurity.HasNecessaryPermission(SecurityAccessLevel.Edit, PortalSettings, ModuleConfiguration, UserId.ToString) Then
                        Actions.Add(GetNextActionID(), Localization.GetString("MenuEditZIP", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, , , EditUrl("EditZIP"), False, DotNetNuke.Security.SecurityAccessLevel.Edit, True, False)
                    End If

                Return Actions
            End Get
        End Property
#End Region
    End Class

End Namespace