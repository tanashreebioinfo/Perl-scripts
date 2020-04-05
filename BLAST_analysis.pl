	open(FH,'FIS.blastp_align.ou') || die "cannot open";
	open(out,">fis.xls");
	my @out = <FH>;
	my $blast_out = join('',@out);
	my @split_blastout = split(/Reference: Altschul/,$blast_out);
	shift(@split_blastout);
	
	foreach my $line(@split_blastout)
	{
	my $alignment_section;
	my $beginning_annotation;
	my $ending_annotation;
	my $l=0;
	if($line =~ /  Database/mg)
	{
	
	 ($beginning_annotation, $alignment_section,$ending_annotation) = ($line =~ /(.*^Database:)(.*)(^  Database:.*)/ms);
	}
	else
	{
	($beginning_annotation, $alignment_section,$ending_annotation) = ($line =~ /(.*^Database:)(.*)(^BLASTP.*)/ms);
	 
	}
		my ($before_query,$query,$after_query) = ($beginning_annotation =~ /(.*25:3389-3402.)(.*)(Database:.*)/ms);
		
	
		$query =~ s/^\n//gm;
		
		$alignment_section =~ s/^\n//gm;
		
		my @each_record = split(/\>/,$alignment_section);
		shift(@each_record);
		
		foreach my $align (@each_record)
		{
			my @record_line = split(/\n/,$align);
			
			foreach my $align_details (@record_line)
			{
				if($align_details =~/ Score \=(.*) bits (.*)\, Expect \= (.*)/)
				{
					
						$query=~s/Query\= //g;
						
						$query=~s/         \(.*\)\n//g;
						
						$query=~s/\n/ /g;
						
						chomp($query);
						print out"$query\t*$record_line[0]*\n";
						
					
				}
			}
		}
			} #foreach_split_blastout
		
