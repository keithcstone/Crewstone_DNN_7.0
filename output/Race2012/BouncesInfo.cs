/*
' Copyright (c) 2014 Crewstone Consulting ltd
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Namespace.Modules.Race2012
{   

    [Serializable(), XmlRoot("Bounces")]
	public class BouncesInfo : IHydratable
	{
	#region "Private Members"
		protected string _eMail = String.Empty;
		protected int _portalId;
	#endregion
		
	#region "Constructors"
        public BouncesInfo()
        {
		}

        public BouncesInfo(string eMail, int GetNull(portalId))
		{
            this.PortalId = portalId;
            this.EMail = eMail;
        }
	#endregion
		
		#region "Public Properties"
		public string EMail
		{
			get{return _eMail;}
			set{_eMail = value;}
		}
		
		public int PortalId
		{
			get{return _portalId;}
			set{_portalId = value;}
		}
		#endregion
		
		#region "IHydratable Interface"
		
		public int KeyID
		{
			get{return _eMail;}
			set{_eMail = value;}
		}
		
        public void Fill(IDataReader dr)
        {
		       EMail = Convert.ToString(Null.SetNull(dr["EMail"], EMail));
		       PortalId = Convert.ToInt32(Null.SetNull(dr["PortalId"], PortalId));
		}		
		#endregion
	}
}
