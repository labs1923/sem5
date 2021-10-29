
set ns [new Simulator] 
$ns color 1 Blue 
$ns color 2 Red 
#Open the Trace files 
set file1 [open out.tr w] 
$ns trace-all $file1 
set file2 [open udpout1.nam w] 
$ns namtrace-all $file2 
#Define a 'finish' procedure 
proc finish {} { 
global ns  file2 
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
set udp1 [new Agent/UDP] 
$ns attach-agent $n1 $udp1 
$ns connect $udp $udp1
$udp set fid_ 1 

$udp1 set fid_ 2 

#Setup a FTP over TCP connection 
set cbr [new Application/Traffic/CBR] 
$cbr attach-agent $udp 
#$cbr set window_ 10 
$cbr set type_ CBR 

set cbr1 [new Application/Traffic/CBR] 
$cbr1 attach-agent $udp1 
$cbr1 set type_ CBR 
#$cbr1 set window_ 2 


$ns at 0.4 "$cbr start" 
$ns at 0.4 "$cbr1 start" 
$ns at 0.47 "$cbr stop" 
$ns at 0.47 "$cbr1 stop" 
$ns at 0.48 "$cbr start" 
$ns at 0.48 "$cbr1 start" 
$ns at 0.55 "$cbr stop" 
$ns at 0.55 "$cbr1 stop"
$ns at 13.05 "finish" 
$ns run

