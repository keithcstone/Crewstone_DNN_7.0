﻿Option Explicit On
'
' Copyright (c) 2014 Crewstone Consulting ltd
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
'
Imports System
Imports System.Configuration
Imports System.Data
Imports System.Xml.Serialization
Imports DotNetNuke
Imports DotNetNuke.Common.Utilities

Namespace Namespace.Modules.Race2012

    ''' <summary>
    ''' The Info class for ZIP
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
	''' Generated by CodeSmith on Friday, January 17, 2014
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable(), XmlRoot("ZIP")> _
	Public Class ZIPInfo

#Region "Private Members"
		Private _fiveDigitZIP as String = string.Empty
		Private _sequence as short
		Private _portalId as Integer
		Private _city as String = string.Empty
		Private _state as String = string.Empty
		Private _county as String = string.Empty
		Private _country as String = string.Empty
#End Region

#Region "Constructors"
        ' initialization
        Public Sub New()
        End Sub
		
        Public Sub New(ByVal fiveDigitZIP As String, ByVal sequence As short, ByVal portalId As Integer, ByVal city As String, ByVal state As String, ByVal county As String, ByVal country As String)
            Me.PortalId = PortalId
            Me.FiveDigitZIP = FiveDigitZIP
            Me.Sequence = Sequence
            Me.City = City
            Me.State = State
            Me.County = County
            Me.Country = Country
        End Sub
#End Region

#Region "Public Properties"
		' <summary>
		' Gets and sets the FiveDigitZIP
		' </summary>
        <XmlIgnore()> _
		Public Property FiveDigitZIP() as String
			Get
				Return _fiveDigitZIP
			End Get
			Set(ByVal Value as String)
				_fiveDigitZIP = Value
			End Set
		End Property

		' <summary>
		' Gets and sets the Sequence
		' </summary>
        <XmlIgnore()> _
		Public Property Sequence() as short
			Get
				Return _sequence
			End Get
			Set(ByVal Value as short)
				_sequence = Value
			End Set
		End Property
		
		' <summary>
		' Gets and sets the PortalId
		' </summary>
        <XmlIgnore()> _
        <XmlAttribute("PortalId")> _
		Public Property PortalId() as Integer 
			Get
				Return _portalId
			End Get
			Set(ByVal Value as Integer)
				_portalId = Value
			End Set
		End Property
		' <summary>
		' Read-only formatted text version of PortalId
		' </summary>
        <XmlIgnore()> _
		Public Readonly Property PortalIdText() as String
			Get
				Return _portalId.ToString()
			End Get
		End Property

		' <summary>
		' Gets and sets the City
		' </summary>
        <XmlAttribute("City")> _
		Public Property City() as String 
			Get
				Return _city
			End Get
			Set(ByVal Value as String)
				_city = Value
			End Set
		End Property

		' <summary>
		' Gets and sets the State
		' </summary>
        <XmlAttribute("State")> _
		Public Property State() as String 
			Get
				Return _state
			End Get
			Set(ByVal Value as String)
				_state = Value
			End Set
		End Property

		' <summary>
		' Gets and sets the County
		' </summary>
        <XmlAttribute("County")> _
		Public Property County() as String 
			Get
				Return _county
			End Get
			Set(ByVal Value as String)
				_county = Value
			End Set
		End Property

		' <summary>
		' Gets and sets the Country
		' </summary>
        <XmlAttribute("Country")> _
		Public Property Country() as String 
			Get
				Return _country
			End Get
			Set(ByVal Value as String)
				_country = Value
			End Set
		End Property
#End Region

#Region "IHydratable Implementation"
#End Region
    End Class

End Namespace