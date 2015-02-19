Imports System.Web.Script.Serialization
Imports DotNetNuke
Imports DotNetNuke.Common
Imports DotNetNuke.UI.Utilities

Namespace Crewstone Consulting ltd.Modules.Race2012

    Public Class AjaxPortalModuleBase
        Inherits Entities.Modules.PortalModuleBase : Implements IScriptControl

        Public Event AddScriptComponentDescriptors(ByVal Descriptor As ScriptComponentDescriptor)
        Public Event AddScriptReferences(ByVal References As List(Of ScriptReference))
        Public Event AddLocalizedMessages(ByVal Messages As Dictionary(Of String, String))

#Region "Event Handlers"
        'Enable Control Callbacks for this module
        'We are passing in the second argument to ensure our callbacks reach this instance of our object
        Private Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
            ClientAPI.RegisterControlMethods(Me, Me.ClientID)
        End Sub

        Private Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
            'Tell DotNetNuke we need to use the ScriptManager
            DotNetNuke.Framework.AJAX.RegisterScriptManager()

            'Register our client-side Script Control
            ScriptManager.GetCurrent(Me.Page).RegisterScriptControl(Me)
            ScriptManager.GetCurrent(Me.Page).RegisterScriptDescriptors(Me)
        End Sub

#End Region

#Region "IScriptControl"
        Private Function GetScriptDescriptors() As IEnumerable(Of ScriptDescriptor) Implements IScriptControl.GetScriptDescriptors
            Dim descs As List(Of ScriptDescriptor) = New List(Of ScriptDescriptor)
            Dim desc As ScriptComponentDescriptor = New ScriptComponentDescriptor("ClientNamespaceHere")
            Dim jss As JavaScriptSerializer = New JavaScriptSerializer()
            Dim msgs As Dictionary(Of String, String) = New Dictionary(Of String, String)

            desc.AddScriptProperty("id", String.Format("'{0}'", Me.ClientID))

            RaiseEvent AddLocalizedMessages(msgs)
            desc.AddScriptProperty("msgs", String.Format("'{0}'", jss.Serialize(msgs))) 'Note:  should guard against messages with '

            RaiseEvent AddScriptComponentDescriptors(desc)

            descs.Add(desc)
            Return descs
        End Function

        Private Function GetScriptReferences() As IEnumerable(Of ScriptReference) Implements IScriptControl.GetScriptReferences
            Dim refs As List(Of ScriptReference) = New List(Of ScriptReference)
            RaiseEvent AddScriptReferences(refs)
            Return refs
        End Function

#End Region

    End Class

End Namespace