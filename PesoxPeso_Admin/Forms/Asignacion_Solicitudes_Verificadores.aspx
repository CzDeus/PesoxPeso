<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Asignacion_Solicitudes_Verificadores.aspx.cs" Inherits="Forms_Asignacion_Solicitudes_Verificadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>

            <div class="col-lg-12">
                <h1 style="background: #CCCCCC; text-align: center"><b>ASIGNACIÓN DE SOLICITUDES A VERIFICADORES</b></h1>
            </div>

            <div class="container">
                <%--<div class="row">--%>
                    <div class="row col-lg-12" style="text-align: center">
                        <div class="ibox">
                            <h2 class="ibox-title"><b>Listado de verificadores</b></h2>
                            <div class="ibox-content">
                                <asp:SqlDataSource ID="Solicitudes_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="sp_contar_asignados" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                <asp:GridView ID="Asignados_Verificadores_GridView" runat="server" AutoGenerateColumns="False"
                                    DataSourceID="Solicitudes_SqlDataSource" DataKeyNames="id_General_Usuario" CssClass="table table-hover table-bordered"
                                    EmptyDataText="No se han asignado solicitudes..." AllowPaging="True" BorderStyle="None" Width="90%" PageSize="5"
                                    OnRowCommand="Asignados_Verificadores_GridView_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre Usuario" />
                                        <asp:BoundField DataField="cantidad" HeaderText="No. Trabajos Asignados" />
                                        <asp:CommandField ShowSelectButton="True" SelectText="Ver asignados" ButtonType="Button" ControlStyle-CssClass="btn btn-info">
                                            <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                            <ItemStyle Width="20%" />
                                        </asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                <%--</div>--%>

                <div class="row">
                    <div class="col-lg-12" style="text-align: center">
                        <div class="ibox">
                            <h2 class="ibox-title"><b>Registros pendientes a asignar</b></h2>
                            <div class="ibox-content">

                                <div class="col-lg-12" style="text-align: center">
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label1" runat="server" Text="Teclee una Parte del Nombre:"></asp:Label>
                                        <asp:TextBox ID="Buscar_TextBox" runat="server" CssClass="form-control"> </asp:TextBox>
                                    </div>
                                    <div class="col-lg-1">
                                        <br />
                                        <asp:Button ID="Buscar_Button" runat="server" Text="Buscar" CssClass="btn btn-success" OnClick="Buscar_Button_Click" />
                                    </div>
                                    <div class="col-lg-offset-1 col-lg-4">
                                        <asp:Label ID="Label2" runat="server" Text="Mostrar:"></asp:Label>

                                        <asp:RadioButtonList ID="Estado_Registro" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%"
                                            OnSelectedIndexChanged="Estado_Registro_SelectedIndexChanged">
                                            <asp:ListItem Text="No asignados" Value="No_Asignados" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Asignados" Value="Asignados"></asp:ListItem>
                                            <asp:ListItem Text="Todos" Value="Todos"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>

                                <asp:SqlDataSource ID="Registros_Completos_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_registros_completos" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Id_Estatus_Buscar_HiddenField" DefaultValue="0" Name="estatus_registro" PropertyName="Value" Type="Int32" />
                                        <asp:ControlParameter ControlID="Buscar_TextBox" DefaultValue=" " Name="texto_buscar" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:SqlDataSource ID="Verificadores_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_Generales_lee_usuarios_por_estatus" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="estatus" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:HiddenField ID="Id_Estatus_Buscar_HiddenField" runat="server" />

                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                </div>
                                <asp:GridView ID="Registros_Completos_GridView" runat="server" AutoGenerateColumns="False"
                                    DataSourceID="Registros_Completos_SqlDataSource" DataKeyNames="id_registro" CssClass="table table-hover table-bordered"
                                    EmptyDataText="No se han completado registros..." AllowPaging="True" BorderStyle="None" Width="90%" PageSize="5">
                                    <Columns>
                                        <asp:BoundField DataField="rfc_institucion" HeaderText="RFC" SortExpression="rfc_institucion" />
                                        <asp:BoundField DataField="nombre_institucion" HeaderText="Institución" SortExpression="nombre_institucion" />
                                        <asp:BoundField DataField="fecha_registro" HeaderText="Fecha Registro" SortExpression="fecha_registro" />
                                        <asp:BoundField DataField="fecha_asignada" HeaderText="Fecha Asignada" SortExpression="fecha_asignada" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:DropDownList ID="Verificadores_DropDownList" runat="server" SelectedValue='<%# Bind("id_verificador") %>' DataSourceID="Verificadores_SqlDataSource" DataTextField="nombre" DataValueField="id_General_Usuario"></asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="Asignar_Verificador_Button" runat="server" Text="Asignar" CssClass="btn btn-success" OnClick="Asignar_Verificador_Button_Click" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:SqlDataSource ID="Ver_Registros_Asignados_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_registros_asignados" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Id_Asignado_Registro_HiddenField" DefaultValue="0" Name="id_verificador" PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div id="instituciones_asignadas" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header" style="text-align: center">
                            <h2><b>REGISTROS ASIGNADOS POR INSTITUCION</b></h2>
                        </div>
                        <div class="modal-body" style="text-align: center">

                            <asp:HiddenField ID="Id_Asignado_Registro_HiddenField" runat="server" />
                            <asp:GridView ID="Registros_Asignados_GridView" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered"
                                DataKeyNames="id_registro" DataSourceID="Ver_Registros_Asignados_SqlDataSource">
                                <Columns>
                                    <asp:BoundField DataField="nombre_institucion" HeaderText="Institución" SortExpression="nombre_institucion" />
                                    <asp:BoundField DataField="rfc_institucion" HeaderText="RFC" SortExpression="rfc_institucion" />
                                    <asp:BoundField DataField="Fecha Registro" HeaderText="Fecha Registro" ReadOnly="True" SortExpression="Fecha Registro" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="modal-footer" style="text-align: center">
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

        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
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

