<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Verificar_Instituciones.aspx.cs" Inherits="Forms_Verificar_Instituciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>
            <asp:HiddenField ID="Id_Usuario_HiddenField" runat="server" />
            <h1 style="background: #CCCCCC; text-align: center"><b>
                <asp:Label ID="Encabezado_Text" runat="server" Text="REVISION DE INSTITUCIONES"></asp:Label></b></h1>

            <div class="container">
                <div class="row">
                    <div class="col-lg-12" style="text-align: center">
                        <div class="ibox">
                            <h2 class="ibox-title"><b>Registros pendientes a revisión</b></h2>
                            <div class="ibox-content">

                                <div class="col-lg-12" style="text-align: center">
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label1" runat="server" Text="Teclee una Parte del Nombre:"></asp:Label>
                                        <asp:TextBox ID="Buscar_TextBox" runat="server" CssClass="form-control"> </asp:TextBox>
                                    </div>
                                    <div class="col-lg-1">
                                        <br />
                                        <asp:Button ID="Buscar_Button" runat="server" Text="Buscar" CssClass="btn btn-success" />
                                    </div>
                                    <div class="col-lg-offset-1 col-lg-4">
                                        <asp:Label ID="Label3" runat="server" Text="Mostrar:"></asp:Label>

                                        <asp:RadioButtonList ID="Estado_Registro_Verificador" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%"
                                            OnSelectedIndexChanged="Estado_Registro_SelectedIndexChanged">
                                            <asp:ListItem Text="Pendientes" Value="Pendientes" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Verificados" Value="Verificados"></asp:ListItem>
                                            <asp:ListItem Text="Todos" Value="Todos"></asp:ListItem>
                                        </asp:RadioButtonList>

                                        <asp:RadioButtonList ID="Estado_Registro_Autorizador" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%"
                                            OnSelectedIndexChanged="Estado_Registro_SelectedIndexChanged">
                                            <asp:ListItem Text="Verificados" Value="Verificados" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Autorizados" Value="Autorizados"></asp:ListItem>
                                            <asp:ListItem Text="Todos" Value="Todos"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>

                                <asp:SqlDataSource ID="Leer_Instituciones_Asignadas_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_instituciones_asignadas" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Id_Usuario_HiddenField" DefaultValue="0" Name="id_verificador" PropertyName="Value" Type="Int32" />
                                        <asp:ControlParameter ControlID="Id_Estatus_Buscar_HiddenField" DefaultValue="0" Name="estatus" PropertyName="Value" Type="Int32" />
                                        <asp:ControlParameter ControlID="Tipo_HiddenField" DefaultValue="0" Name="tipo" PropertyName="Value" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:HiddenField ID="Id_Estatus_Buscar_HiddenField" runat="server" />

                                <div class="col-lg-12" style="text-align: center">
                                    <asp:HiddenField ID="Tipo_HiddenField" runat="server" />
                                    <br />
                                </div>
                                <asp:GridView ID="Instituciones_Asignadas_GridView" runat="server" AutoGenerateColumns="False" DataSourceID="Leer_Instituciones_Asignadas_SqlDataSource"
                                    CssClass="table table-hover table-bordered" DataKeyNames="id_registro" OnRowCommand="Instituciones_Asignadas_GridView_RowCommand"
                                    EmptyDataText="No se han asignados/verificado registros...">
                                    <Columns>
                                        <asp:BoundField DataField="id_registro" HeaderText="ID" SortExpression="id_registro" />
                                        <asp:BoundField DataField="nombre_institucion" HeaderText="Nombre Institucion" SortExpression="nombre_institucion" />
                                        <asp:BoundField DataField="rfc_institucion" HeaderText="RFC" SortExpression="rfc_institucion" />
                                        <asp:BoundField DataField="Fecha_Asignacion" HeaderText="Asignada el dia" SortExpression="Fecha_Asignacion" />
                                        <asp:CommandField ButtonType="Button" SelectText="Verificar" ShowSelectButton="True">
                                            <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                        </asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.jquery.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.jquery.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.proto.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.proto.min.js") %>"></script>


    <script type="text/javascript">

        //function myFunction() {
        //    var myWindow = window.open("", "", "width=200,height=100");
        //}

        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
        }

        function despliega_aviso(mensaje) {
            $('#div_alertas').find('.mensaje').text(mensaje);
            $('#div_alertas').modal('show');
        }

        function bloquea_pagina() {
            $.blockUI({ message: 'Espere por Favor...' });
        }

        function desbloquea_pagina() {
            $.unblockUI();
        }

        function hideModal() {
            $('.modal-backdrop.fade.in').remove();
        }

        var i = 1;

        $("#add_row").click(function () {
            $('#addr' + i).html("<td>" + (i + 1) + "</td><td><input name='name" + i + "' type='text' placeholder='Concepto' class='form-control input-md'  /> </td><td><input  name='mail" + i + "' type='text' placeholder='Monto'  class='form-control input-md'></td>");
            i++;
            $('#tab_logic').append('<tr id="addr' + (i) + '"></tr>');
        });

        $("#delete_row").click(function () {
            if (i > 1) {
                $("#addr" + (i - 1)).html('');
                i--;
            }
        });

    </script>

</asp:Content>

