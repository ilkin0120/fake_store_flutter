import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/wishlist/get_wishlist_usecase.dart';
import '../../domain/usecases/wishlist/toggle_wishlist_usecase.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit({
    required GetWishlistUseCase getWishlistUseCase,
    required ToggleWishlistItemUseCase toggleWishlistItemUseCase,
  }) : _getWishlistUseCase = getWishlistUseCase,
       _toggleWishlistItemUseCase = toggleWishlistItemUseCase,
       super(WishlistState.initial());

  final GetWishlistUseCase _getWishlistUseCase;
  final ToggleWishlistItemUseCase _toggleWishlistItemUseCase;

  Future<void> loadWishlist() async {
    emit(state.copyWith(isLoading: true));
    try {
      final ids = await _getWishlistUseCase();
      emit(WishlistState(ids: ids, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> toggle(int id) async {
    final updated = {...state.ids};
    final wasInWishlist = isWished(id);

    wasInWishlist ? updated.remove(id) : updated.add(id);
    emit(state.copyWith(ids: updated));

    unawaited(
      _toggleWishlistItemUseCase(id).catchError((e) {
        if (wasInWishlist) {
          updated.add(id);
        } else {
          updated.remove(id);
        }
        emit(state.copyWith(ids: updated, error: e.toString()));
      }),
    );
  }

  bool isWished(int id) => state.ids.contains(id);
}
