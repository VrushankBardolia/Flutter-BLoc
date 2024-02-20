import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/Bloc/post/post_bloc.dart';
import 'package:flutter_examples/utils/enums.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState(){
    super.initState();
    context.read<PostBloc>().add(PostFetch());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Posts'),scrolledUnderElevation: 0,),
      body: BlocBuilder<PostBloc,PostState>(
        builder: (context, state) {
          switch(state.postStatus){
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.failed:
              return Center(child: Text(state.message.toString()));
            case PostStatus.success:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search Title'
                      ),
                      onChanged: (filterKey){
                        context.read<PostBloc>().add(Search(searchStr: filterKey));
                      },
                    ),
                  ),
                  Expanded(
                    child: state.searchMessage.isNotEmpty ?
                    Center(child: Text(state.searchMessage)):
                    ListView.builder(
                      itemCount: state.tempPostList.isEmpty ? state.postList.length : state.tempPostList.length,
                      itemBuilder: (context,index){
                        if(state.tempPostList.isNotEmpty){
                          final item = state.tempPostList[index];
                          return Card(
                            child: ListTile(
                              title: Text(item.title.toString(),style: const TextStyle(fontSize: 20)),
                              subtitle: Text(item.body.toString()),
                            ),
                          );
                        }else{
                          final item = state.postList[index];
                          return Card(
                            child: ListTile(
                              title: Text(item.title.toString(),style: const TextStyle(fontSize: 20)),
                              subtitle: Text(item.body.toString()),
                            ),
                          );
                        }

                      }
                    ),
                  ),
                ],
              );
          }
        }
      )
    );
  }
}
