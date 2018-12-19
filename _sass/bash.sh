for file in $(find . -name "*.scss"); do
  echo Processing $file

  cat beginning.txt $file > $file.modified

  mv $file.modified $file

done
