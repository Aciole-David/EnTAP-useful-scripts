#!/bin/bash
#Concatenate splitted EnTAP outputs

mkdir -p ./merged/final_results
mkdir -p ./merged/ontology/EggNOG_DMND/figures
mkdir -p ./merged/ontology/EggNOG_DMND/processed
mkdir -p ./merged/similarity_search/DIAMOND/figures
mkdir -p ./merged/similarity_search/DIAMOND/overall_results/figures
mkdir -p ./merged/similarity_search/DIAMOND/processed/eggnog_proteins/figures
mkdir -p ./merged/similarity_search/DIAMOND/processed/nr/figures
mkdir -p ./merged/similarity_search/DIAMOND/processed/refseq/figures
mkdir -p ./merged/similarity_search/DIAMOND/processed/uniprot_sprot/figures

#final results
  echo -e "\nConcatenating final results..."
cat */final_results/final_annotated.faa >merged/final_results/merged_final_annotated.faa
cat */final_results/final_annotated.fnn >merged/final_results/merged_final_annotated.fnn
cat */final_results/final_annotations_contam_lvl0.faa >merged/final_results/merged_final_annotations_contam_lvl0.faa
cat */final_results/final_annotations_contam_lvl0.fnn >merged/final_results/merged_final_annotations_contam_lvl0.fnn
cat */final_results/final_annotations_contam_lvl0.tsv >merged/final_results/merged_final_annotations_contam_lvl0.tsv
cat */final_results/final_annotations_contam_lvl1.tsv >merged/final_results/merged_final_annotations_contam_lvl1.tsv
cat */final_results/final_annotations_contam_lvl2.tsv >merged/final_results/merged_final_annotations_contam_lvl2.tsv
cat */final_results/final_annotations_contam_lvl3.tsv >merged/final_results/merged_final_annotations_contam_lvl3.tsv
cat */final_results/final_annotations_lvl0.faa >merged/final_results/merged_final_annotations_lvl0.faa
cat */final_results/final_annotations_lvl0.fnn >merged/final_results/merged_final_annotations_lvl0.fnn
cat */final_results/final_annotations_lvl0.tsv >merged/final_results/merged_final_annotations_lvl0.tsv
cat */final_results/final_annotations_lvl1.tsv >merged/final_results/merged_final_annotations_lvl1.tsv
cat */final_results/final_annotations_lvl2.tsv >merged/final_results/merged_final_annotations_lvl2.tsv
cat */final_results/final_annotations_lvl3.tsv >merged/final_results/merged_final_annotations_lvl3.tsv
cat */final_results/final_annotations_no_contam_lvl0.faa >merged/final_results/merged_final_annotations_no_contam_lvl0.faa
cat */final_results/final_annotations_no_contam_lvl0.fnn >merged/final_results/merged_final_annotations_no_contam_lvl0.fnn
cat */final_results/final_annotations_no_contam_lvl0.tsv >merged/final_results/merged_final_annotations_no_contam_lvl0.tsv
cat */final_results/final_annotations_no_contam_lvl1.tsv >merged/final_results/merged_final_annotations_no_contam_lvl1.tsv
cat */final_results/final_annotations_no_contam_lvl2.tsv >merged/final_results/merged_final_annotations_no_contam_lvl2.tsv
cat */final_results/final_annotations_no_contam_lvl3.tsv >merged/final_results/merged_final_annotations_no_contam_lvl3.tsv
cat */final_results/final_unannotated.faa >merged/final_results/merged_final_unannotated.faa
cat */final_results/final_unannotated.fnn >merged/final_results/merged_final_unannotated.fnn
  echo "Done concatenating final results"

#ontology-logs
  echo -e "\nConcatenating ontology-logs..."
cat */ontology/EggNOG_DMND/*_eggnog_proteins.out >merged/ontology/EggNOG_DMND/merged_eggnog_proteins.out
cat */ontology/EggNOG_DMND/*_eggnog_proteins__std.err >merged/ontology/EggNOG_DMND/merged_eggnog_proteins__std.err
cat */ontology/EggNOG_DMND/*_eggnog_proteins__std.out >merged/ontology/EggNOG_DMND/merged__eggnog_proteins__std.out
  echo "Done concatenating ontology-logs!"

#ontology-outputs
  echo -e "\nConcatenating ontology-outputs..."
cat */ontology/EggNOG_DMND/processed/annotated_sequences_lvl0.faa >merged/ontology/EggNOG_DMND/processed/merged_annotated_sequences_lvl0.faa
cat */ontology/EggNOG_DMND/processed/annotated_sequences_lvl0.fnn >merged/ontology/EggNOG_DMND/processed/merged_annotated_sequences_lvl0.fnn
cat */ontology/EggNOG_DMND/processed/annotated_sequences_lvl0.tsv >merged/ontology/EggNOG_DMND/processed/merged_annotated_sequences_lvl0.tsv
cat */ontology/EggNOG_DMND/processed/unannotated_sequences_lvl0.faa >merged/ontology/EggNOG_DMND/processed/merged_unannotated_sequences_lvl0.faa
cat */ontology/EggNOG_DMND/processed/unannotated_sequences_lvl0.fnn >merged/ontology/EggNOG_DMND/processed/merged_unannotated_sequences_lvl0.fnn
cat */ontology/EggNOG_DMND/processed/unannotated_sequences_lvl0.tsv >merged/ontology/EggNOG_DMND/processed/merged_unannotated_sequences_lvl0.tsv
  echo "Done concatenating ontology-outputs!"

#similarity-logs
for i in eggnog_proteins nr refseq uniprot_sprot; do
  echo -e "\nConcatenating $i similarity logs..."
  cat */similarity_search/DIAMOND/*_final_${i}.out >merged/similarity_search/DIAMOND/merged_final_${i}.out
  cat */similarity_search/DIAMOND/*_final_${i}.out_std.err >merged/similarity_search/DIAMOND/merged_final_${i}.out_std.err
  cat */similarity_search/DIAMOND/*_final_${i}.out_std.out >merged/similarity_search/DIAMOND/merged_final_${i}.out_std.out
  echo "Done concatenating $i similarity logs!";
done

#similarity-overall-outputs
  echo -e "\nConcatenating similarity-overall-outputs..."
cat */similarity_search/DIAMOND/overall_results/best_hits_contam_lvl0.faa >merged/similarity_search/DIAMOND/overall_results/merged_best_hits_contam_lvl0.faa
cat */similarity_search/DIAMOND/overall_results/best_hits_contam_lvl0.fnn >merged/similarity_search/DIAMOND/overall_results/merged_best_hits_contam_lvl0.fnn
cat */similarity_search/DIAMOND/overall_results/best_hits_contam_lvl0.tsv >merged/similarity_search/DIAMOND/overall_results/merged_best_hits_contam_lvl0.tsv
cat */similarity_search/DIAMOND/overall_results/best_hits_lvl0.faa >merged/similarity_search/DIAMOND/overall_results/merged_best_hits_lvl0.faa
cat */similarity_search/DIAMOND/overall_results/best_hits_lvl0.fnn >merged/similarity_search/DIAMOND/overall_results/merged_best_hits_lvl0.fnn
cat */similarity_search/DIAMOND/overall_results/best_hits_lvl0.tsv >merged/similarity_search/DIAMOND/overall_results/merged_best_hits_lvl0.tsv
cat */similarity_search/DIAMOND/overall_results/best_hits_no_contam_lvl0.faa >merged/similarity_search/DIAMOND/overall_results/merged_best_hits_no_contam_lvl0.faa
cat */similarity_search/DIAMOND/overall_results/best_hits_no_contam_lvl0.fnn >merged/similarity_search/DIAMOND/overall_results/merged_best_hits_no_contam_lvl0.fnn
cat */similarity_search/DIAMOND/overall_results/best_hits_no_contam_lvl0.tsv >merged/similarity_search/DIAMOND/overall_results/merged_best_hits_no_contam_lvl0.tsv
cat */similarity_search/DIAMOND/overall_results/no_hits.faa >merged/similarity_search/DIAMOND/overall_results/merged_no_hits.faa
cat */similarity_search/DIAMOND/overall_results/no_hits.fnn >merged/similarity_search/DIAMOND/overall_results/merged_no_hits.fnn
cat */similarity_search/DIAMOND/overall_results/unselected_lvl0.tsv >merged/similarity_search/DIAMOND/overall_results/merged_unselected_lvl0.tsv
  echo "Concatenating similarity-overall-outputs!"
  
#similarity-per_DB-outputs
for j in eggnog_proteins nr refseq uniprot_sprot; do
  echo -e "\nConcatenating $j similarity per_DB outputs..."
  cat */similarity_search/DIAMOND/processed/${j}/best_hits_contam_lvl0.faa >merged/similarity_search/DIAMOND/processed/${j}/merged_best_hits_contam_lvl0.faa
  cat */similarity_search/DIAMOND/processed/${j}/best_hits_contam_lvl0.fnn >merged/similarity_search/DIAMOND/processed/${j}/merged_best_hits_contam_lvl0.fnn
  cat */similarity_search/DIAMOND/processed/${j}/best_hits_contam_lvl0.tsv >merged/similarity_search/DIAMOND/processed/${j}/merged_best_hits_contam_lvl0.tsv
  cat */similarity_search/DIAMOND/processed/${j}/best_hits_lvl0.faa >merged/similarity_search/DIAMOND/processed/${j}/merged_best_hits_lvl0.faa
  cat */similarity_search/DIAMOND/processed/${j}/best_hits_lvl0.fnn >merged/similarity_search/DIAMOND/processed/${j}/merged_best_hits_lvl0.fnn
  cat */similarity_search/DIAMOND/processed/${j}/best_hits_lvl0.tsv >merged/similarity_search/DIAMOND/processed/${j}/merged_best_hits_lvl0.tsv
  cat */similarity_search/DIAMOND/processed/${j}/best_hits_no_contam_lvl0.faa >merged/similarity_search/DIAMOND/processed/${j}/merged_best_hits_no_contam_lvl0.faa
  cat */similarity_search/DIAMOND/processed/${j}/best_hits_no_contam_lvl0.fnn >merged/similarity_search/DIAMOND/processed/${j}/merged_best_hits_no_contam_lvl0.fnn
  cat */similarity_search/DIAMOND/processed/${j}/best_hits_no_contam_lvl0.tsv >merged/similarity_search/DIAMOND/processed/${j}/merged_best_hits_no_contam_lvl0.tsv
  cat */similarity_search/DIAMOND/processed/${j}/no_hits.faa >merged/similarity_search/DIAMOND/processed/${j}/merged_no_hits.faa
  cat */similarity_search/DIAMOND/processed/${j}/no_hits.fnn >merged/similarity_search/DIAMOND/processed/${j}/merged_no_hits.fnn
  cat */similarity_search/DIAMOND/processed/${j}/unselected_lvl0.tsv >merged/similarity_search/DIAMOND/processed/${j}/merged_unselected_lvl0.tsv
  echo "Done concatenating $j similarity per_DB outputs!";
done

#Summarize figures-data with awk: sum values of column2 if lines are duplicated in column 1
summarize="./sum_aggregate_by_line-onecolumn.sh"

#ontology-figures-data
  echo -e "\nConcatenating and summarizing ontology-figures data..."
#concatenate...
cat */ontology/EggNOG_DMND/figures/biological_process0_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_biological_process0_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/biological_process1_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_biological_process1_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/biological_process2_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_biological_process2_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/biological_process3_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_biological_process3_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/cellular_component0_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_cellular_component0_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/cellular_component1_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_cellular_component1_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/cellular_component2_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_cellular_component2_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/cellular_component3_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_cellular_component3_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/eggnog_tax_scope.txt >merged/ontology/EggNOG_DMND/figures/merged_eggnog_tax_scope.txt
cat */ontology/EggNOG_DMND/figures/molecular_function0_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_molecular_function0_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/molecular_function1_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_molecular_function1_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/molecular_function2_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_molecular_function2_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/molecular_function3_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_molecular_function3_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/overall0_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_overall0_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/overall1_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_overall1_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/overall2_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_overall2_go_bar_graph.txt
cat */ontology/EggNOG_DMND/figures/overall3_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_overall3_go_bar_graph.txt

#replace spaces with underscores (otherwise the summarize fails)...
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_biological_process0_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_biological_process0_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_biological_process1_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_biological_process1_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_biological_process2_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_biological_process2_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_biological_process3_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_biological_process3_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_cellular_component0_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_cellular_component0_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_cellular_component1_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_cellular_component1_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_cellular_component2_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_cellular_component2_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_cellular_component3_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_cellular_component3_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_eggnog_tax_scope.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_eggnog_tax_scope.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_molecular_function0_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_molecular_function0_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_molecular_function1_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_molecular_function1_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_molecular_function2_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_molecular_function2_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_molecular_function3_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_molecular_function3_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_overall0_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_overall0_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_overall1_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_overall1_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_overall2_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_overall2_go_bar_graph.txt
sed -e 's/ /_/g' merged/ontology/EggNOG_DMND/figures/merged_overall3_go_bar_graph.txt >merged/ontology/EggNOG_DMND/figures/merged_temp_overall3_go_bar_graph.txt

#summarizing...
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_biological_process0_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_biological_process0_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_biological_process1_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_biological_process1_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_biological_process2_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_biological_process2_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_biological_process3_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_biological_process3_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_cellular_component0_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_cellular_component0_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_cellular_component1_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_cellular_component1_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_cellular_component2_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_cellular_component2_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_cellular_component3_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_cellular_component3_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_eggnog_tax_scope.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_eggnog_tax_scope.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_molecular_function0_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_molecular_function0_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_molecular_function1_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_molecular_function1_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_molecular_function2_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_molecular_function2_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_molecular_function3_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_molecular_function3_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_overall0_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_overall0_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_overall1_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_overall1_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_overall2_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_overall2_go_bar_graph.txt
$summarize merged/ontology/EggNOG_DMND/figures/merged_temp_overall3_go_bar_graph.txt |sort >merged/ontology/EggNOG_DMND/figures/merged_summ_overall3_go_bar_graph.txt
  echo "Done concatenating and summarizing ontology-figures data!"

#similarity-overall-figures-data
  echo -e "\nConcatenating and summarizing similarity-overall-figures data..."
cat */similarity_search/DIAMOND/overall_results/figures/_species_bar.txt >merged/similarity_search/DIAMOND/overall_results/figures/merged_species_bar.txt
cat */similarity_search/DIAMOND/overall_results/figures/_summary_bar.txt >merged/similarity_search/DIAMOND/overall_results/figures/merged_summary_bar.txt

#replace spaces with underscores (otherwise the summarize fails)...
sed -e 's/ /_/g' merged/similarity_search/DIAMOND/overall_results/figures/merged_species_bar.txt >merged/similarity_search/DIAMOND/overall_results/figures/merged_temp_species_bar.txt
sed -e 's/ /_/g' merged/similarity_search/DIAMOND/overall_results/figures/merged_summary_bar.txt >merged/similarity_search/DIAMOND/overall_results/figures/merged_temp_summary_bar.txt

$summarize merged/similarity_search/DIAMOND/overall_results/figures/merged_temp_species_bar.txt |sort >merged/similarity_search/DIAMOND/overall_results/figures/merged_summ_species_bar.txt
$summarize merged/similarity_search/DIAMOND/overall_results/figures/merged_temp_summary_bar.txt |sort >merged/similarity_search/DIAMOND/overall_results/figures/merged_summ_summary_bar.txt
  echo "Done concatenating and summarizing similarity-overall-figures data!"

#similarity-per_DB-figures-data
for k in eggnog_proteins nr refseq uniprot_sprot; do
  echo -e "\nConcatenating and summarizing $k similarity per_DB figures data..."
#concatenating
cat */similarity_search/DIAMOND/processed/${k}/figures/_species_bar.txt >merged/similarity_search/DIAMOND/processed/${k}/figures/merged_species_bar.txt
cat */similarity_search/DIAMOND/processed/${k}/figures/_summary_bar.txt >merged/similarity_search/DIAMOND/processed/${k}/figures/merged_summary_bar.txt

#replace spaces with underscores (otherwise the summarize fails)...
sed -e 's/ /_/g' merged/similarity_search/DIAMOND/processed/${k}/figures/merged_species_bar.txt >merged/similarity_search/DIAMOND/processed/${k}/figures/merged_temp_species_bar.txt
sed -e 's/ /_/g' merged/similarity_search/DIAMOND/processed/${k}/figures/merged_summary_bar.txt >merged/similarity_search/DIAMOND/processed/${k}/figures/merged_temp_summary_bar.txt

#summarizing
$summarize merged/similarity_search/DIAMOND/processed/${k}/figures/merged_temp_species_bar.txt |sort >merged/similarity_search/DIAMOND/processed/${k}/figures/merged_summ_species_bar.txt
$summarize merged/similarity_search/DIAMOND/processed/${k}/figures/merged_temp_summary_bar.txt |sort >merged/similarity_search/DIAMOND/processed/${k}/figures/merged_summ_summary_bar.txt
  echo "Done concatenating and summarizing $k similarity per_DB figures data!";
done


#debug/log 
  echo -e "\nConcatenating debug and log files..."
cat */debug_* >merged/merged_debug.txt
cat */log_file_* >merged/merged_log_file.txt
  echo "Done concatenating debug and log files!"

echo "Finished concatenating files"


