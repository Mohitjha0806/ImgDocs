CREATE TABLE tblFileUpload (
    ID INT PRIMARY KEY IDENTITY(1,1),
    ImagePath NVARCHAR(500),
    PDFPath NVARCHAR(500),
    UploadDate DATETIME DEFAULT GETDATE()
);

Create PROCEDURE UspInsertFile
    @imagePath NVARCHAR(500),
    @PDFPath NVARCHAR(500)
AS
BEGIN
    INSERT INTO tblFileUpload (ImagePath, PDFPath, UploadDate)
    VALUES (@imagePath, @PDFPath, GETDATE());
END;

CREATE PROCEDURE UspGetUploadedFiles
AS
BEGIN
    SELECT * FROM tblFileUpload;
END;


CREATE PROCEDURE UspUpdateFile
    @ID INT,
    @imagePath NVARCHAR(500),
    @PDFPath NVARCHAR(500)
AS
BEGIN
    UPDATE tblFileUpload
    SET ImagePath = @imagePath,
        PDFPath = @PDFPath,
        UploadDate = GETDATE()
    WHERE ID = @ID;
END;

CREATE PROCEDURE UspDeleteFile
    @ID INT
AS
BEGIN
    DELETE FROM tblFileUpload
    WHERE ID = @ID;
END;

