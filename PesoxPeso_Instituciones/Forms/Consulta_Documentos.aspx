<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Consulta_Documentos.aspx.cs" Inherits="Consulta_Documentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>

            <div class="row col-lg-12">
                <div class="col-lg-10" style="text-align: left">
                    <asp:Label ID="Nombre_Institucion_Encabezado_Label" runat="server" Text="Nombre Institucion" Font-Size="X-Large"></asp:Label>
                </div>
                <div class="col-lg-2" style="text-align: right">
                    <asp:LinkButton ID="Home" CssClass="btn btn-success" runat="server" OnClick="Home_Click"><span class="glyphicon glyphicon-home"></span></asp:LinkButton>
                </div>
            </div>

            <div class="col-lg-12" style="text-align: center">
                <h1 style="background: #CCCCCC; text-align: center"><b>Documentos de Consulta</b></h1>
            </div>

            <div class="row col-lg-12">
                <div class="col-lg-12">
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Listado de Documentos"></asp:Label>
                </div>
                <div class="col-lg-12" style="text-align: center">
                    <asp:GridView ID="Documentos_GridView" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered" DataKeyNames="id_documento_consulta,url_archivo" DataSourceID="Lee_Documentos_Registrados_SqlDataSource">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Documento_Label" runat="server" Text='<%# Eval("descripcion_archivo") %>'></asp:Label>
                                    <%--<asp:HyperLink ID="Consultar_Documento" runat="server" Text='<%# Eval("descripcion_archivo") %>' NavigateUrl='<%# Eval("url_archivo") %>' Target="_blank" />--%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Consultar_Button" runat="server" Text="Abrir Archivo" OnClick="Consultar_Button_Click" OnClientClick="aspnetForm.target ='_blank';" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="Lee_Documentos_Registrados_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_documentos_consulta" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="año_HiddenField" DefaultValue="0" Name="año" PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:HiddenField ID="año_HiddenField" runat="server" />

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
            <!-- /.modal -->
            <!-- Fin Modal -->

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

