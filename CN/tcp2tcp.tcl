set ns [new Simulator] 
$ns color 1 Blue 
$ns color 2 Red 

set file2 [open out.nam w] 
$ns namtrace-all $file2 

proc finish {} { 
global ns  file2 
$ns flush-trace 
close $file2 
exec nam out.nam & 
exit 0 
} 
set n0 [$ns node] 
set n1 [$ns node] 
set n2 [$ns node] 

$n1 color red 
$n1 shape box
$ns duplex-link $n0 $n2 10Mb 10ms DropTail 
$ns duplex-link $n1 $n2 10Mb 10ms DropTail 

#Setup a TCP connection 
set tcp [new Agent/TCP/Newreno] 
$ns attach-agent $n0 $tcp 

set tcp1 [new Agent/TCP/Newreno] 
$ns attach-agent $n1 $tcp1 
$ns connect $tcp $tcp1

$tcp set fid_ 1 
$tcp set window_ 2 
$tcp1 set fid_ 2 
$tcp1 set window_ 2 

#Setup a FTP over TCP connection 
set ftp [new Application/FTP] 
$ftp attach-agent $tcp 
$ftp set type_ FTP 

set ftp1 [new Application/FTP] 
$ftp1 attach-agent $tcp1
$ftp1 set type_ FTP 

$ns at 0.1 "$ftp start" 
$ns at 0.1 "$ftp1 start" 
$ns at 12.0 "$ftp1 stop" 
$ns at 12.5 "$ftp stop" 
$ns at 13.0 "finish" 
$ns run
