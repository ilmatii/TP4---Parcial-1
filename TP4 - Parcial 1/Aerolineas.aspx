<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Aerolineas.aspx.cs" Inherits="TP4___Parcial_1.Aerolineas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="CAJA" style="border: medium groove #000080; font-family: Calibri; position: relative; display: block; text-align: center;">
            <div style="background-color: #000000; color: #FFFFFF">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="Large" ForeColor="White" Text="Gestion de Aerolineas"></asp:Label>
            </div>
            <br />
            <br />
            Nombre de la Aerolinea
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Height="21px" OnClick="Button1_Click" Text="Guardar" Width="64px" />
        &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
&nbsp;
            &nbsp;
            &nbsp;&nbsp;&nbsp;<br />
            <div style="position: relative; text-align: center;">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" Height="182px" HorizontalAlign="Center" style="margin-left: 0px; margin-top: 0px; margin: 0 auto;" Width="231px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="Aerolinea" SortExpression="nombre" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="Acciones" />
    </Columns>
                  
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
            <asp:Label ID="Label3" runat="server"></asp:Label>
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Atrás</asp:HyperLink>
            </div>
            <br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena1 %>" 
    SelectCommand="SELECT [id], [nombre] FROM [Aerolineas]"
    UpdateCommand="UPDATE [Aerolineas] SET [nombre] = @nombre WHERE [id] = @id"
    DeleteCommand="DELETE FROM [Aerolineas] WHERE [id] = @id" 
    InsertCommand="INSERT INTO Aerolineas (nombre) VALUES (@nombre)">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="nombre" Type="String" />
        <asp:Parameter Name="id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>


        </div>
    </form>
</body>
</html>
