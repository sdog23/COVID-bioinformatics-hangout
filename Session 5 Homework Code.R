library(tidyverse)


##PART A 
#load in data
nCoV_2019_primer <- read_delim("Downloads/artic-ncov2019-master/primer_schemes/nCoV-2019/V3/nCoV-2019.primer.bed",
                               "\t", escape_double = FALSE, col_names = FALSE, 
                               trim_ws = TRUE)

#give columns names
nCoV_2019_primer = rename(nCoV_2019_primer, "reference sequence"  = "X1", 
                          "Start position" = "X2", 
                          "last position" = "X3", 
                          "primer name" = "X4", 
                          "primer pool" = "X5",
                          "F/R" = "X6")

#group primers by 'left' and subset for only the start position and primer name columns to get starting position of amplicons
start_position <- nCoV_2019_primer[grep("LEFT", nCoV_2019_primer$`primer name`), ]
start_position <- start_position[, c(2,4)]


#repeat for the 'right' primer ot get the final position of the amplicons
final_position <- nCoV_2019_primer[grep("RIGHT", nCoV_2019_primer$`primer name`), ]
final_position <- final_position[, c(3,4)]


#calculate amplicon size for each primer pair by combining the two data frames made above and doing the calculation
amplicon_size <- cbind(start_position, final_position)
amplicon_size$amplicon_size_bp <- (amplicon_size$`last position` - amplicon_size$`Start position`)


##PART B
#load in data 

MN.seq <- read_excel("OneDrive - LSTM/PhD/Bioinformatics Training Phil Ashton/Phil scripts and files/Midnight_SARS_CoV2_sequences_only.xlsx")
view(MN.seq)

#to import the reference genome fasta file, import, text (base), select the fasta file , click heading and import
nCoV.2019.reference


#Adding two columns ,Start & End to the primer_df
MN.seq['Start'] = ""
MN.seq['End']   = ""

