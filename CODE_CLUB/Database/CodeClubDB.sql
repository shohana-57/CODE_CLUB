
USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'CodeClubDB')
BEGIN
    CREATE DATABASE CodeClubDB;
END
GO

USE CodeClubDB;
GO

IF OBJECT_ID('Feedback','U')  IS NOT NULL DROP TABLE Feedback;
IF OBJECT_ID('Contacts','U')  IS NOT NULL DROP TABLE Contacts;
IF OBJECT_ID('Events','U')    IS NOT NULL DROP TABLE Events;
IF OBJECT_ID('Projects','U')  IS NOT NULL DROP TABLE Projects;
IF OBJECT_ID('Members','U')   IS NOT NULL DROP TABLE Members;
IF OBJECT_ID('Admins','U')    IS NOT NULL DROP TABLE Admins;
GO

-- ADMINS
CREATE TABLE Admins (
    AdminID      INT IDENTITY(1,1) PRIMARY KEY,
    Username     NVARCHAR(50)  NOT NULL UNIQUE,
    PasswordHash NVARCHAR(256) NOT NULL,
    FullName     NVARCHAR(100) NOT NULL,
    CreatedAt    DATETIME      DEFAULT GETDATE()
);
GO

-- MEMBERS
CREATE TABLE Members (
    MemberID     INT IDENTITY(1,1) PRIMARY KEY,
    FullName     NVARCHAR(100) NOT NULL,
    Email        NVARCHAR(150) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(256) NOT NULL,
    SkillLevel   NVARCHAR(50),
    WhyJoin      NVARCHAR(MAX),
    Role         NVARCHAR(50)  DEFAULT 'Member',
    IsActive     BIT           DEFAULT 1,
    JoinedAt     DATETIME      DEFAULT GETDATE()
);
GO

-- PROJECTS
CREATE TABLE Projects (
    ProjectID    INT IDENTITY(1,1) PRIMARY KEY,
    Title        NVARCHAR(150) NOT NULL,
    Category     NVARCHAR(50),
    Description  NVARCHAR(MAX),
    Technologies NVARCHAR(200),
    ProjectURL   NVARCHAR(300),
    IsVisible    BIT           DEFAULT 1,
    CreatedAt    DATETIME      DEFAULT GETDATE()
);
GO

-- EVENTS
CREATE TABLE Events (
    EventID     INT IDENTITY(1,1) PRIMARY KEY,
    Title       NVARCHAR(150) NOT NULL,
    EventType   NVARCHAR(50),
    Description NVARCHAR(MAX),
    EventDate   DATE          NOT NULL,
    IsVisible   BIT           DEFAULT 1,
    CreatedAt   DATETIME      DEFAULT GETDATE()
);
GO

-- CONTACTS
CREATE TABLE Contacts (
    ContactID   INT IDENTITY(1,1) PRIMARY KEY,
    Name        NVARCHAR(100) NOT NULL,
    Email       NVARCHAR(150) NOT NULL,
    Message     NVARCHAR(MAX) NOT NULL,
    SubmittedAt DATETIME      DEFAULT GETDATE(),
    IsRead      BIT           DEFAULT 0
);
GO

-- FEEDBACK
CREATE TABLE Feedback (
    FeedbackID  INT IDENTITY(1,1) PRIMARY KEY,
    Name        NVARCHAR(100) NOT NULL,
    Email       NVARCHAR(150) NOT NULL,
    Message     NVARCHAR(MAX) NOT NULL,
    Rating      INT CHECK (Rating BETWEEN 1 AND 5),
    SubmittedAt DATETIME      DEFAULT GETDATE()
);
GO

-- SEED ADMIN (password = Admin@123)
INSERT INTO Admins (Username, PasswordHash, FullName)
VALUES (
    'admin',
    'e86f78a8a3caf0b60d8e74e5942aa6d86dc150cd3c03338aef25b7d2d7e3acc7',
    'Club Administrator'
);
GO

-- SEED PROJECTS
INSERT INTO Projects (Title, Category, Description, Technologies) VALUES
('Code Editor',       'Web App',     'A web-based code editor supporting multiple languages with real-time collaboration.', 'JavaScript, WebSockets, Node.js'),
('Learning Platform', 'EdTech',      'Interactive platform with coding tutorials, challenges and quizzes.',                'React, Python, PostgreSQL'),
('Component Library', 'Open Source', 'Reusable library of UI components and code snippets for any project.',               'TypeScript, Storybook, CSS');
GO

-- SEED EVENTS
INSERT INTO Events (Title, EventType, Description, EventDate) VALUES
('Code Workshop',        'Workshop',    'Hands-on coding workshop exploring latest trends in software development.', '2025-06-14'),
('Hackathon 2025',       'Competition', '24-hour challenge to build innovative solutions to real-world problems.',   '2025-06-28'),
('Guest Speaker Series', 'Talk',        'Industry experts sharing insights from the world of software engineering.', '2025-07-10');
GO

PRINT 'CodeClubDB created and seeded successfully.';
GO