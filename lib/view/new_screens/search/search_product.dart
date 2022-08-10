import 'package:flutter/material.dart';

class SearchProduct extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SearchProduct({Key key, @required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        maxLines: 1,
        style: const TextStyle(fontSize: 16),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: Icon(Icons.menu, color: Theme.of(context).iconTheme.color),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
          contentPadding: EdgeInsets.zero,
          hintText: 'Search for medicine/health products',
          hintStyle: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
