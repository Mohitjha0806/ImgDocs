-- Table Structure
CREATE TABLE tblFileUpload (
    ID INT PRIMARY KEY IDENTITY(1,1),
    ImagePath NVARCHAR(500),
    PDFPath NVARCHAR(500),
    UploadDate DATETIME DEFAULT GETDATE()
);

-- Insert Procedure
Create PROCEDURE UspInsertFile
    @imagePath NVARCHAR(500),
    @PDFPath NVARCHAR(500)
AS
BEGIN
    INSERT INTO tblFileUpload (ImagePath, PDFPath, UploadDate)
    VALUES (@imagePath, @PDFPath, GETDATE());
END;

-- Select Procedure
CREATE PROCEDURE UspGetUploadedFiles
AS
BEGIN
    SELECT * FROM tblFileUpload;
END;


-- Update Procedure
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

-- Delete Procedure
CREATE PROCEDURE UspDeleteFile
    @ID INT
AS
BEGIN
    DELETE FROM tblFileUpload
    WHERE ID = @ID;
END;

DELETE FROM tblFileUpload WHERE ID = 5;
DELETE FROM tblFileUpload WHERE ID = 6;
DELETE FROM tblFileUpload WHERE ID = 3;