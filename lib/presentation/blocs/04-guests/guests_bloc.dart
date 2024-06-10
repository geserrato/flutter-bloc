import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:blocs_app/config/config.dart';
import '../../../domain/entities/todo.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(
          GuestsState(
            guests: [
              Todo(
                  id: uuid.v4(),
                  description: RandomGenerator.getRandomName(),
                  completedAt: null),
              Todo(
                  id: uuid.v4(),
                  description: RandomGenerator.getRandomName(),
                  completedAt: null),
              Todo(
                  id: uuid.v4(),
                  description: RandomGenerator.getRandomName(),
                  completedAt: DateTime.now()),
              Todo(
                  id: uuid.v4(),
                  description: RandomGenerator.getRandomName(),
                  completedAt: DateTime.now()),
              Todo(
                  id: uuid.v4(),
                  description: RandomGenerator.getRandomName(),
                  completedAt: null)
            ],
          ),
        ) {
    // on<SetInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.invited));
    // });
    // on<SetNoInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.noInvited));
    // });
    // on<SetAllFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.all));
    // });
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });

    on<AddGuest>(_addGuestHandle);
    on<ToggleGuest>(_toggleGuestHandler);
  }

  void changeFilter(GuestFilter newFilter) {
    add(SetCustomFilterEvent(newFilter));
    // switch (newFilter) {
    //   case GuestFilter.all:
    //     add(SetAllFilterEvent());
    //     break;
    //   case GuestFilter.invited:
    //     add(SetInvitedFilterEvent());
    //     break;
    //   case GuestFilter.noInvited:
    //     add(SetNoInvitedFilterEvent());
    //     break;
    // }
  }

  void addGuest(String name) {
    add(AddGuest(name));
  }

  void toggleGuest(String id) {
    add(ToggleGuest(id));
  }

  void _addGuestHandle(AddGuest event, Emitter<GuestsState> emit) {
    final newGuest =
        Todo(id: uuid.v4(), description: event.name, completedAt: null);
    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void _toggleGuestHandler(ToggleGuest event, Emitter<GuestsState> emit) {
    final newGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(
            completedAt: guest.completedAt == null ? DateTime.now() : null);
      }
      return guest;
    }).toList();

    emit(state.copyWith(guests: newGuests));
  }
}
