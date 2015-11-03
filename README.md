Grail
============================
This project is aimed at generating runnable SQL queries for graph analytical queries.

How to run Grail?
-----------------------------------------------------------
The following instructions are for a Unix/Linux based machine:

1. Clone the git Grail repository into your local machine using one of the following commands:
  1. `git clone https://github.com/PangZhi/Grail.git` (or)
  2. `git clone git@github.com:PangZhi/Grail.git`

2. Change your current working directory to "Grail" or any directory that you have downloaded the code into.
  `cd Grail`

3. Change directory to "src" to browse through the code or to compile and run the code.
  `cd src`

4. Compile the java code using the following command: (Hopefully compilation will have no issues!)
  `javac *.java`

5. Run the Grail code, in any of the following ways: (`config.txt` is used as the default configuration file, if no config file is given)
  - `java Grail` (uses the default configuration file `config.txt`)
  - `java Grail configs/pagerank.txt` (to generate the SQL for a pagerank graph program)
  - `java Grail configs/sssp.txt` (to generate the SQL for a Single Source Shortest Path(SSSP) graph program)
  - `java Grail configs/wcc.txt` (to generate the SQL for a Weakly Connected Component(WCC) graph program)

6. Execute the SQL statements generated by Grail (i.e. output of step 5) in a Microsoft SQL Server Database.

Basic Tables
---------------------------
We have two basic table : vertex and edge.

    vertex is created by :
    CREATE TABLE vertex {
      vertex_id INT
    }

    edge is created by :
    CREATE TABLE edge {
      src_id INT,
      dest_id INT
    }
    Primary key, indexes and other constraint may be added by user.

The basic idea is that a graph analytics program(e.g. Shortest Path/PageRank/Connected Component) can be implemented in SQL database by using SQL joins and updates on relational tables. We want to provide a user-friendly way to generate SQL for graph analytics. The user will input a configuration file of specific format and the program will generate runnable sql.

Example configuration files
---------------------------
pagerank.txt -- page rank algorithm

sssp.txt -- single source shortest path algorithm

wcc.txt -- weakly connected component algorithm

