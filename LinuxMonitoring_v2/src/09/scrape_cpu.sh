#!/bin/bash

function scrape_cpu {
echo "# HELP cpu_used_in_percent The total CPU used as percent value" >> metrics.html
echo "# TYPE cpu_used_in_percent gauge" >> metrics.html	
echo "cpu_used_in_percent $(ps -eo pcpu | awk '{s+=$1} END {print s}')" >> metrics.html
}
