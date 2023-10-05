import 'package:flutter/material.dart';
import 'package:move_home_assignment/ui/modules/home/widgets/filter_bar.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
      title: isSearching
          ? const FilterBar()
          : Transform.scale(
              scale: 0.5,
              child: Image.asset(
                'assets/images/TitleLogo.png',
              ),
            ),
      actions: isSearching
          ? []
          : <Widget>[
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Image.asset(
                  'assets/logos/Logo.png',
                ),
              ),
            ],
    );
  }
}
