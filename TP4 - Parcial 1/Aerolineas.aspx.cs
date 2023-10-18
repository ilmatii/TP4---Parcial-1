using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP4___Parcial_1
{
    public partial class Aerolineas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                Label3.Text = "El campo del nombre de aerolínea no puede estar vacío.";
            }
            else
            {
                if (TextBox1.Text.All(char.IsDigit))
                {
                    Label3.Text = "El nombre de la aerolínea es invalido.";
                }
                else
                {
                    SqlDataSource1.Insert();
                    GridView1.DataBind();
                    Label3.Text = "La aerolínea se insertó con éxito.";
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                
                int idAerolinea = (int)GridView1.DataKeys[e.RowIndex].Value;

               
                SqlDataSource1.DeleteParameters["id"].DefaultValue = idAerolinea.ToString();
                int result = SqlDataSource1.Delete();


                if (result != 0)
                {                
                    GridView1.DataBind();
                Label3.Text = "La aerolínea se eliminó con éxito.";
            }
                else
                {
                    Label3.Text = "No se elimino ninguna aerolinea";
                }
            }
            catch
            {
                Label3.Text = "Error al eliminar la aerolínea.";
            }
           
        }


    }
}