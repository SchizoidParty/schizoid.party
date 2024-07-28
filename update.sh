#!/bin/sh

hugo

rsync -rtvzP public/ cheems@schizoid.party:/var/www/website/
