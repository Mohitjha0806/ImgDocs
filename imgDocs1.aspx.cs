using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class imgDocs1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    private void BindGrid()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("UspGetUploadedFiles", conn))
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvFiles.DataSource = dt;
                gvFiles.DataBind();
                conn.Close();
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (fuImgUpload.HasFile && fuPdfUpload.HasFile)
        {
            string imagePath = Path.Combine("~/Uploads/", fuImgUpload.FileName);
            string pdfPath = Path.Combine("~/Uploads/", fuPdfUpload.FileName);

            fuImgUpload.SaveAs(Server.MapPath(imagePath));
            fuPdfUpload.SaveAs(Server.MapPath(pdfPath));

            // Database connection string
            string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("UspInsertFile", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@imagePath", imagePath);
                    cmd.Parameters.AddWithValue("@PDFPath", pdfPath);

                    conn.Open();
                    int result = cmd.ExecuteNonQuery();
                    conn.Close();

                    if (result > 0)
                    {
                        lblMsg.Text = "Files uploaded successfully!";
                    }
                    else
                    {
                        lblMsg.Text = "Error in file upload.";
                    }
                }
            }


            BindGrid();
        }
        else
        {
            lblMsg.Text = "Please upload both an image and a PDF file.";
        }
    }



    protected void btnClear_Click(object sender, EventArgs e)
    {
        fuImgUpload.Attributes.Clear();
        fuPdfUpload.Attributes.Clear();
        lblMsg.Text = "";
    }
}
