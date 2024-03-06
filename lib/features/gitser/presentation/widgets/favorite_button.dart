import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoriteButton extends StatefulWidget {
  final bool isBookmark;
  final void Function() onFabClick;

  const FavoriteButton({
    Key? key,
    required this.isBookmark,
    required this.onFabClick,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onFabClick,
      child: Icon(
        widget.isBookmark
            ? Icons.bookmark_rounded
            : Icons.bookmark_border_rounded,
      ),
    );
  }
}
