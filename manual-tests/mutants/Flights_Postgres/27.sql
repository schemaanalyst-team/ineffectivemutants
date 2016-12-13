-- 27
-- NNCA
-- Added NOT NULL to column ECONOMY_SEATS_TAKEN in table FlightAvailable

CREATE TABLE "Flights" (
	"FLIGHT_ID"	CHAR(6)	NOT NULL,
	"SEGMENT_NUMBER"	INT	NOT NULL,
	"ORIG_AIRPORT"	CHAR(3),
	"DEPART_TIME"	TIME,
	"DEST_AIRPORT"	CHAR(3),
	"ARRIVE_TIME"	TIME,
	"MEAL"	CHAR(1)	NOT NULL,
	PRIMARY KEY ("FLIGHT_ID", "SEGMENT_NUMBER"),
	CONSTRAINT "MEAL_CONSTRAINT" CHECK ("MEAL" IN ('B', 'L', 'D', 'S'))
)

CREATE TABLE "FlightAvailable" (
	"FLIGHT_ID"	CHAR(6)	NOT NULL,
	"SEGMENT_NUMBER"	INT	NOT NULL,
	"FLIGHT_DATE"	DATE	NOT NULL,
	"ECONOMY_SEATS_TAKEN"	INT	NOT NULL,
	"BUSINESS_SEATS_TAKEN"	INT,
	"FIRSTCLASS_SEATS_TAKEN"	INT,
	CONSTRAINT "FLTAVAIL_PK" PRIMARY KEY ("FLIGHT_ID", "SEGMENT_NUMBER"),
	CONSTRAINT "FLTS_FK" FOREIGN KEY ("FLIGHT_ID", "SEGMENT_NUMBER") REFERENCES "Flights" ("FLIGHT_ID", "SEGMENT_NUMBER")
)
