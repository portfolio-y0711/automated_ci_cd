const gulp = require('gulp')
const debug = require('gulp-debug')

gulp.task('build_ts', function() {
    const browserify = require('browserify')
    const source = require("vinyl-source-stream");
    const tsify = require('tsify')

    return browserify({
        basedir: ".",
        debug: true,
        entries: ["src/ts/index.ts"],
        cache: {},
        packageCache: {},
    })
    .plugin(tsify)
    .bundle()
    .pipe(source("bundle.js"))
    .pipe(gulp.dest('dist/js'))
})

// gulp.task('build_ts', function() {
//   const webpack = require('webpack-stream')
//   const uglify = require('gulp-uglify')
//   const { tsConfig } = require('../../webpack')
//   tsConfig.entry = './src/ts/index.ts'
//   tsConfig.output = { filename: 'bundle.js' }
//   tsConfig.mode = 'development'
//   return gulp.src('src')
//     .pipe(webpack(tsConfig))
//     .pipe(gulp.dest('dist'))
// });
