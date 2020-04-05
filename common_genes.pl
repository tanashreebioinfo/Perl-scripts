#program to find common interacting genes
use List::MoreUtils qw(uniq);
open(fh,"file.txt");
open(out,">out.txt");
@gene=<fh>;
print "$gene[1]";
shift(@gene);
foreach $line(@gene)
	{
	
		%genes=('fis'=>$gene[0],'cbpA'=>$gene[1],
        	'dnaA'=>$gene[2],'hfq'=>$gene[3],
        	'hns'=>$gene[4],'hupA'=>$gene[5],
        	'hupB'=>$gene[6],'iciA'=>$gene[7],
        	'ihfA'=>$gene[8],'ihfB'=>$gene[9],
        	'lrp'=>$gene[10],'stpA'=>$gene[11]);
	}


	foreach $key (keys %genes)
 		{
    			push(@keys,$key);
	        }
		foreach $key (values %genes)
			{
    				push(@values,$key);
			}

#print "$keys[0]\t$values[0]\n";