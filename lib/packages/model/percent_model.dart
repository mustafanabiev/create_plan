class Percent {
  const Percent({
    required this.name,
    required this.text,
    required this.percent,
  });

  final String name;
  final String text;
  final double percent;
}

const p1 = Percent(
  name: 'Events',
  text: '60',
  percent: 0.6,
);
const p2 = Percent(
  name: 'To Do',
  text: '40',
  percent: 0.4,
);
const p3 = Percent(
  name: 'Quick Notes',
  text: '80',
  percent: 0.8,
);

List<Percent> percents = [p1, p2, p3];
