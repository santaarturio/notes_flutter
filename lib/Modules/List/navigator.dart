import 'package:notes/Misc/navigator.dart';
import 'package:notes/Model/note.dart';

class NotesNavigator extends BaseNavigator {
  Future<T?> navigateToDetails<T>(Note note) {
    return state.push(buildRoute(
      destination: RouteBundle(
        name: '/details',
        containerType: ContainerType.scaffold,
      ),
      child: factory.makeDetailscreen(note: note),
    ));
  }

  Future<T?> navigateToCreate<T>() {
    return state.push(buildRoute(
      destination: RouteBundle(
        name: '/create',
        containerType: ContainerType.scaffold,
      ),
      child: factory.makeCreateNoteScreen(),
    ));
  }
}
