CREATE TABLE IF NOT EXISTS ODS_SABRE.tb_tkt_remark (
  `ID_DATE_BQ` STRING OPTIONS(description="Date of data load to the database."),
  `Record_Indicator` INT64 OPTIONS(description="A numeric value that identifies the table in which the row resides. All rows belonging to TktRemark have a value of 23 in this column.") NOT NULL,
  `PNRLocatorID` STRING OPTIONS(description="Sabre PNR locator ID. Also known as the Host Record Locator.") NOT NULL,
  `PNRCreateDate` DATE OPTIONS(description="Date that the PNR was created in the Sabre host system.") NOT NULL,
  `PrimaryDocNbr` STRING OPTIONS(description="The document number including the carrier accounting code less the check digit and coupon numbers. If the document is conjunctive it is the first document number in the series.") NOT NULL,
  `VCRCreateDate` DATE OPTIONS(description="The date that the document was issued. Date is stated according to host system time (US Central Time). The value is YYYY-MM-DD.") NOT NULL,
  `TransactionDateTime` TIMESTAMP OPTIONS(description="Date and Time of the most recent modification to the document. YYYY-MM-DD HH:MM:SS.000000.") NOT NULL,
  `RemarkSeqNbr` INT64 OPTIONS(description="Internal database sequencing number assigned to each remark within a document.") NOT NULL,
  `RemarkTxt` STRING OPTIONS(description="Free format text of the document remark.") NOT NULL
)
OPTIONS(
  description="This table contains details about remarks associated with airline ticket documents, capturing information about remarks, creation dates, and more.",
  labels=[("origen", "sabre"),("capa", "bronze"),("grupo","tkt"),("archivo","tktremark")]
);