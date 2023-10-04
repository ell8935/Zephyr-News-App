import 'package:flutter/material.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/filter_bar.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearching = false;

  void toggleSearch() {
    setState(() {
      isSearching = !isSearching;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(isSearching ? Icons.close : Icons.search),
        onPressed: toggleSearch,
      ),
      title: isSearching ? const FilterBar() : const Text('Headlines'),
      actions: isSearching
          ? []
          : <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  child: Image.asset(
                    'assets/logos/Logo.png',
                  ),
                ),
              ),
            ],
    );
  }
}
