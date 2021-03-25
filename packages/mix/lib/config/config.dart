// HOW TO USE ?

/*

    initState((){

      Mix(Config(
        font: gfont

        appVersion: '1.0.0+1'
      ));

    })


*/

class Mix {
  final Config config;
  Mix(this.config);
}

class Config {
  Config({
    this.app: 0,
  });

  int app;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        app: json["app"],
      );

  Map<String, dynamic> toJson() => {
        "app": app,
      };
}
