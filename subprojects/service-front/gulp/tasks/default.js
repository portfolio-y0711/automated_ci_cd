const gulp = require('gulp')

gulp.task('build', gulp.series('build_pug', 'build_ts', 'build_scss'));

gulp.task('default', gulp.series('build'))