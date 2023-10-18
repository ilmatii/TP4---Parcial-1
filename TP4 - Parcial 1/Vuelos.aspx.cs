using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP4___Parcial_1
{
    public partial class Vuelos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int result = SqlDataSource2.Insert();

                if (string.IsNullOrWhiteSpace(TextBox1.Text))
                {
                    Label3.Text = "No puede ingresar datos en blanco";
                }
                else if (result != 0)
                {
                    Label3.Text = "El vuelo se cargó con éxito.";
                    GridView1.DataBind();
                }
                else
                {
                    Label3.Text = "No se pudo cargar el vuelo";
                }
            }
            catch (Exception ex)
            {
                // Aquí puedes manejar el error de manera más específica
                Label3.Text = "No pueden ingresar los datos";
            }
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox3.Text = GridView1.SelectedRow.Cells[1].Text;
            DropDownList2.SelectedValue = GridView1.SelectedRow.Cells[2].Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource1Vuelos.Update();
            if (result != 0)
            {
                Label3.Text = "El vuelo se actualizó con éxito.";
                GridView1.DataBind();
            }
            else
            {
                Label3.Text = "No se pudo actualizar el vuelo";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource1Vuelos.Delete();
            if (result != 0)
            {
                Label3.Text = "El vuelo se eliminó correctamente.";
                GridView1.DataBind();
            }
            else
            {
                Label3.Text = "No se pudo eliminar el vuelo";
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlDataSource1Vuelos.FilterExpression = "idAerolinea = " + DropDownList3.SelectedValue;

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            SqlDataSource1Vuelos.FilterExpression = String.Empty;
            SqlDataSource1Vuelos.FilterParameters.Clear();
        }
    }
}