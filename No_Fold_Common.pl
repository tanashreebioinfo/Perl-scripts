########## Find Common Genes of two datasets based on ensemble id's ######

open(fh,"gse32688_no_fold.txt");
open(fh2,"gse41372_no_fold.txt");


open(out,">No_Fold_common.txt");
@file=<fh>;
@file2=<fh2>;


			foreach $line(@file){
			
				if ($line=~m/(.*?)\s+(.*?)\s+(.*?)\s+(.*?)\s+/)
				{
					$id=$1;
					push(@id,$id);
					$symbol=$2;
					push(@symbol,$symbol);
					$entrez=$3;
					$exp=$4;
					push(@entrez,$entrez);
					push(@exp,$exp);
				}
			}
			
			
				
				foreach $a(@file2){
				
					if($a=~m/(.*?)\s+(.*?)\s+(.*?)\s+(.*?)\s+/)
					{
						$id2=$1;
						push(@id2,$id2);
						$symbol2=$2;
						push(@symbol2,$symbol2);
						$entrez2=$3;
						$exp2=$4;
						push(@entrez2,$entrez2);
					push(@exp2,$exp2);
					}
				}
				
			print out "gse32688_symbol\tExpression\tgse41372_symbol\tExpression\tEntrez_ID\n";
			
						for($i=0; $i<scalar(@entrez);$i++){
							for($j=0;$j<scalar(@entrez2);$j++){
							
								if($entrez[$i] eq $entrez2[$j]){
								
								print out "$symbol[$i]\t$exp[$i]\t$symbol2[$j]\t$exp2[$j]\t$entrez[$i]\n";
							}
						}
					}