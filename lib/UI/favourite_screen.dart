import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/Bloc/favourite/favourite_bloc.dart';
import 'package:flutter_examples/models/favourite_item_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  void initState(){
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempFavouriteItemList.isNotEmpty? true:false,
                child: IconButton(
                  icon: const Icon(Icons.delete,color: Colors.red),
                  onPressed: (){
                    context.read<FavouriteBloc>().add(DeleteItem());
                  },
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FavouriteBloc,FavouriteState>(
          builder: (BuildContext context, state) {
            switch(state.listStatus){
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.failed:
                return const Center(child: Text('Something Went Wrong!'));
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context,index){
                    final item = state.favouriteItemList[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.value.toString(),
                          style: TextStyle(
                            color: state.tempFavouriteItemList.contains(state.favouriteItemList[index]) ? Colors.red : Colors.black,
                            decoration: state.tempFavouriteItemList.contains(state.favouriteItemList[index]) ? TextDecoration.lineThrough : TextDecoration.
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(item.isFavourite ? Icons.favorite  : Icons.favorite_border_outlined),
                          onPressed: (){
                            FavouriteItemModel itemModel = FavouriteItemModel(
                              id:item.id,
                              value:item.value,
                              isFavourite: item.isFavourite ? false : true
                            );
                            context.read<FavouriteBloc>().add(FavouriteItem(item: itemModel));
                          },
                        ),
                        leading: Checkbox(
                          value: state.tempFavouriteItemList.contains(state.favouriteItemList[index]) ? true : false,
                          onChanged: (bool? value) {
                            FavouriteItemModel item = state.favouriteItemList[index];
                            if(value!){
                              context.read<FavouriteBloc>().add(SelectItem(item: item));
                            }else{
                              context.read<FavouriteBloc>().add(DeselectItem(item: item));
                            }
                          },
                        ),
                      ),
                    );
                  }
                );
            }
          },
        ),
      ),
    );
  }
}
