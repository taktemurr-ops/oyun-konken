import 'package:flutter_test/flutter_test.dart';
import 'package:kart_motoru/kart_motoru.dart';
import 'package:oyun_konken/oyun_konken.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(konkenConfig.title.length, 33);
    expect(konkenConfig.tagline.length, 33);
    for (final s in konkenConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler kazanılabilir ve oyun sonuna kadar oynanır', () {
    final planner = LevelPlanner(gameId: konkenId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = konkenRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
      final end = TableGameRules.simulate(gl.puzzle);
      expect(end.over, isTrue, reason: 'bölüm $lv');
    }
  });
}
