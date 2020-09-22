class SuperHero {
  final String name;
  final String fullname;
  final String occupation;
  final String base;
  final String group;
  final String image;

  SuperHero(
      {this.name,
      this.fullname,
      this.occupation,
      this.base,
      this.group,
      this.image});

  factory SuperHero.fromJson(Map<String, dynamic> json) {
    return SuperHero(
        name: json['results'][0]['name'],
        fullname: json['results'][0]['biography']['full-name'],
        occupation: json['results'][0]['work']['occupation'],
        base: json['results'][0]['work']['base'],
        group: json['results'][0]['connections']['group-affiliation'],
        image: json['results'][0]['image']['url']);
  }
}
