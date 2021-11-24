import 'package:flutter/cupertino.dart';

class SmartHorizontalListView extends StatefulWidget {
  final int itemCount;
  final EdgeInsetsGeometry padding;
  final IndexedWidgetBuilder itemBuilder;
  final Function onListEndReached;

  SmartHorizontalListView({
    required this.itemCount,
    required this.padding,
    required this.itemBuilder,
    required this.onListEndReached,
  });

  @override
  State<SmartHorizontalListView> createState() =>
      _SmartHorizontalListViewState();
}

class _SmartHorizontalListViewState extends State<SmartHorizontalListView> {
  var _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print("START OF LIST");
        } else {
          print("END OF LIST");
          widget.onListEndReached();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      padding: widget.padding,
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }
}
