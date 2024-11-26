import 'package:hive/hive.dart';

@HiveType(typeId: 0) // Assign a unique typeId for the Task model.
class Task extends HiveObject {
  @HiveField(0)
  String name; // Removed "final" to make it mutable

  @HiveField(1)
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

// Manually create the adapter class
class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      name: fields[0] as String,
      isDone: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isDone);
  }
}
