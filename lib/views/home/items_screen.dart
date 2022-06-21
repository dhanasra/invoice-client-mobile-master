import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/bloc/network_event.dart';
import 'package:im/modals/item_model.dart';
import 'package:im/view_models/item_view_model.dart';
import 'package:im/widgets/button/stack_button.dart';
import 'package:im/widgets/cards/item_card.dart';
import 'package:im/widgets/input/tags_radio.dart';
import 'package:im/widgets/view/empty.dart';

import '../../bloc/network_bloc.dart';
import '../../bloc/network_state.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  late NetworkBloc bloc;

  @override
  void initState() {
    bloc = NetworkBloc(Init());
    super.initState();
    bloc.add(GetAllItemEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Label(
            padding: [0,10],
            label: "Items",
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          shadowColor: white,
          elevation: 1,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              color: iconColor,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              color: iconColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: BlocBuilder<NetworkBloc,NetworkState>(
        bloc: bloc,
        builder: (context, state){
          if(state is Loading){
            return const Loader();
          } else if(state is Fetched){
            if(state.data.length>0) {
              return body(state.data);
            }else{
              return bodyEmpty();
            }
          }else{
            return const Box();
          }
        },
      ));
  }

  Widget body(List<ModelItem?> items) {
    return StackButton(
      btnText: "Create New Item",
      route: AppRoutes.APP_ITEM_CREATE,
      icon: Icons.add_circle,
      child: Column(
        children: [
          Box(
            expanded: true,
            decoration: const BoxDecoration(
                color: white,
                border: Border(bottom: BorderSide(
                    color: borderColor,
                    width: 4,
                    style: BorderStyle.solid
                ))
            ),
            padding: const [15],
            bgColor: white,
            child: TagsRadio(tags: const ["All", "Low Stock"],selected: (val){},),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.only(top: 15),
                itemBuilder: (BuildContext context, index) {
                  return ItemCard(
                    item: items[index]!,
                    onPressed: (){
                      ItemViewModel.currentItemId = items[index]!.id;
                      App().setNavigation(context, AppRoutes.APP_ITEM_DETAILS);
                    },
                    onEditPressed: () { },
                  );
                }
            ),
          )
        ],
      ),
    );
  }

  Widget bodyEmpty() {
    return const Empty(
      text: "add_item",
      btnText: "create_item",
      route: AppRoutes.APP_ITEM_CREATE,
      icon: CupertinoIcons.cube_box_fill,
    );
  }
}
