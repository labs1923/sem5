set ns [new Simulator] 
$ns color 1 Blue 
$ns color 2 Red 

set file1 [open out.tr w] 
$ns trace-all $file1 
set file2 [open udpout1.nam w] 
$ns namtrace-all $file2 

proc finish {} { 
global ns file1 file2 
$ns flush-trace 
close $file1 
close $file2 
puts "running nam"
exec nam udpout1.nam & 
exit 0 
} 

set n0 [$ns node] 
set n1 [$ns node] 
set n2 [$ns node] 
set n3 [$ns node] 
set n4 [$ns node] 

$n1 color red 
$n1 shape box
$ns duplex-link $n0 $n2 2Mb 10ms DropTail 
$ns duplex-link $n1 $n2 2Mb 10ms DropTail 

$ns duplex-link $n0 $n3 2Mb 10ms DropTail 
$ns duplex-link $n1 $n3 2Mb 10ms DropTail 

$ns duplex-link $n0 $n4 2Mb 10ms DropTail 
$ns duplex-link $n1 $n4 2Mb 10ms DropTail 

#Setup a TCP connection 
set udp [new Agent/UDP] 
$ns attach-agent $n0 $udp
set null [new Agent/Null]
$ns attach-agent $n1 $null
$ns connect $udp $null
set udp1 [new Agent/UDP] 
$ns attach-agent $n1 $udp1 
set null1 [new Agent/Null]
$ns attach-agent $n0 $null1
$ns connect $udp1 $null1

$udp set fid_ 1 
$udp1 set fid_ 2 

set cbr [new Application/Traffic/CBR] 
$cbr attach-agent $udp 
$cbr set type_ CBR 

set cbr1 [new Application/Traffic/CBR] 
$cbr1 attach-agent $udp1 
$cbr1 set type_ CBR 

$ns at 0.1 "$cbr start" 
$ns at 0.1 "$cbr1 start" 
$ns at 0.5 "$cbr stop" 
$ns at 0.5 "$cbr1 stop" 

$ns at 13.05 "finish" 
$ns run
