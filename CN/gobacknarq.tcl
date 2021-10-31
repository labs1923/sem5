set ns [new Simulator]

set nf [open Go-Back-N.nam w]
$ns namtrace-all $nf
set f [open Go-Back-N.tr w]
$ns trace-all $f

proc finish {} {
global ns
$ns flush-trace
puts "running nam..."
exec nam Go-Back-N.nam &
exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns at 0.0 "$n0 label Sender"
$ns at 0.0 "$n1 label Receiver"
$n0 color red
$n1 color blue


$ns duplex-link $n0 $n2 0.2Mb 200ms DropTail
$ns duplex-link $n2 $n3 0.2Mb 200ms DropTail
$ns duplex-link $n3 $n1 0.2Mb 200ms DropTail


set tcp [new Agent/TCP]
$tcp set windowInit_ 2
$tcp set maxcwnd_ 2
$ns attach-agent $n0 $tcp

set sink [new Agent/TCPSink]

$ns attach-agent $n1 $sink

$ns connect $tcp $sink
$ns rtmodel-at 1.80 down $n2 $n3
$ns rtmodel-at 1.91 up $n2 $n3
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.1 "$ftp start"
$ns at 10.68 "$ftp stop"
$ns at 11.0 "finish"
$ns run
