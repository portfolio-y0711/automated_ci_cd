const gulp = require('gulp')
const debug = require('gulp-debug')
const browserSync = require('browser-sync').create()

gulp.task("build:pug", function () {
    const pug = require('gulp-pug')
    var data = require('gulp-data')
    return gulp.src("./src/views/index.pug").pipe(data((file) => {
          return {require: require};
      })).pipe(pug({ pretty: true })).pipe(gulp.dest('dist'))
      .pipe(browserSync.reload({ stream : true }))
})

gulp.task("build:html", function () {
    const pug = require('gulp-pug')
    var data = require('gulp-data')
    return gulp.src("./src/views/components/**/*.pug").pipe(data((file) => {
          return {require: require};
      })).pipe(pug({
          pretty: true
      })).pipe(gulp.dest('dist/html'))
})


// gulp.task('build:ts', function () {
//     const webpack = require('webpack-stream')
//     const uglify = require('gulp-uglify')
//     const {tsConfig} = require('./webpack')
//     tsConfig.entry = './src/ts/index.ts'
//     tsConfig.output = {
//         filename: 'bundle.js'
//     }
//     tsConfig.mode = 'development'
//     return gulp.src('src').pipe(webpack(tsConfig)).pipe(gulp.dest('dist')).pipe(browserSync.reload( {stream : true} ));
// })

gulp.task('build:ts', function() {
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
    .pipe(gulp.dest('dist')).pipe(browserSync.reload( {stream : true} ))
})


gulp.task('build:scss', async () => {
    const gulp = require('gulp');
    const sass = require('gulp-sass');
    const rename = require('gulp-rename');
    sass.compiler = require('node-sass');
    const uglifycss = require('gulp-uglifycss');
    gulp.src('./src/scss/index.scss').pipe(sass().on('error', sass.logError)).pipe(uglifycss({"maxLineLen": 80, "uglyComments": true})).pipe(rename('style.css')).pipe(gulp.dest('./dist/'))
      .pipe(browserSync.reload( {stream : true} ));
})

gulp.task('build', gulp.series('build:pug', 'build:ts', 'build:scss', 'build:html'));

gulp.task('watch', async () => {
    gulp.watch([
        'gulpfile.js', 'src/ts/**/*.*', 'src/scss/**/*.scss', 'src/views/**/*.pug'
    ], gulp.series('build'))
})

gulp.task('browserSync', gulp.series(['build:pug', 'build:ts', 'build:scss', 'build:html'], () => { 
    return browserSync.init({ 
        port : 3333, 
        server: { 
            baseDir: './dist' ,
            middleware: function (req, res, next) {
                res.setHeader('Access-Control-Allow-Origin', '*');
                next()
            }
        } 
    }) 
}))


const defaultTask = gulp.parallel('build', ['browserSync', 'watch'])

module.exports = {
    default: defaultTask
}
