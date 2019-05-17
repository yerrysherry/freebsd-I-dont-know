# default 72 dpi
# xres  = yres = 108 (72 * 1.5)

TXTFILE=/tmp/temp1.$$
OUTFILE=/tmp/temp2.$$
RES="-xres=108 -yres=108"
COMPRESS=-packbits

for x in figures-png/*; do
        # x=figures-png/reference.png -> FILENAME=reference
        #FILENAME=${x##*/}
        #FILENAME=${FILENAME%%.*}
        FILENAME=$(echo $x | sed "s/.*\/\(.*\)\.png/\1/")
        echo "$x  -->  figures-eps/$FILENAME.eps"
        pngtopnm -text $TXTFILE $x | pnmtotiff -rowsperstrip 1000000 $COMPRESS > $OUTFILE 2> /dev/null
        tiff2ps -2 -e -z $OUTFILE > figures-eps/$FILENAME.eps
done
