class Name{
  final int count;
  final String name;
  final String gender;
  Name( {required this.count, required this.name, required this.gender,});

  factory Name.fromJson(Map name){
    return Name(
        count: name['count'],
        name: name['name'],
        gender:name['gender']
    );
  }
}
