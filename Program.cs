using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace smart.gnav
{
    static class Program
    {
        public static string Target { get; set; }

        /// <summary>
        /// Ponto de entrada principal para o aplicativo.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            if (args.Length == 0 || args[0].ToString().ToLower().IndexOf(Properties.Settings.Default.Token) == -1)
            {
                MessageBox.Show("Erro: Nenhum parâmetro foi declarado.\r\nPor favor verifique se o parâmetro foi informado com a chave de acesso correspondente", "Atenção", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Application.Exit();               
            } else 
            {
                Target = args[0];
                Application.Run(new FormMain());
            }
        }
    }
}
