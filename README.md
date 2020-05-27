# SLE712_files
These are files which will be used for teaching purposes in SLE712 Bioinformatics and Biotechnology at Deakin University.

## ab1files
These are some Sanger sequencing files used in 2019 but not for 2020.

## bioinfo_asst3_part1_files
This folder contains mydata.tsv, gene_expression.tsv and growth_data.csv. We will work with the mydata.tsv file in class to demonstrate how to properly read a system file into R. The other two files gene_expression.tsv and growth_data.csv will be used by students to answer questions asked in assignment 3 part 1. This part of the assignment is designed to test students ability to read files into R and perform ordering, subsetting, and create simple charts.

## bioinfo_asst3_part2_files
This folder contains example.fa, create_fasta.sh, sample.fa, mutblast_functions and unwrap_fasta.pl. create_fasta.sh is a shell script called that samples 20 random E. coli gene sequences. The sample.fa file is a multi fasta file containing 20 randomly selected E. coli gene sequences. The names of the sequences in sample.fa have been removed because it is part of the exercise for students to figure out to what gene these sequences belong. In class we will work together to analyse a sequence in the example.fa file. The mutblast_functions.R file contains some handy functions that students should use in their assignment to perform random mutagenesis of a sequence and to perform a blast search. The unwrap_fasta.pl file is a perl script to unwrap a fasta file. This part of the assignment is designed to test more advanced skills including using randomisation tools, using BLAST, performing simulations and interpreting data.

## home_exercise.Rmd
This covers the answers to the take-home questions for prac 1.

## prac2revision.Rmd
This is an Rmarkdown document that revises work done in prac 2 where we began working with version control, code documentation and Rmarkdown.

## apply.Rmd
This is an Rmarkdown document will be covered in prac 3.

## BioinfoPrac4
In this prac we will be applying everything we've learned to begin analysing sequence data in R


# Subject: SLE 712
# Project title: Assigment 3 

## Aim

This project is a combination of Git hub and Rstudio where Git hub is the version control.

aim of part-1:

 * develop skills in problem solving and R coding.
 
aim part-2:  

* Download and unzip files.
* Perform simple manipulations and analyses with sequence data.
* Use a provided function to incorporate point mutations into a sequence.
* Use provided functions to perform a BLAST search and interpret results.
* Creating functions to perform complicated issues related to randomised mutated blast searches.


## Motivation

To practice R studio and Git hub collaberation.

## Contents

gene_expression.tsv-data set for RNA sequence of two samples of interest
growth_data.csv-contains measurements for tree circumference growing at two sites, control site and treatment site which were planted 20 years ago
E.Coli gene sequence database.
sample.fa-multifasta file of 200 sequences of E.coli
A sequence of interest known as Groupseq.
Set of functions(myblastn,myblastn_tab, mutator)

## Installation

Rstudio version 1.2.1335 and R
R version 3.6.3


## Contribute

Mandhri Abeysooriya and Rusheni Senanayake.

## Credits
Mandhri Abeysooriya, Rusheni Senanayake and DR. Mark ziemann.


## License

licensed under the [GNU General Public License v3.0](LICENCE

