<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
    <link href="<%=  ResolveClientUrl("~/content/css/plugins/datapicker/datepicker3.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>
            <asp:HiddenField ID="Correo_HiddenField" runat="server" />
            <div class="row col-lg-12" style="text-align: center">
                <h1><b>
                    <asp:Label ID="Label1" runat="server" Text="BIENVENIDO"></asp:Label></b></h1>
            </div>
            <div class="row col-lg-12" style="text-align: center">
                <h1>
                    <asp:Label ID="Nombre_Intitucion_Label" runat="server" Text="Nombre Institución"></asp:Label>
                </h1>
            </div>
            <div class="row col-lg-12" style="text-align:center">
                <br />
                <asp:Button ID="Cambiar_Institucion_Button" runat="server" Text="Cambiar Institución" CssClass="btn btn-info" OnClick="Cambiar_Institucion_Button_Click"/>
            </div>

            <%-- MODAL INSTITUCIONES --%>
            <div id="modal_Instituciones" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2><b>Seleccione una de las instituciones</b></h2>
                        </div>
                        <div class="modal-body">
                            <asp:SqlDataSource ID="Instituciones_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="SELECT [id_registro], [nombre_institucion], [sucursal], [id_institucion] FROM [Registro_Usuarios] WHERE ([correo] = @correo) AND ([contraseña] != '')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Correo_HiddenField" DefaultValue="''" Name="correo" PropertyName="Value" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="Instituciones_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_registro"
                                DataSourceID="Instituciones_SqlDataSource" CssClass="table table-hover table-bordered" OnRowCommand="Instituciones_GridView_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="nombre_institucion" HeaderText="Institución" SortExpression="nombre_institucion" />
                                    <asp:BoundField DataField="sucursal" HeaderText="Sucursal" SortExpression="sucursal" />
                                    <asp:CommandField ButtonType="Button" SelectText="Seleccionar" ShowSelectButton="True">
                                        <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">

    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.jquery.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.jquery.min.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.proto.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.proto.min.js") %>"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
            //hideModal();
            $(".chosen-select").chosen();
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
    </script>
</asp:Content>
