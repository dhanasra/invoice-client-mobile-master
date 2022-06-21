import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownSearch extends StatefulWidget {
  final List searchList;
  final ValueChanged onClick;
  final TextEditingController controller;
  final bool isFocus;

  const DropDownSearch({
    Key? key,
    required this.searchList,
    required this.controller,
    required this.onClick,
    this.isFocus = false
  }):super(key:key);

  @override
  _DropDownSearchState createState() => _DropDownSearchState();
}

class _DropDownSearchState extends State<DropDownSearch> {

  final FocusNode _focusNode = FocusNode();

  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();
  final List<dynamic> _searchResult = [];

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
      } else {
        _overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    print("length is "+ widget.searchList.length.toString());
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
        builder: (context) => Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, size.height + 5.0),
            child: Material(
              elevation: 0.0,
              color: AppColors.WHITE,
              child:Box(
                  bgColor: AppColors.WHITE,
                  child: Box(
                    borderColor: AppColors.WHITE_3,
                    constraints: const BoxConstraints(
                        maxHeight: 300
                    ),
                    margin: const [20,0],
                    isShadow:true,
                    child: ListView.builder(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        shrinkWrap: true,
                        itemCount: _searchResult.length,
                        itemBuilder: (BuildContext context,index){
                          return (_searchResult[index].displayName !=null && _searchResult[index].phones.length!=0)
                          ?ListTile(
                            shape: const Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: AppColors.WHITE_3
                                )
                            ),
                            title: Label(
                              label: _searchResult[index].displayName,
                              mainAxisAlignment: MainAxisAlignment.start,
                              fontFamily: AppFont.FONT,
                              fontWeight: FontWeight.w600,
                              color: AppColors.TEXT_COLOR,
                              fontSize: AppDimen.TEXT_SMALL,
                            ),
                            subtitle: Label(
                              label: _searchResult[index].phones[0].value,
                              mainAxisAlignment: MainAxisAlignment.start,
                              fontFamily: AppFont.FONT,
                              fontWeight: FontWeight.w600,
                              color: AppColors.GRAY_2,
                              fontSize: AppDimen.TEXT_SMALLEST,
                            ),
                            onTap: () {
                              widget.onClick(_searchResult[index]);
                              _overlayEntry.remove();
                              _focusNode.unfocus();
                              setState(() {
                                _searchResult.clear();
                              });
                            },
                          ):Container();
                        }
                    ),
                  )
              ))
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextInput(
        labelText: "Party Name",
        isClassic: true,
        bgColor: white,
        padding: const [15,15,20,10],
        controller: widget.controller,
        fontWeight: FontWeight.w600,
        contentPadding: const [0,0,0,10],
        color: textColor,
        labelColor: textColor1,
        fontSize: 16,
        focusNode: _focusNode,
        autoFocus: widget.isFocus,
        onChanged: onSearchTextChanged,
      ),
    );
  }

  onSearchTextChanged(String text) async {
    print(text);
    _searchResult.clear();
    if (text.isEmpty) {
      _overlayEntry.remove();
      setState(() {});
      return;
    }
    for (var item in widget.searchList) {
      if (item.displayName.contains(text) || item.displayName.contains(text)) {
        _searchResult.add(item);
      }
    }

    _searchResult.isNotEmpty
        ? Overlay.of(context)?.insert(_overlayEntry)
        : _overlayEntry.remove();
    setState(() {});
  }
}