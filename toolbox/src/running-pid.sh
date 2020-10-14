#!/usr/bin/env bash
ID=$(pidof -s $1) 
ps aux | grep $ID | head -n 1
