set ns [new Simulator]
set nf [open thro.nam w]
$ns namtrace-all $nf
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
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp0
set null0 [new Agent/Null]
$ns attach-agent $n1 $null0
$ns connect $udp0 $null0
$ns rtproto LS
$ns rtmodel-at 1.5 down $n0 $n1
$ns rtmodel-at 2.0 down $n4 $n1
$ns rtmodel-at 2.5 up $n1 $n4
$ns rtmodel-at 2.9 up $n1 $n0
$udp0 set fid_ 1
$ns color 1 Red
$ns color 2 Green
$ns at 1.0 "$cbr0 start"
$ns at 3.2 "finish"
$ns run
