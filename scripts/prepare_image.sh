usage() {
    echo "Usage:"
    echo "  $0 image_name"
    echo
    exit 1
}

if [ "$#" -ne 1 ]; then
    usage
fi

IMAGE=$1

IMAGE_DIR="images/devices"
SMALL_IMAGE_DIR="$IMAGE_DIR/small"

IMAGE_PATH="$IMAGE_DIR/$IMAGE"
SMALL_IMAGE_PATH="$SMALL_IMAGE_DIR/$IMAGE"


if [ ! -f $IMAGE_PATH ]; then
  echo "The specified image name doesn't exist!"
  exit 1
fi

RESULT=$(identify -format "%[fx:w]x%[fx:h]" $IMAGE_PATH)
WIDTH=$(echo $RESULT | cut -d 'x' -f 1)
HEIGHT=$(echo $RESULT | cut -d 'x' -f 2)

if [ $WIDTH -gt 500 ] || [ $HEIGHT -gt 500 ]; then
    echo "The original image is too large, resizing to max. 500x500"
    mogrify -path $IMAGE_DIR -resize 500x500\> $IMAGE_PATH
else
    echo "Original image is $WIDTH x $HEIGHT -> OK"
fi

echo "Generating small image at $SMALL_IMAGE_PATH"
mogrify -path $SMALL_IMAGE_DIR -resize 150x150\> $IMAGE_PATH
