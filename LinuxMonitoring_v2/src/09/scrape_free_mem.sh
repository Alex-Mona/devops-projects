#!/bin/bash

function scrape_free_mem {
echo "# HELP free_mem_in_bytes The free RAM left in bytes" >> metrics.html
echo "# TYPE free_mem_in_bytes gauge" >> metrics.html
echo "free_mem_in_bytes $(free -b | awk 'NR==2{print $4}')" >> metrics.html
}
