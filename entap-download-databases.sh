#!/bin/bash

echo "baixando refseq"
mkdir refseq
wget -P ./refseq/ https://ftp.ncbi.nlm.nih.gov/refseq/release/complete/*.faa.gz
echo "refseq baixado"

echo -e "\nbaixando nr"
mkdir nr
wget -P ./nr/ ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/nr.gz
echo "nr baixado"

echo -e "\nbaixando swissprot"
mkdir swissprot
wget -P ./swissprot/ ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz
echo "swissprot baixado"

echo -e "\nbaixando trembl"
mkdir trembl
wget -P ./trembl/ ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_trembl.fasta.gz
echo "trembl baixado"

echo -e "\nbaixando eggnog_diamond"
mkdir eggnog_diamond
wget -P ./eggnog_diamond/ http://eggnog5.embl.de/download/eggnog_4.1/eggnog-mapper-data/eggnog4.clustered_proteins.fa.gz
echo "eggnog_diamond baixado"

echo -e "\nbaixando entap_binary"
mkdir entap_binary
wget -P ./entap_binary/ https://treegenesdb.org/FTP/EnTAP/latest/databases/entap_database.bin.gz
echo "entap_binary baixado"

echo -e "\nbaixando univec"
mkdir univec
wget -P ./univec/ https://ftp.ncbi.nlm.nih.gov/pub/UniVec/UniVec/*
echo "univec baixado"
