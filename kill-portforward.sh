#!/bin/bash
fuser -k 5000/tcp
fuser -k 8000/tcp
fuser -k 8080/tcp
fuser -k 9000/tcp