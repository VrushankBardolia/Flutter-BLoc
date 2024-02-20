part of 'post_bloc.dart';

@immutable
abstract class PostEvent extends Equatable{

  @override
  List<Object?> get props => [];
}

class PostFetch extends PostEvent{}

class Search extends PostEvent{
  final String searchStr;
  Search({required this.searchStr});
}