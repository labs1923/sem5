LanRouter set debug_ 0
set ns [new Simulator] 
$ns color 1 Blue 
$ns color 2 Red 
#Open the Trace files 
set file1 [open out.tr w] 
set winfile [open WinFile w] 
$ns trace-all $file1 
set file2 [open out.nam w] 
$ns namtrace-all $file2 
#Define a 'finish' procedure 
proc finish {} { 
global ns file1 file2 
$ns flush-trace 
close $file1 
close $file2 
exec nam out.nam & 
exit 0 
} 
set n0 [$ns node] 
set n1 [$ns node] 
set n2 [$ns node] 
set n3 [$ns node] 
set n4 [$ns node] 
set n5 [$ns node] 
$n1 color red 
$n1 shape box
$ns duplex-link $n0 $n2 2Mb 10ms DropTail 
$ns duplex-link $n1 $n2 2Mb 10ms DropTail 
$ns simplex-link $n2 $n3 0.3Mb 100ms DropTail 
$ns simplex-link $n3 $n2 0.3Mb 100ms DropTail 
set lan [$ns newLan "$n3 $n4 $n5" 0.5Mb 40ms LL Queue/DropTail MAC/Csma/Cd Channel] 

#Setup a TCP connection 
set tcp [new Agent/TCP/Newreno] 
$ns attach-agent $n0 $tcp 
set sink [new Agent/TCPSink/DelAck] 
$ns attach-agent $n4 $sink 
$ns connect $tcp $sink 
$tcp set fid_ 1 
$tcp set window_ 8000 
$tcp set packetSize_ 552 
#Setup a FTP over TCP connection 
set ftp [new Application/FTP] 
$ftp attach-agent $tcp 
$ftp set type_ FTP 
#Setup a UDP connection 
set udp [new Agent/UDP] 
$ns attach-agent $n1 $udp 
set null [new Agent/Null] 
$ns attach-agent $n5 $null 
$ns connect $udp $null 
$udp set fid_ 2 
#Setup a CBR over UDP connection 
set cbr [new Application/Traffic/CBR] 
$cbr attach-agent $udp 
$cbr set type_ CBR 
$cbr set packet_size_ 1000 
$cbr set rate_ 0.01mb 
$cbr set random_ false 
$ns at 0.1 "$cbr start" 
$ns at 1.0 "$ftp start" 
$ns at 124.0 "$ftp stop" 
$ns at 124.5 "$cbr stop" 
$ns at 125.0 "finish" 
$ns run
