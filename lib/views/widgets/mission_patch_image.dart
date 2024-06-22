part of "../../constants/values.dart";

Widget cachedImage(String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        CircularProgressIndicator(value: downloadProgress.progress),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
