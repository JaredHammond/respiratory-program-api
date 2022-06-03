-- CreateTable
CREATE TABLE "Employee" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "workArea" TEXT,
    "currentEmployee" BOOLEAN NOT NULL,
    "active" BOOLEAN NOT NULL,
    "appendixDOnFile" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "MedicalEvaluation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "employeeId" INTEGER NOT NULL,
    "PLHCP" TEXT NOT NULL,
    "EvalDate" DATETIME NOT NULL,
    "approved" BOOLEAN NOT NULL,
    "comment" TEXT,
    CONSTRAINT "MedicalEvaluation_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "FitTest" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "employeeId" INTEGER NOT NULL,
    "respiratorId" INTEGER NOT NULL,
    "date" TEXT NOT NULL,
    "protocol" TEXT NOT NULL,
    "pass" BOOLEAN NOT NULL,
    "comment" TEXT,
    CONSTRAINT "FitTest_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "FitTest_respiratorId_fkey" FOREIGN KEY ("respiratorId") REFERENCES "Respirator" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Respirator" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "manufacturer" TEXT NOT NULL,
    "series" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "size" TEXT NOT NULL,
    "fitTestRequired" BOOLEAN NOT NULL,
    "respiratorType" TEXT NOT NULL,
    "protectionType" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Vendor" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "vendorName" TEXT,
    "addressStreet" TEXT,
    "addressCity" TEXT,
    "addressState" TEXT,
    "addressZIP" TEXT,
    "phoneNumber" TEXT,
    "comment" TEXT
);

-- CreateTable
CREATE TABLE "VendorAttachment" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "attachmentName" TEXT NOT NULL,
    "attachmentType" TEXT NOT NULL,
    "fileName" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "vendorId" INTEGER NOT NULL,
    CONSTRAINT "VendorAttachment_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "Vendor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "EmployeeAttachment" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "attachmentName" TEXT NOT NULL,
    "attachmentType" TEXT NOT NULL,
    "fileName" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "employeeId" INTEGER NOT NULL,
    CONSTRAINT "EmployeeAttachment_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
