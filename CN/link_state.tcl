set ns [new Simulator]
set nf [open thro.nam w]
$ns namtrace-all $nf

$ns color 1 Red
$ns color 2 Blue

proc finish { } {
global ns nf
 $ns flush-trace
close $nf
exec nam thro.nam &
exit 0
}
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n4 $n1 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns duplex-link $n3 $n2 1Mb 10ms DropTail
$ns duplex-link $n4 $n0 1Mb 10ms DropTail
$ns duplex-link $n4 $n3 1Mb 10ms DropTail

set tcp0 [new Agent/TCP/Newreno]
$ns attach-agent $n0 $tcp0
$tcp0 set packetSize_ 500
$tcp0 set interval_ 0.005

set sink0 [new Agent/TCPSink/DelAck]
$ns attach-agent $n1 $sink0
$ns connect $tcp0 $sink0

set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ftp0 set fid_ 1

$ns rtproto LS
$ns rtmodel-at 1.0 down $n0 $n1
$ns rtmodel-at 1.5 down $n4 $n1
$ns rtmodel-at 2.5 up $n1 $n4
$ns rtmodel-at 3.0 up $n1 $n0


$ns at 0.0 "$ftp0 start"
$ns at 3.2 "finish"
$ns run
