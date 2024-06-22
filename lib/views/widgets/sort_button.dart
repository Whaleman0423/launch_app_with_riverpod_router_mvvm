part of '../../constants/values.dart';

class SortButton extends StatelessWidget {
  final String text;
  final bool ascending;
  final VoidCallback onPressed;

  const SortButton({
    required this.text,
    required this.ascending,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.sort,
        color: Theme.of(context).iconTheme.color,
      ),
      label: Text(
        '$text: ${ascending ? 'oldest' : 'newest'}',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
