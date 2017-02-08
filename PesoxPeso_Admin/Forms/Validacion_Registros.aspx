<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Validacion_Registros.aspx.cs" Inherits="Forms_Validacion_Registros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Content/css/Mios.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>

            <div runat="server" id="registro_principal">
                <asp:HiddenField ID="id_registro_HiddenField" runat="server" />
                <h1 style="background: #CCCCCC; text-align: center"><b>SOLICITUDES DE REGISTRO</b></h1>
                <div class="row">
                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-offset-4 col-lg-4" style="text-align: center">
                            <div class="col-lg-10">
                                <asp:Label ID="Label1" runat="server" Text="Ingrese Nombre o RFC de la Institución:"></asp:Label>
                                <asp:TextBox ID="Nombre_Institucion_TextBox" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-2">
                                <br />
                                <asp:Button ID="Buscar_Button" runat="server" Text="Buscar" class="btn btn-success" OnClick="Llenar_Registros_Pendientes" />
                            </div>
                        </div>

                        <div class="col-lg-offset-1 col-lg-3">
                            <asp:Label ID="Label2" runat="server" Text="Mostrar:"></asp:Label>
                            <asp:RadioButtonList ID="Estado_Registro" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" CssClass="spaced" OnSelectedIndexChanged="Buscar_Button_Click">
                                <asp:ListItem Text="Pendientes" Value="Pendientes" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Registrados" Value="Registrados"></asp:ListItem>
                                <asp:ListItem Text="Todos" Value="Todos"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <fieldset>
                            <br>
                            <legend></legend>
                            <div class="col-lg-12" style="text-align: center">
                                <asp:GridView ID="Registros_Pendientes_GridView"
                                    runat="server"
                                    AllowPaging="True"
                                    AutoGenerateColumns="False"
                                    BorderStyle="None"
                                    HorizontalAlign="Center"
                                    CssClass="table table-bordered table-striped"
                                    DataKeyNames="id_registro"
                                    EmptyDataText="No hay solicitudes de registro..."
                                    Width="90%"
                                    OnRowCommand="Registros_Pendientes_GridView_RowCommand">
                                    <Columns>
                                        <%--                            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-info" SelectText="Verificar" ShowSelectButton="True">
                                <ControlStyle CssClass="btn btn-info" />
                                <ItemStyle Width="20%" />
                            </asp:CommandField>--%>
                                        <asp:BoundField DataField="fecha_registro" HeaderText="Fecha Registro" />
                                        <asp:BoundField DataField="nombre_institucion" HeaderText="Nombre" />
                                        <asp:BoundField DataField="rfc_institucion" HeaderText="RFC" />
                                        <asp:BoundField DataField="sucursal" HeaderText="Sucursal" />
                                        <asp:ButtonField ButtonType="Button"
                                            CommandName="Verificar"
                                            HeaderText=""
                                            Text="Validar">
                                            <ControlStyle CssClass="btn btn-info" />
                                            <ItemStyle Width="20%" />
                                        </asp:ButtonField>
                                        <asp:ButtonField ButtonType="Button"
                                            CommandName="Rechazar"
                                            HeaderText=""
                                            Text="Rechazar">
                                            <ControlStyle CssClass="btn btn-danger" />
                                            <ItemStyle Width="20%" />
                                        </asp:ButtonField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </fieldset>
                    </div>


                    <%--                    <asp:SqlDataSource ID="Registros_Pendientes_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="SELECT [id_registro], [nombre_institucion], CONVERT(VARCHAR(20), fecha_registro, 103) AS [fecha_registro] FROM [Registro_Usuarios] WHERE ([id_institucion] = @id_institucion)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="id_institucion" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                    <asp:SqlDataSource ID="Instituciones_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="SELECT [nombre_institucion], [id_institucion], [sucursal] FROM [Catalogo_Instituciones]"></asp:SqlDataSource>

                </div>
            </div>

            <div id="Verificar_Registros" runat="server">
                <%--                <div class="modal-dialog">
                    <div class="modal-content">--%>
                <%--                        <div class="modal-header">--%>
                <div class="col-lg-12" style="text-align: center">
                    <h1 style="background: #CCCCCC; text-align: center"><b>VERIFICACIÓN DE REGISTRO</b></h1>
                </div>
                <%--</div>--%>

                <%-- <div class="modal-body">--%>
                <div class="row">
                    <div class="col-lg-12">
                        <br />
                        <fieldset>
                            <legend>Información Registro</legend>
                            <div>
                                <br />
                            </div>
                            <div class="col-lg-8">
                                <asp:Label ID="Label3" runat="server" Text="Nombre Institución"></asp:Label>
                                <asp:TextBox ID="Nombre_Institucion_Registrada_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="col-lg-4">
                                <asp:Label ID="Label9" runat="server" Text="Sucursal:"></asp:Label>
                                <asp:TextBox ID="Sucursal_Institucion_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="col-lg-12">
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="RFC:"></asp:Label>
                                <asp:TextBox ID="Rfc_Institucion_TextBox" runat="server" class="form-control" Style="text-transform: uppercase" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="col-lg-12">
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="Nombre Usuario:"></asp:Label>
                                <asp:TextBox ID="Nombre_Registrado_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                            </div>

                            <div class="col-lg-12">
                                <br />
                                <asp:Label ID="Label7" runat="server" Text="Teléfono:"></asp:Label>
                                <asp:TextBox ID="Telefono_Verificar_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>

                            </div>
                            <div class="col-lg-12">
                                <br />
                                <asp:Label ID="Label8" runat="server" Text="Correo:"></asp:Label>
                                <asp:TextBox ID="Correo_Verificar_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                            </div>
                        </fieldset>
                    </div>

                    <div id="asignar_institucion" runat="server">
                        <div class="col-lg-12">
                            <br />
                            <fieldset>
                                <legend>Instituciones Registradas</legend>
                                <div class="col-lg-12">
                                    <br />
                                    <div class="col-lg-2" style="align-items: center; display: flex">
                                        <br />
                                        <asp:Label ID="Label6" runat="server" Text="Institución:"></asp:Label>
                                    </div>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="Nombre_Institucion_Buscar_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-2">
                                        <asp:Button ID="Buscar_Institucion_Catalogo_Button" runat="server" Text="Buscar" class="btn btn-success" OnClick="Buscar_Institucion_Catalogo_Button_Click" />
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="col-lg-12" style="text-align: center">
                                        <br />
                                        <asp:Button ID="Agregar_Catalogo_Button" CommandName="AgregarCatalogo" runat="server" Text="Registrar Institución" Class="btn btn-primary" OnCommand="Agregar_Catalogo_Button_Command" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>

                        <div class="col-lg-12" style="text-align: center">
                            <br />
                            <asp:GridView ID="Instituciones_GridView"
                                runat="server"
                                AllowPaging="True"
                                AutoGenerateColumns="False"
                                BorderStyle="None"
                                HorizontalAlign="Center"
                                CssClass="table table-bordered table-striped"
                                DataKeyNames="id_institucion"
                                EmptyDataText="No hay Instituciones Registradas..."
                                Width="90%"
                                OnRowCommand="Instituciones_GridView_RowCommand"
                                PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="nombre_institucion" HeaderText="NOMBRE INSTITUCIÓN" HeaderStyle-HorizontalAlign="Center" SortExpression="nombre_institucion" />
                                    <asp:BoundField DataField="sucursal" HeaderText="Sucursal" InsertVisible="False" ReadOnly="True" SortExpression="sucursal" />
                                    <asp:ButtonField ButtonType="Button"
                                        CommandName="Asignar_Institucion"
                                        HeaderText=""
                                        Text="Asignar   ">
                                        <ControlStyle CssClass="btn btn-info" />
                                        <ItemStyle Width="20%" />
                                    </asp:ButtonField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                    <%--</div>--%>

                    <%--<div class="modal-footer" style="text-align: center; top: 15px">--%>


                    <div class="row col-lg-12">
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-12" style="text-align: center">
                            <br />
                            <asp:Button ID="Salir_Button" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" OnClick="Salir_Button_Click" />
                        </div>
                        <div class="col-lg-4">
                            <asp:LinqDataSource
                                ID="Instituciones_LinqDataSource"
                                runat="server"
                                ContextTypeName="Entity_Model.PesoxPeso_modelContainer"
                                EntityTypeName=""
                                Select="new (id_institucion, nombre_institucion)"
                                TableName="Catalogo_Instituciones">
                            </asp:LinqDataSource>
                        </div>
                    </div>
                    <%--</div>--%>
                    <%--                    </div>
                </div>--%>
                </div>
            </div>

            <!-- Modal Mensajes -->
            <div class="modal fade" tabindex="-1" role="dialog" id="div_alertas">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Aviso</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Mensaje_Label" Text="" runat="server" class="mensaje" Font-Bold="True" Font-Size="X-Large" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>

                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

            <div class="row">
            </div>
            <!-- /.modal -->
            <!-- Fin Modal -->
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.jquery.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.jquery.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.proto.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.proto.min.js") %>"></script>

    <script src="<%= ResolveUrl("~/Scripts/jquery.blockUI.js") %>"></script>

    <script type="text/javascript">

        window.moveTo(0, 0);

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

        function cpf(v) {
            v = v.replace(',', '')
            v = v.replace(/([^0-9\.]+)/g, '');
            v = v.replace(/^[\.]/, '');
            v = v.replace(/[\.][\.]/g, '');
            v = v.replace(/\.(\d)(\d)(\d)/g, '.$1$2');
            v = v.replace(/\.(\d{1,2})\./g, '.$1');
            v = v.toString().split('').reverse().join('').replace(/(\d{3})/g, '$1,');
            v = v.split('').reverse().join('').replace(/^[\,]/, '');
            return v;
        }

        function desplegar_verificar() {
            $('#Verificar_Registros').modal('show');
        }

    </script>
</asp:Content>

