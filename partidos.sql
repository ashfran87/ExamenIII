Create DATABASE PartidosPoliticos
GO

USE PartidosPoliticos
Go




CREATE TABLE PartidosPoliticos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL
)
Go


CREATE TABLE Encuestas (
    NumeroDeEncuesta INT  IDENTITY(1,1) NOT NULL,
    NombreDelParticipante VARCHAR(255) NOT NULL,
    Edad INT CHECK (Edad BETWEEN 18 AND 50),
    CorreoElectronico VARCHAR(255) NOT NULL CHECK (CorreoElectronico LIKE '%_@_%._%'),
    IDPartidoPolitico INT,
    FOREIGN KEY (IDPartidoPolitico) REFERENCES PartidosPoliticos(ID)
)

GO
CREATE PROCEDURE AgregarEncuesta
    @NombreDelParticipante VARCHAR(255),
    @Edad INT,
    @CorreoElectronico VARCHAR(255),
    @IDPartidoPolitico INT
AS
BEGIN
    IF @Edad BETWEEN 18 AND 50
    BEGIN
        INSERT INTO Encuestas (NombreDelParticipante, Edad, CorreoElectronico, IDPartidoPolitico)
        VALUES (@NombreDelParticipante, @Edad, @CorreoElectronico, @IDPartidoPolitico);
        SELECT 'Encuesta agregada correctamente.' AS Mensaje;
    END
    ELSE
    BEGIN
        SELECT 'Edad no válida. La encuesta no ha sido agregada.' AS Mensaje;
    END
END
GO  

CREATE PROCEDURE ReporteEncuesta
AS
BEGIN
  SELECT 
        E.NumeroDeEncuesta,
        E.NombreDelParticipante,
        E.Edad,
        E.CorreoElectronico,
        P.Nombre AS 'PartidoPolitico'
    FROM 
        Encuestas E
    INNER JOIN 
        PartidosPoliticos P ON E.IDPartidoPolitico = P.ID;
END
GO

INSERT INTO PartidosPoliticos (ID, Nombre)
VALUES (1, 'PLN'), (2, 'PUSC'), (3, 'PAC');

INSERT INTO Encuestas (NombreDelParticipante, Edad,CorreoElectronico, IDPartidoPolitico)
VALUES ('Emilio', 19, 'emilio.carvajal@gmail.com', 3);

EXEC AgregarEncuesta 'Camila', 25, 'cami.lopez@gmail.com',
2





