const gulp = require('gulp')

gulp.task('build_scss', async () => {
  const gulp = require('gulp');
  const sass = require('gulp-sass');
  const rename = require('gulp-rename');
  sass.compiler = require('node-sass');
  const uglifycss = require('gulp-uglifycss');
  gulp.src('./src/scss/index.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(uglifycss({
      "maxLineLen": 80,
      "uglyComments": true
    }))
    .pipe(rename('style.css'))
    .pipe(gulp.dest('./dist/css'));
});
