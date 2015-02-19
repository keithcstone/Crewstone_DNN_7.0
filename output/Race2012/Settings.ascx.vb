Imports DotNetNuke
Imports System.Web.UI

Namespace Crewstone Consulting ltd.Modules.Race2012

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' The Settings class manages Module Settings
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class Settings
        Inherits Entities.Modules.ModuleSettingsBase
        
        Protected WithEvents txtTemplate As System.Web.UI.WebControls.Textbox
        Protected WithEvents chkPurge As System.Web.UI.WebControls.Checkbox
       
#Region "Base Method Implementations"

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' LoadSettings loads the settings from the Database and displays them
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Public Overrides Sub LoadSettings()
            Try
                If (Page.IsPostBack = False) Then
                    If CType(TabModuleSettings("template"), String) <> "" Then
                        txtTemplate.Text = CType(TabModuleSettings("template"), String)
                    End If
                    If CType(ModuleSettings("Race2012PurgeBeforeImport"), String) <> "" Then
                        chkPurge.Checked = Boolean.Parse(ModuleSettings("Race2012PurgeBeforeImport").ToString())
                    End If
                End If
            Catch exc As Exception           'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' UpdateSettings saves the modified settings to the Database
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Public Overrides Sub UpdateSettings()
            Try
                Dim objModules As New Entities.Modules.ModuleController

                objModules.UpdateTabModuleSetting(TabModuleId, "template", txtTemplate.Text)
                objModules.UpdateModuleSetting(Me.ModuleId, "Race2012PurgeBeforeImport", chkPurge.Checked.ToString())

                ' refresh cache
                SynchronizeModule()
            Catch exc As Exception           'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

#End Region

    End Class

End Namespace
