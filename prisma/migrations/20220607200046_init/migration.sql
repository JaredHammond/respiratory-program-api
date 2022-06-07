-- CreateTable
CREATE TABLE "Employee" (
    "id" SERIAL NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "workArea" TEXT,
    "currentEmployee" BOOLEAN NOT NULL,
    "active" BOOLEAN NOT NULL,
    "appendixDOnFile" BOOLEAN NOT NULL,

    CONSTRAINT "Employee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MedicalEvaluation" (
    "id" SERIAL NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "PLHCP" TEXT NOT NULL,
    "EvalDate" TIMESTAMP(3) NOT NULL,
    "approved" BOOLEAN NOT NULL,
    "comment" TEXT,

    CONSTRAINT "MedicalEvaluation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FitTest" (
    "id" SERIAL NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "respiratorId" INTEGER NOT NULL,
    "date" TEXT NOT NULL,
    "protocol" TEXT NOT NULL,
    "pass" BOOLEAN NOT NULL,
    "comment" TEXT,

    CONSTRAINT "FitTest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Respirator" (
    "id" SERIAL NOT NULL,
    "oldId" INTEGER,
    "manufacturer" TEXT NOT NULL,
    "series" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "size" TEXT NOT NULL,
    "fitTestRequired" BOOLEAN NOT NULL,
    "respiratorType" TEXT NOT NULL,
    "protectionType" TEXT NOT NULL,

    CONSTRAINT "Respirator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vendor" (
    "id" SERIAL NOT NULL,
    "vendorName" TEXT,
    "addressStreet" TEXT,
    "addressCity" TEXT,
    "addressState" TEXT,
    "addressZIP" TEXT,
    "phoneNumber" TEXT,
    "comment" TEXT,

    CONSTRAINT "Vendor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VendorAttachment" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "attachmentName" TEXT NOT NULL,
    "attachmentType" TEXT NOT NULL,
    "fileName" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "vendorId" INTEGER NOT NULL,

    CONSTRAINT "VendorAttachment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmployeeAttachment" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "attachmentName" TEXT NOT NULL,
    "attachmentType" TEXT NOT NULL,
    "fileName" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "employeeId" INTEGER NOT NULL,

    CONSTRAINT "EmployeeAttachment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Respirator_oldId_key" ON "Respirator"("oldId");

-- AddForeignKey
ALTER TABLE "MedicalEvaluation" ADD CONSTRAINT "MedicalEvaluation_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FitTest" ADD CONSTRAINT "FitTest_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FitTest" ADD CONSTRAINT "FitTest_respiratorId_fkey" FOREIGN KEY ("respiratorId") REFERENCES "Respirator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VendorAttachment" ADD CONSTRAINT "VendorAttachment_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "Vendor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmployeeAttachment" ADD CONSTRAINT "EmployeeAttachment_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
