part of 'favourite_bloc.dart';

enum ListStatus { loading, success, failed }

class FavouriteState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> tempFavouriteItemList;
  final ListStatus listStatus;

  const FavouriteState({
    this.tempFavouriteItemList = const [],
    this.favouriteItemList = const [],
    this.listStatus = ListStatus.loading
  });

  FavouriteState copyWith({List<FavouriteItemModel>? favouriteItemList, List<FavouriteItemModel>? tempFavouriteItemList, ListStatus? listStatus}) {
    return FavouriteState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      tempFavouriteItemList: tempFavouriteItemList ?? this.tempFavouriteItemList,
      listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object?> get props => [favouriteItemList, tempFavouriteItemList, listStatus];
}
