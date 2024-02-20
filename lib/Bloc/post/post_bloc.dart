import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_examples/utils/enums.dart';
import 'package:meta/meta.dart';

import '../../models/post_model.dart';
import '../../repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  List<PostModel> tempPostList=[];

  PostRepository postRepository= PostRepository();
  PostBloc() : super((const PostState())) {
    on<PostFetch>(_fetchPost);
    on<Search>(_searchPost);
  }

  void _fetchPost(PostFetch event, Emitter<PostState> emit)async{
    await postRepository.fetchPost().then((value){
      emit(state.copyWith(
          postStatus: PostStatus.success,
          message: 'Success',
        postList: List.of(value),
      ));
    }).onError((error, stackTrace){
      emit(state.copyWith(postStatus: PostStatus.failed, message: error.toString()));
    });

  }

  void _searchPost(Search event,Emitter<PostState> emit)async{
    if(event.searchStr.isEmpty){
      emit(state.copyWith(tempPostList: [],searchMessage: ''));
    }else{
      // tempPostList = state.postList.where((element) => element.title.toString() == event.searchStr.toString()).toList();
      tempPostList = state.postList.where((element) => element.title.toString().contains(event.searchStr.toLowerCase())).toList();
      if(tempPostList.isEmpty){
        emit(state.copyWith(tempPostList: tempPostList, searchMessage: 'No Data Found'));
      }else{
        emit(state.copyWith(tempPostList: tempPostList, searchMessage: ''));
      }
    }
  }
}
