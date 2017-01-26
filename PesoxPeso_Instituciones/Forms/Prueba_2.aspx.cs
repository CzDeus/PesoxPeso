using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;

public partial class Forms_Prueba_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Subir_Button_Click(object sender, EventArgs e)
    {
        string wArchivo;
        string vdiretorio = MapPath("~/archivos_registro");

        if (Prueba_FileUpload.HasFile == true)
        {
            //String rootPath =  Server.MapPath();
            //String.Format(“http:{0}{1}{2}”, Request.Url.Authority, path, file);


            string sName = Prueba_FileUpload.FileName;

            string sExt = Path.GetExtension(sName);

            wArchivo = vdiretorio + "/" + sName;
            Prueba_FileUpload.SaveAs(wArchivo);
        }
    }
}