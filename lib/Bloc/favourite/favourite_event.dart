part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteEvent extends Equatable{

  const FavouriteEvent();
  @override
  List<Object> get props=> [];
}

class FetchFavouriteList extends FavouriteEvent{}

class FavouriteItem extends FavouriteEvent{
  final FavouriteItemModel item;
  const FavouriteItem({required this.item});
}

class SelectItem extends FavouriteEvent{
  final FavouriteItemModel item;
  const SelectItem({required this.item});
}

class DeselectItem extends FavouriteEvent{
  final FavouriteItemModel item;
  const DeselectItem({required this.item});
}

class DeleteItem extends FavouriteEvent{}