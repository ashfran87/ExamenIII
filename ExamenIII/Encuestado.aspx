<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Encuestado.aspx.cs" Inherits="ExamenIII.Encuestado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<div class=" contanie text-center">
    <h1>Nuestros Tecnicos</h1>
</div>
     <div>
<br />
<br />
<asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
    CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
    RowStyle-CssClass="rows" AllowPaging="True" />

<br />
<br />
<br />
         <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblNumeroEncuesta" runat="server" Text="Número de encuesta:" />
        <asp:TextBox ID="txtNumeroEncuesta" runat="server" />

        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" />
        <asp:TextBox ID="txtNombre" runat="server" />

        <asp:Label ID="lblEdad" runat="server" Text="Edad:" />
        <asp:TextBox ID="txtEdad" runat="server" />

        <asp:Label ID="lblCorreo" runat="server" Text="Correo electrónico:" />
        <asp:TextBox ID="txtCorreo" runat="server" />

        <asp:Label ID="lblPartidoPolitico" runat="server" Text="Partido político:" />
        <asp:TextBox ID="txtPartidoPolitico" runat="server" />

      

        <div>
           <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />
        </div> </div> 
    </div>
</form>

        