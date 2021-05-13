const gulp = require('gulp')

gulp.task("build_pug", function () {
  const pug = require('gulp-pug')
  var data = require('gulp-data')
  return gulp.src("./src/views/index.pug")
      .pipe(data((file) => { 
        return { 
          require: require 
        }; 
      }))
      .pipe(pug({
        pretty: true,
        // debug: true
      }))
      .pipe(gulp.dest('dist'));
});
