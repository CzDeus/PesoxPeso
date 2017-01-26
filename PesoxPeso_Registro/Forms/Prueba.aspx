<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Prueba.aspx.cs" Inherits="Prueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%= ResolveClientUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%= ResolveClientUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="ID_Pagina" runat="server" UpdateMode="Always">
        <ContentTemplate>

            <div class="col-lg-12" style="text-align: center; background: #CCCCCC">
                <h1><b>MANIFIESTO DE SUBDIVISION PREDIO URBANO</b></h1>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <div class="col-lg-6">
                                <asp:Label ID="Label8" runat="server" Text="Oficina de ubicacion:" BorderStyle="NotSet" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="TextBox7" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <asp:Label ID="Label9" runat="server" Text="Folio:" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="TextBox8" runat="server" class="form-control"></asp:TextBox>
                            </div>

                            <div class="col-lg-6">
                                <asp:Label ID="Label10" runat="server" Text="Clave Catastral Vendedor:" BorderStyle="NotSet" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="TextBox9" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <asp:Label ID="Label11" runat="server" Text="Clave Catastral Comprador:" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="TextBox10" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" style="display: block">
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-tittle">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" class="collapsed">Datos del predio a subdividir</a>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="false">
                                            <div class="panel-body">
                                                <div class="row" style="text-align: center">
                                                    <div class="col-lg-3">
                                                        <asp:Label ID="Label1" runat="server" Text="Municipio:"></asp:Label>
                                                        <asp:TextBox ID="Municipio_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <asp:Label ID="Label2" runat="server" Text="Poblacion:"></asp:Label>
                                                        <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <asp:Label ID="Label3" runat="server" Text="Calle:"></asp:Label>
                                                        <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <asp:Label ID="Label4" runat="server" Text="Num. Oficial:"></asp:Label>
                                                        <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label5" runat="server" Text="Colonia:"></asp:Label>
                                                        <asp:TextBox ID="TextBox4" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label6" runat="server" Text="Num. Lote:"></asp:Label>
                                                        <asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label7" runat="server" Text="Num. Mza:"></asp:Label>
                                                        <asp:TextBox ID="TextBox6" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" class="collapsed">Informacion Predio</a>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                            <div class="panel-body">
                                                <div class="row" style="text-align: center">
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label12" runat="server" Text="Sup. de terreno M2:"></asp:Label>
                                                        <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label13" runat="server" Text="Tipo:"></asp:Label>
                                                        <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label14" runat="server" Text="Uso:"></asp:Label>
                                                        <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" class="collapsed">Colindancias</a>
                                            </h5>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse" aria-expanded="false">
                                            <div class="panel-body">
                                                <div class="row" style="text-align: center">
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label15" runat="server" Text="Pto. Cardinal:"></asp:Label>
                                                        <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label16" runat="server" Text="Distancia en Mts:"></asp:Label>
                                                        <asp:TextBox ID="TextBox15" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label17" runat="server" Text="Colindancias:"></asp:Label>
                                                        <asp:TextBox ID="TextBox16" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <br />
                                                        <asp:Button ID="Button1" runat="server" Text="Agregar colindancia" CssClass="btn btn-primary" />
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <asp:GridView ID="Colindancias_GridView" runat="server"
                                                            AllowPaging="True"
                                                            AutoGenerateColumns="False"
                                                            BorderStyle="None"
                                                            HorizontalAlign="Center"
                                                            CssClass="table table-bordered table-striped"
                                                            DataKeyNames="id_registro"
                                                            EmptyDataText="No hay colindancias registradas..."
                                                            Width="90%">
                                                            <Columns>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" class="collapsed">Propietarios</a>
                                            </h5>
                                        </div>
                                        <div id="collapseFour" class="panel-collapse collapse" aria-expanded="false">
                                            <div class="panel-body">
                                                <div class="row" style="text-align: center">
                                                    <div class="col-lg-8">
                                                        <asp:Label ID="Label18" runat="server" Text="Nombre completo o razon social:"></asp:Label>
                                                        <asp:TextBox ID="TextBox17" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Label ID="Label19" runat="server" Text="Porcentaje:"></asp:Label>
                                                        <asp:TextBox ID="TextBox18" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <br />
                                                        <asp:Button ID="Button2" runat="server" Text="Agregar propietario" CssClass="btn btn-primary" />
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <asp:GridView ID="GridView1" runat="server"
                                                            AllowPaging="True"
                                                            AutoGenerateColumns="False"
                                                            BorderStyle="None"
                                                            HorizontalAlign="Center"
                                                            CssClass="table table-bordered table-striped"
                                                            DataKeyNames="id_registro"
                                                            EmptyDataText="No hay propietarios registradas..."
                                                            Width="90%">
                                                            <Columns>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12" style="text-align:center">
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-success" Text="Enviar Informacion" />
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

    <script src="<%= ResolveClientUrl("~/Scripts/jquery.blockUI.js") %>"></script>

    <script src="<%= ResolveClientUrl("~/Content/js/jquery-2.1.1.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Scripts/bootstrap.min.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Content/js/plugins/metisMenu/jquery.metisMenu.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Content/js/plugins/slimscroll/jquery.slimscroll.min.js") %>"></script>

    <!-- Custom and plugin javascript -->
    <script src="<%= ResolveClientUrl("~/Content/js/inspinia.js") %>"></script>
    <script src="<%= ResolveClientUrl("~/Content/js/plugins/pace/pace.min.js") %> "></script>

    <script type="text/javascript">

        //window.moveTo(0, 0);

        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
            //$(".chosen-select").chosen();
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

    </script>
</asp:Content>

