usage() {
    echo "Usage:"
    echo "  ./scripts/generate_small_image.sh image_name"
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

if [ -f $SMALL_IMAGE_PATH ]; then
  echo "The small image already exists!"
  exit 1
fi

mogrify -path $SMALL_IMAGE_DIR -resize 150x150\> $IMAGE_PATH
