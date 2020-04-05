######### Code for checking the genes which are differentially expressed in our analysed datasets and are targets of miRNA #####

open(fh,"GSE32688_miR_validated_Targets.txt");
open(fn,"GSE32688_gene_FC2.txt");

open(out,">gse32688_Expressed_Targets_at_2_folds.txt");

@arr1=<fh>;
@arr2=<fn>;
shift(@arr2);

	foreach $a(@arr1){
	
		if ($a=~m/(.*?)\s+(.*?)\s+(.*?)\s+/)
							{
				push(@mir,$1);
				push(@mir_exp,$2);
				push(@gene,$3);
				#push(@ensemble,$4);
					}
	}
	
	
			foreach $b(@arr2){
				
					
					if ($b=~m/(.*?)\s+(.*?)\s+/)
							{
								push(@gene2,$1);
								push(@exp,$2);
								#push(@gene2,$3);
								
		}
	}
	
	
				print out "miRNA\tmiR_expression\tTarget_gene\tSynonyms\tEnsemble_ID\n";
					for($i=0; $i<scalar(@gene); $i++){
						for($j=0; $j<scalar(@gene2); $j++){
						
							if ($gene[$i] eq $gene2[$j]){
								
				print out "$mir[$i]\t$mir_exp[$i]\t$gene[$i]\t$exp[$j]\n";
								
							}
						
					}
				}