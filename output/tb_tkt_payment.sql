CREATE TABLE IF NOT EXISTS ODS_SABRE.tb_tkt_payment (
  `ID_DATE_BQ` STRING OPTIONS(description="Date of data load to the database."),
  `RecordIndicator` INT64 OPTIONS(description="A numeric value that identifies the table in which the row resides. All rows belonging to TktPayment have a value of 22 in this column."),
  `PNRLocatorID` STRING OPTIONS(description="Sabre PNR locator ID. Also known as the Host Record Locator."),
  `PNRCreateDate` DATE OPTIONS(description="Date that the PNR was created in the Sabre host system."),
  `PrimaryDocNbr` STRING OPTIONS(description="The document number including the carrier accounting code less the check digit and coupon numbers. If the document is conjunctive it is the first document number in the series."),
  `VCRCreateDate` DATE OPTIONS(description="The date that the document was issued. Date is stated according to host system time (US Central Time). The value is YYYY-MM-DD."),
  `TransactionDateTime` TIMESTAMP OPTIONS(description="Date and Time of the most recent modification to the document. YYYY-MM-DD HH:MM:SS.000000."),
  `PaymentSeqNbr` INT64 OPTIONS(description="Internal database sequencing number assigned to each form of payment within a document number. Example: multiple forms of payment."),
  `FOPCode` STRING OPTIONS(description="Code indicating the form of payment used. See appendix for applicable values."),
  `PaymentAmt` NUMERIC OPTIONS(description="Amount paid using the form of payment code type indicated."),
  `PaymentVendorCode` STRING OPTIONS(description="Credit Card vendor code."),
  `AcctNbr` STRING OPTIONS(description="Credit card number, exchanged ticket number, or other account number associated with the form of payment used. NOTE: When a Credit Card is used for FOP, the credit card number is partially masked."),
  `PaymentCurrCode` STRING OPTIONS(description="Currency code of the transaction."),
  `PaymentRemarks` STRING OPTIONS(description="Free text information about the specified form of payment."),
  `PaymentApprovalCode` STRING OPTIONS(description="Credit card/Debit card approval code."),
  `PaymentApprovalTypeCode` STRING OPTIONS(description="Code that conveys the method used to obtain credit/debit card approval code. Z = approval code obtained first from card vendor before the ticket/document was issued. S = sent via EDIFACT; approval code obtained through system. M = sent via edifact; approval code manually obtained."),
  `BankCardBINNbr` STRING OPTIONS(description="BIN number of the CC FOP for this ticket document.")
)
PARTITION BY(ID_DATE_BQ)
OPTIONS(
  description="This table stores information about airline ticket documents, capturing details such as ticket issuance, passenger data, fares, and financial information. It's a vital resource for tracking and managing ticket-related transactions, providing insights into passenger itineraries, fares, currencies, and more.",
  labels=[("origen", "sabre"),("capa", "bronze"),("grupo","tkt"),("archivo","tktpayment")]
);