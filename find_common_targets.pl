### Finding DEM's Targets from compiled list of validated targets from three different databases 
### MirBase, mirTarBase, TarBase 
####

#use warnings;


open(fh,"Common_miR_Targets.txt");
open(fn,"No_Fold_common.txt");

open(out,">Common_miR_common_Targets.txt");

@arr1=<fh>;
@arr2=<fn>;
shift(@arr1);

	foreach $a(@arr1){
	
		if ($a=~m/(.*?)\s+(.*?)\s+(.*?)\s+/)
		{
			push(@mir,$1);
			push(@exp,$2);
			push(@target,$3);
		}
	}
	
	
			foreach $b(@arr2){
				
					if ($b=~m/(.*?)\s+(.*?)\s+(.*?)\s+(.*?)\s+(.*?)\s+/)
					{
						push(@gene,$1);
						push(@gene_exp,$2);
						push(@entrez,$5);
						
						#push(@ensemble,$3);
					}
	}
			
			print out "miRNA\tRegulation\tTarget_Gene\n";
					for($i=0; $i<scalar(@target); $i++){
						for($j=0; $j<scalar(@gene); $j++){
						
							if ($target[$i] eq $gene[$j]){
								
								print out "$mir[$i]\t$exp[$i]\t$target[$i]\t$gene[$j]\t$gene_exp[$j]\t$entrez[$j]\n";
								
							}
						
					}
				}