import 'package:flutter/material.dart';
import 'package:move_home_assignment/shared/widgets/filter_bar.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  void toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (isSearching) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
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
      title: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.translate(
            offset: Offset(10 * _controller.value, 0),
            child: child,
          );
        },
        child: isSearching
            ? const FilterBar()
            : Transform.scale(
                scale: 0.5,
                child: Image.asset(
                  'assets/images/TitleLogo.png',
                ),
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
