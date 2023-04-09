#!/bin/bash

. ./scrape_cpu.sh
. ./scrape_free_hd_space.sh
. ./scrape_free_mem.sh

if [ $# != 0 ]; then
	echo "Script takes no arguments"
	exit 1
else
	while true; do
		scrape_cpu
		scrape_free_hd_space
		scrape_free_mem
		sleep 3;
	done
fi
