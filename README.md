"Specification"

"In import.sql, write a series of SQL (and SQLite) statements to import and clean the data from meteorites.csv into a table, meteorites, in a database called meteorites.db.

Within meteorites.db, the meteorites table should have the following columns:

Columns in the meteorites table
Keep in mind that not all columns in the CSV should end up in the final table!

To consider the data in the meteorites table clean, you should ensure…

Any empty values in meteorites.csv are represented by NULL in the meteorites table.
Keep in mind that the mass, year, lat, and long columns have empty values in the CSV.
All columns with decimal values (e.g., 70.4777) should be rounded to the nearest hundredths place (e.g., 70.4777 becomes 70.48).
Keep in mind that the mass, lat, and long columns have decimal values.
All meteorites with the nametype “Relict” are not included in the meteorites table.
The meteorites are sorted by year, oldest to newest, and then—if any two meteorites landed in the same year—by name, in alphabetical order.
You’ve updated the IDs of the meteorites from meteorites.csv, according to the order specified in #4.
The id of the meteorites should start at 1, beginning with the meteorite that landed in the oldest year and is the first in alphabetical order for that year.


Advice
It can feel overwhelming to know where to start when cleaning such a big data file! Let’s break the problem down into smaller pieces.

Begin by importing meteorites.csv into a temporary table
Write SQL statements to clean the imported data
Transfer the data from your temporary table into a meteorites table


Usage
Let’s introduce a few terminal commands that might come in handy while you’re working on cleaning this data set! Consider the following:

cat import.sql | sqlite3 meteorites.db
The above command can be broken down into two parts:

cat import.sql outputs the data in import.sql. Try it by itself if you’re curious.
sqlite3 meteorites.db opens a file called meteorites.db with the sqlite3 engine, as you’re already familiar with.
When these commands are combined with a pipe, |, the data from import.sql is treated as a set of statements for sqlite3 to run on meteorites.db. If meteorites.db doesn’t yet exist, it will be created and the statements in import.sql will be run on it.

What if your import.sql isn’t perfect and you want to re-create the database? Consider deleting the current version of meteorites.db with:

rm meteorites.db
rm stands for remove. If prompted, type “y” followed by enter to confirm the deletion of meteorites.db. From there, you can re-run cat import.sql | sqlite3 meteorites.db to create meteorites.db from scratch.

Looking to speed things up? You can use the up arrow to access previously typed commands in your terminal."
