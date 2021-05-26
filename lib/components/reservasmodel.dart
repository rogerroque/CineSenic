class Reservas {
  String movieName;
  var butacas = {};
  String date;
  var menus = {};
  String time;
  String total;
  var cscpoints;

  Reservas({this.movieName, this.butacas, this.date, this.time, this.menus, this.total, this.cscpoints});
}

List<Reservas> reservas = [];