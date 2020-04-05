#program to extract Information from NCBI Taxanomic browser to extract tax id
use LWP::Simple qw(!head);
$ua = LWP::UserAgent->new;
$ua->timeout(1800);
open(fh,"dps_ID.txt");
open(out,">dps_result.txt");
@file=<fh>;

foreach $line(@file)
{
$id=$line;
chomp $id;
#Following is the Most imp Step
$ua->proxy(['http'], 'http://2014p_ghosh:nibedita123@196.1.114.238:2222');  # set proxy
#$ua->env_proxy;
$url = "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=$id&rettype=fasta&retmode=xml"; 

$response = $ua->get($url);                          #connect to url

	if ($response->is_success)  
	{ 
	$agcontent=$response->content;
	print out"$agcontent";
	push(@GI,$agcontent);
	
	}
	
}