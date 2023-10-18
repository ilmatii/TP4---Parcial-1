<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vuelos.aspx.cs" Inherits="TP4___Parcial_1.Vuelos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-family: Calibri; position: relative; text-align: center;">
            <div style="background-color: #000000; text-align: center;">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Calibri" ForeColor="White" Text="Gestion de vuelos"></asp:Label>
            </div>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Numero de vuelo"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Aerolinea<asp:DropDownList ID="DropDownList1" runat="server" datasourceid="SqlDataSource2Aerolineas" DataTextField="nombre" DataValueField="id" style="margin-left: 52px" Width="130px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-left: 90px" Text="Guardar" />
&nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
&nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="id" Height="16px" Width="101px">
            </asp:DropDownList>
            &nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Modificar" OnClick="Button2_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="Eliminar" OnClick="Button3_Click" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource2Aerolineas" runat="server" ConnectionString="<%$ ConnectionStrings:cadena1 %>" SelectCommand="SELECT * FROM [Aerolineas]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Filtrar"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2Aerolineas" DataTextField="nombre" DataValueField="id" Height="16px" Width="164px">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Filtrar" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Eliminar Filtro" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1Vuelos" style="margin: 0 auto;" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="numeroVuelo" HeaderText="Numero de Vuelo" SortExpression="numeroVuelo" />
                    <asp:BoundField DataField="idAerolinea" SortExpression="idAerolinea" />
                    <asp:BoundField DataField="nombre" HeaderText="Aerolinea" SortExpression="nombre" />
                    <asp:CommandField AccessibleHeaderText="Acciones" ButtonType="Image" SelectImageUrl="~/select-21-16.png" ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <br />
            <asp:Label ID="Label3" runat="server"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Atrás</asp:HyperLink>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1Vuelos" runat="server" ConnectionString="<%$ ConnectionStrings:cadena1 %>"  SelectCommand="SELECT V.id, V.numeroVuelo, V.idAerolinea, A.nombre FROM Vuelos V INNER JOIN Aerolineas A ON V.idAerolinea = A.id" DeleteCommand="DELETE FROM [Vuelos] WHERE [id] = @id
" UpdateCommand="UPDATE [Vuelos] SET [idAerolinea] = @idAerolinea, [numeroVuelo] = @numeroVuelo WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="idAerolinea" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBox3" Name="numeroVuelo" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena1 %>" DeleteCommand="DELETE FROM [Aerolineas] WHERE [id] = @id" InsertCommand="INSERT INTO [Aerolineas] ([nombre]) VALUES (@nombre)" SelectCommand="SELECT * FROM [Aerolineas]" UpdateCommand="UPDATE [Aerolineas] SET [nombre] = @nombre WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena1 %>" DeleteCommand="DELETE FROM [Vuelos] WHERE [id] = @id" InsertCommand="INSERT INTO [Vuelos] ([numeroVuelo], [idAerolinea]) VALUES (@numeroVuelo, @idAerolinea)" SelectCommand="SELECT * FROM [Vuelos]" UpdateCommand="UPDATE [Vuelos] SET [numeroVuelo] = @numeroVuelo, [idAerolinea] = @idAerolinea WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="numeroVuelo" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idAerolinea" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="numeroVuelo" Type="Int32" />
                    <asp:Parameter Name="idAerolinea" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
