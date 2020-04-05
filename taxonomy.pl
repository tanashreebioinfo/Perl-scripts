open(fh,"dps_result.txt");
open(out,">tax.txt");
@file=<fh>;
foreach $line(@file)
{
if($line=~/\<TSeq_gi\>(.*)\<\/TSeq_gi\>/)
{
$gi=$1;
#print out"$gi\n";
}

if(($line=~/\<TSeq_accver\>(.*)\<\/TSeq_accver\>/)||($line=~/\<TSeq_sid\>pdb\|(.*)\|A\<\/TSeq_sid\>/))
{
$ref_id=$1;
#print out"$ref_id\n";
}

if($line=~/\<TSeq_taxid\>(.*)\<\/TSeq_taxid\>/)
{
$tax_id=$1;
#print out"$tax_id\n";
}

if($line=~/\<TSeq_orgname\>(.*)\<\/TSeq_orgname\>/)
{
$org_name=$1;
#print out"$org_name\n";
print "$gi\t$ref_id\t$tax_id\t$org_name\n";
}  
#print "$gi\t$ref_id\t$tax_id\t$org_name\n";
}