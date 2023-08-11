CREATE TABLE IF NOT EXISTS ODS_SABRE.tb_tkt_tax
(
  `ID_DATE_BQ` STRING OPTIONS(description="Date of data load to the database."),
  `RecordIndicator` INT64 OPTIONS(description="A numeric value that identifies the table in which the row resides. All rows belonging to TktTax have a value of 20 in this column."),
  `PNRLocatorID` STRING OPTIONS(description="Sabre PNR locator ID. Also known as the Host Record Locator."),
  `PNRCreateDate` DATE OPTIONS(description="Date that the PNR was created in the Sabre host system."),
  `PrimaryDocNbr` STRING OPTIONS(description="The document number including the carrier accounting code less the check digit and coupon numbers. If the document is conjunctive it is the first document number in the series."),
  `VCRCreateDate` DATE OPTIONS(description="The date that the document was issued. Date is stated according to host system time (US Central Time). The value is YYYY-MM-DD."),
  `TransactionDateTime` DATETIME OPTIONS(description="Date and Time of the most recent modification to the document. YYYY-MM-DD HH:MM:SS.000000."),
  `TaxSeqNbr` INT64 OPTIONS(description="Internal database sequencing number assigned to each unique tax/fee item within a ticket."),
  `TaxAmt` NUMERIC OPTIONS(description="Amount of the tax or fee being charged stated in the EquivBaseFareCurrCode currency."),
  `TaxCode` STRING OPTIONS(description="Code uniquely identifying the specific tax or fee being charged."),
  `TaxTypeCode` STRING OPTIONS(description="Value is stated as: Blank or Null – taxes applicable to the ticket at original and/or subsequent issue Y – taxes already paid on original issue for international tickets N – unpaid tax to be collected from the passenger when tickets are exchanged F – tax that applies to change fee during exchange or refund transactions."),
  `TaxCategoryCode` STRING OPTIONS(description="The code identifying the broad category into which the specific tax falls. Values are stated as (but are not limited to): NEW – new taxes OTH – other taxes."),
  `TaxCurrCode` STRING OPTIONS(description="The currency code associated with the TaxAmt.")
);
