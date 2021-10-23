set ns [new Simulator]

set nf [open out.nam w]
$ns namtrace-all $nf

proc finish {} {
global ns nf
$ns flush-trace
close $nf
puts "running nam"
exec nam out.nam &
exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n0 $n1 10Mbps 10ms DropTail
$ns duplex-link $n0 $n2 10Mbps 10ms DropTail
$ns duplex-link $n0 $n3 10Mbps 10ms DropTail

$ns duplex-link $n1 $n2 10Mbps 10ms DropTail
$ns duplex-link $n1 $n3 10Mbps 10ms DropTail

$ns duplex-link $n2 $n3 10Mbps 10ms DropTail


$ns at 5.00 "finish"
$ns run

