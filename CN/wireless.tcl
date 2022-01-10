set ns [new Simulator]

set tracefile [open wireless.tr w]
$ns trace-all $tracefile

set namfile [open wireless.nam w]
$ns namtrace-all-wireless $namfile 500 500

proc finish {} {
global ns tracefile namfile
$ns flush-trace
close $tracefile
close $namfile
exec nam wireless.nam &
exit 0
}

set topo [new Topography]
$topo load_flatgrid 500 500
create-god 4

$ns node-config -adhocRouting AODV -llType LL \
-macType Mac/802_11 -ifqType Queue/DropTail/PriQueue \
-ifqLen 50 -antType Antenna/OmniAntenna \
-propType Propagation/TwoRayGround -phyType Phy/WirelessPhy \
-channel [new Channel/WirelessChannel] -topoInstance $topo \
-agentTrace ON -routerTrace OFF \
-macTrace ON \
-movementTrace OFF

set n0 [$ns node]
set n1 [$ns node]

$ns initial_node_pos $n0 50
$ns initial_node_pos $n1 50

$n0 set X_ 100.0
$n0 set Y_ 100.0
$n0 set Z_ 0.0
$n1 set X_ 300.0
$n1 set Y_ 100.0
$n1 set Z_ 0.0

$ns at 1.0 "$n0 setdest 300.0 100.0 25.0"
$ns at 1.0 "$n1 setdest 300.0 300.0 25.0"

set tcp [new Agent/TCP]
set sink [new Agent/TCPSink]
$ns attach-agent $n0 $tcp
$ns attach-agent $n1 $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 10.0 "finish"
$ns run