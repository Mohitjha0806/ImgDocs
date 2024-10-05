<%@ Page Language="C#" AutoEventWireup="true" CodeFile="imgDocs1.aspx.cs" Inherits="imgDocs1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>imgDocs</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="bootstrap.bundle.min.js"></script>
    <link href="bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid mt-5">
            <div class="container mt-5">
                <div class="card">
                    <div class="card-header text-center bg-primary-subtle">Img Docs</div>
                    <div class="card-body bg-warning-subtle">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6 mt-3">
                                    <asp:Label Text="Upload Image" CssClass="form-label fw-semibold" runat="server" />
                                    <br />
                                    <asp:FileUpload runat="server" ID="fuImgUpload" CssClass="form-control border-1 border-black mt-2" />
                                </div>
                                <div class="col-md-6 mt-3">
                                    <asp:Label Text="Upload PDF" CssClass="form-label fw-semibold" runat="server" />
                                    <br />
                                    <asp:FileUpload runat="server" ID="fuPdfUpload" CssClass="form-control border-1 border-black mt-2" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-start bg-info-subtle">
                        <div class="container">
                            <div class="col-md-3 py-2">
                                <asp:Button Text="Submit" ID="btnSubmit" CssClass="btn btn-success" runat="server" OnClick="btnSubmit_Click" />
                                <asp:Button Text="Clear" ID="btnClear" CssClass="btn btn-warning" runat="server" OnClick="btnClear_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-start bg-info-subtle">
                        <asp:Label runat="server" ID="lblMsg" Text="" />
                    </div>
                </div>
            </div>

            <!-- GridView Section -->
            <div class="container mt-5">
                <div class="card">
                    <div class="card-header text-center bg-secondary text-white">Uploaded Files</div>
                    <div class="card-body">

                        <asp:GridView ID="gvFiles" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="ID" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' CssClass="text-center"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Image" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <div>
                                            <div class="text-center">
                                                <div class="modal fade" id='<%# "exampleModal_" + Eval("ID") %>' tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body text-center">
                                                                <img style="width: 100%; height: auto;" src='<%# ResolveUrl(Eval("ImagePath").ToString()) %>' alt="Alternate Text" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <a data-bs-toggle="modal" data-bs-target='<%# "#exampleModal_" + Eval("ID") %>'>
                                                <img style="max-width: 100px; height: auto;" src='<%# ResolveUrl(Eval("ImagePath").ToString()) %>' alt="Alternate Text" />
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="PDF" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <div class=" d-flex justify-content-center align-items-center">
                                            <a href='<%# ResolveUrl(Eval("PDFPath").ToString()) %>' target="_blank" class="btn btn-primary btn-sm">View PDF</a>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Upload Date" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label CssClass="text-center" ID="lblUploadDate" runat="server" Text='<%# Eval("UploadDate", "{0:yyyy-MM-dd HH:mm:ss}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>
