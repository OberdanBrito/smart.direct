using Gecko;
using System.Drawing;
using System.Windows.Forms;

namespace smart.gnav
{
    public partial class FormMain : Form
    {
        public FormMain()
        {
            InitializeComponent();
            Xpcom.Initialize("Firefox");
            GeckoPreferences.User["plugin.state.flash"] = true;
            GeckoPreferences.User["browser.xul.error_pages.enabled"] = true;
            GeckoPreferences.User["media.navigator.enabled"] = true;
            GeckoPreferences.User["media.navigator.permission.disabled"] = true;

            Navegador.NSSError += (object sender, Gecko.Events.GeckoNSSErrorEventArgs e) =>
            {
                if (e.Message.Contains("Certificate"))
                {
                    CertOverrideService.GetService().RememberRecentBadCert(e.Uri, e.SSLStatus);
                    Navegador.Navigate(e.Uri.AbsoluteUri);
                    e.Handled = true;
                }
            };

            Navegador.CreateWindow += Navegador_CreateWindow;
            Navegador.ConsoleMessage += Navegador_ConsoleMessage;
            Navegador.Navigate(Program.Target);
            Refresh();
            Text = Program.Target;
        }

        private void Navegador_CreateWindow(object sender, GeckoCreateWindowEventArgs e)
        {
            
        }

        private void Navegador_ConsoleMessage(object sender, ConsoleMessageEventArgs e)
        {
            System.Console.WriteLine(e.Message);   
        }
    }
}
