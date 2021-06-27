#/bin/bash
# ======================================
# This is "Push Static Sites (2S) To(2) IPFS" - easy script for automatised pushing static site to IPFS
# ======================================
# Created 27.06.2021 by SPIDER-L33T
# ======================================
die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || die "Launch example: ./push.sh /home/www.site.ru"
if [ ! -d "$1" ]
then
    echo "Directory $1 not found!"
    exit 1
fi
cd $1
fhash=`ipfs add -r . | awk 'END { print; }' | awk  '{print $2}'`
echo ">>> Pinning site files..."
ipfs pin add -r $fhash
echo ">>> Publishing to Name Service. Please wait..."
nhash=`ipfs name publish $fhash| awk 'END { print; }' | awk  '{print $3}'`
echo "Published to /ipns/${nhash::-1}"
