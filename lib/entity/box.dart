/// [Box] có x và y là tọa độ điểm trên bên trái,
/// width và height của Box
class Box {
  const Box({
    required this.x,
    required this.y,
    required this.height,
    required this.width,
  });
  final double x;
  final double y;
  final double width;
  final double height;
}
