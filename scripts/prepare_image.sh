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

# Trim the image
mogrify -path $IMAGE_DIR -trim +repage $IMAGE_PATH

RESULT=$(identify -format "%[fx:w]x%[fx:h]" $IMAGE_PATH)
WIDTH=$(echo $RESULT | cut -d 'x' -f 1)
HEIGHT=$(echo $RESULT | cut -d 'x' -f 2)

if [ $WIDTH -gt 500 ] || [ $HEIGHT -gt 500 ]; then
    echo "The trimmed image is too large, resizing to max. 500x500"
    mogrify -path $IMAGE_DIR -resize 500x500\> $IMAGE_PATH
elif [ $WIDTH -lt 500 ] && [ $HEIGHT -lt 500 ]; then
    echo "The trimmed image is smaller than the target size and will be enlarged. Please check the resulting image's quality!"
    mogrify -path $IMAGE_DIR -resize 500x500\< $IMAGE_PATH
elif [ $WIDTH -eq 500 ] && [ $HEIGHT -eq 500 ]; then
    echo "The trimmed image has exactly equal width and height. This is most likely wrong, please check the wiki!"
fi

echo "Generating small image at $SMALL_IMAGE_PATH"
mogrify -path $SMALL_IMAGE_DIR -resize 150x150\> $IMAGE_PATH
