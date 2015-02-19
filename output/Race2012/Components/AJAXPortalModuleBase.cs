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
using System.Web.Script.Serialization;
using System.Web.UI;
using DotNetNuke.Entities.Modules;
using DotNetNuke.UI.Utilities;

namespace NameSpace.Modules.Race2012
{
    public class AjaxPortalModuleBase: PortalModuleBase, IScriptControl
    {
        public delegate void AddScriptComponentDescriptorsDelegate(ScriptComponentDescriptor Descriptor);
        public delegate void AddScriptReferencesDelegate(List<ScriptReference> References);
        public delegate void AddLocalizedMessagesDelegate(Dictionary<string, string> Messages);
        protected event AddScriptComponentDescriptorsDelegate AddScriptComponentDescriptors;
        protected event AddScriptReferencesDelegate AddScriptReferences;
        protected event AddLocalizedMessagesDelegate AddLocalizedMessages;

#region Event Handlers
        //Enable Control Callbacks for this module
        //We are passing in the second argument to ensure our callbacks reach this instance of our object
        private void Page_Init(object sender, System.EventArgs e) 
        {
            ClientAPI.RegisterControlMethods(this, this.ClientID);
        }

        private void Page_PreRender(object sender, System.EventArgs e)
        {
            //Tell DotNetNuke we need to use the ScriptManager
            DotNetNuke.Framework.AJAX.RegisterScriptManager();

            //Register our client-side Script Control
            ScriptManager.GetCurrent(this.Page).RegisterScriptControl(this);
            ScriptManager.GetCurrent(this.Page).RegisterScriptDescriptors(this);
        }

#endregion

#region IScriptControl
        public IEnumerable<ScriptDescriptor> GetScriptDescriptors() 
        {
            List<ScriptDescriptor> descs = new List<ScriptDescriptor>();
            ScriptComponentDescriptor desc = new ScriptComponentDescriptor("ClientNamespaceHere");
            JavaScriptSerializer jss = new JavaScriptSerializer();
            Dictionary<string, string> msgs = new Dictionary<string, string>();

            desc.AddScriptProperty("id", String.Format("'{0}'", this.ClientID));

            if (AddLocalizedMessages != null)
                AddLocalizedMessages(msgs);

            desc.AddScriptProperty("msgs", jss.Serialize(msgs)); //Note:  should guard against messages with '

            if (AddScriptComponentDescriptors != null)
                AddScriptComponentDescriptors(desc);

            descs.Add(desc);
            return descs;
        }

        public IEnumerable<ScriptReference> GetScriptReferences() 
        {
            List<ScriptReference> refs = new List<ScriptReference>();
            if (AddScriptReferences != null)
                AddScriptReferences(refs);
            return refs;
        }

#endregion

    }
}
