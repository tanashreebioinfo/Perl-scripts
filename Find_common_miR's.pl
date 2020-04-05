########## Find Common Genes of two datasets based on ensemble id's ######

open(fh,"gse32688_DEM's.txt");
open(fh2,"gse41372_DEM's.txt");


open(out,">Common_DEM's.txt");
@file=<fh>;
@file2=<fh2>;


			foreach $line(@file){
			
				if ($line=~m/(.*?)\s+(.*?)\s+/)
				{
					$mir=$1;
					push(@mir,$mir);
					$exp=$2;
					push(@exp,$exp);
					
				}
			}
			
			
				
				foreach $a(@file2){
				
					if($a=~m/(.*?)\s+(.*?)\s+/)
					{
						$mir2=$1;
						push(@mir2,$mir2);
						$exp2=$2;
						push(@exp2,$exp2);
						
					}
				}

					print out "gse32688_miRNA\tExpression\tgse41372_miRNA\tExpression\n";

				
						for($i=0; $i<scalar(@mir);$i++){
							for($j=0;$j<scalar(@mir2);$j++){
							
								if($mir[$i] eq $mir2[$j]){
								
								print out "$mir[$i]\t$exp[$i]\t$mir2[$j]\t$exp2[$j]\n";
							}
						}
					}