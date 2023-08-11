CREATE TABLE IF NOT EXISTS ODS_SABRE.tb_tkt_address (
  `ID_DATE_BQ` DATE OPTIONS(description="Date of data load to the database."),
  `RecordIndicator` INT64 OPTIONS(description="A numeric value that identifies the table in which the row resides. All rows belonging to TktAddress have a value of 24 in this column."),
  `PNRLocatorID` STRING OPTIONS(description="Sabre PNR locator ID. Also known as the Host Record Locator."),
  `PNRCreateDate` DATE OPTIONS(description="Date that the PNR was created in the Sabre host system."),
  `PrimaryDocNbr` STRING OPTIONS(description="The document number including the carrier accounting code less the check digit and coupon numbers. If the document is conjunctive it is the first document number in the series."),
  `VCRCreateDate` DATE OPTIONS(description="The date that the document was issued. Date is stated according to host system time (US Central Time). The value is YYYY-MM-DD."),
  `TransactionDateTime` TIMESTAMP OPTIONS(description="Date and Time of the most recent modification to the document. YYYY-MM-DD HH:MM:SS.000000."),
  `AddrSeqNbr` INT64 OPTIONS(description="Sabre sequencing number assigned to each address line within the TBM field of the PNR."),
  `AddrTxt` STRING OPTIONS(description="Passenger Address from the PNR (W-N/). Note: The field is populated when Ticket Delivery Service issues the ticket. Does not get populated if ATO, CTO issues the ticket. May not be populated if Res issues the ticket.")
)
OPTIONS(
  description="This table stores information about passenger addresses from PNRs, including details such as record indicators, locator IDs, creation dates, document numbers, creation dates for documents, transaction date and time, address sequence numbers, and passenger addresses."
  labels=[("origen", "sabre"),("capa", "bronze"),("grupo","tkt"),("archivo","tktaddress")]
);