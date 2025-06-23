$FrequencyDown = $ARGV[0];
$FrequencyUp =  $ARGV[1];
$File = $ARGV[2];
$ExitFile = $ARGV[3];

print "FrequencyDown: $FrequencyDown\n";
print "FrequencyUp: $FrequencyUp\n";
print "File: $File\n";
print "ExitFile: $ExitFile\n";

open (FILE, $File) or die "Unable to open input file: $!";
open (EXIT, ">$ExitFile") or die "Unable to open output file: $!";

while (<FILE>) {
    chomp;
    $Line = $_;
    @SplitLine = split(/\s+/, $Line);

    if ( ( $SplitLine[1] >= $FrequencyDown ) && ( $SplitLine[1] <= $FrequencyUp ) ) {
        #print "Filtered line: $Line\n";
        print EXIT "$SplitLine[4] $FrequencyDown\n"; #Escribe el valor de frecuencia alado
    }
}

close(FILE);
close(EXIT);

###Script modificado para generar la salida Alleles_ con el valor de frecuencia en una segunda columna! 

#Esto va a resultar en 199 archivos. o menos para el caso de que no haya alelos. 
#Despues de haber generado los 199 archivos los mergeo en bash y ahora si ese merge va de input a la segunda corrida de PReFerSim. 

#Si me gustaría tener los archivos para probarlos. 
#Pero, el output será IDs + frecuencias.
#Luego quiero appendear todos a un solo archivo de IDs y frecuencias. 


