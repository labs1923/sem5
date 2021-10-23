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
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]


$ns duplex-link $n0 $n1 10Mbps 10ms DropTail
$ns duplex-link $n0 $n2 10Mbps 10ms DropTail
$ns duplex-link $n0 $n3 10Mbps 10ms DropTail
$ns duplex-link $n0 $n4 10Mbps 10ms DropTail
$ns duplex-link $n0 $n5 10Mbps 10ms DropTail
$ns duplex-link $n0 $n6 10Mbps 10ms DropTail

$ns duplex-link-op $n0 $n1 orient up
$ns duplex-link-op $n0 $n2 orient right-up
$ns duplex-link-op $n0 $n3 orient right-down
$ns duplex-link-op $n0 $n4 orient down
$ns duplex-link-op $n0 $n5 orient left-down
$ns duplex-link-op $n0 $n6 orient left-up


$ns at 5.00 "finish"
$ns run

