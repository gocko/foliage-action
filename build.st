"prepare"
EpMonitor current disable.
Iceberg remoteTypeSelector: #httpsUrl.
"remove baseline to allow a proper load"
#BaselineOfMicrodown asPackage removeFromSystem.
{ 
	{ 'github://estebanlm/Microdown:dev/src'. 'Microdown'. 'Macrodown' }.
	{ 'github://estebanlm/foliage:master/src'. 'Foliage'. 'Publisher' }.
} do: [ :each |
	[ 
		Metacello new
			ignoreImage;
			onConflict: [ :e | e useIncoming ];
			onUpgrade: [ :e | e useIncoming ];
			repository: each first;
			baseline: each second;
			load: each third
	] 
	on: Warning 
	do: [ :w | w resume ] 
]
