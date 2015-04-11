var gulp = require('gulp');
var stylus = require('gulp-stylus');
var del = require('del');
var autoprefix = require('gulp-autoprefixer');
var browserSync = require('browser-sync');
var reload      = browserSync.reload;

gulp.task('styles:clean', function (cb) {
  del(['./WebContent/styles/css'], cb);
});

gulp.task('browser-sync', function() {
    browserSync({
        proxy: "localhost:8080"
    });
});

gulp.task('styles', ['styles:clean'], function () {
  gulp.src(['./WebContent/styles/main.styl'])
  .pipe(stylus())
  .pipe(autoprefix())
  .pipe(gulp.dest('./WebContent/styles/css'))
  .pipe(reload({stream:true}));
  console.log('reloaded');
});

gulp.task('build', ['styles', 'browser-sync']);

gulp.task('watch', ['build'], function () {
  gulp.watch('./WebContent/styles/**/*.styl', ['styles']);
  console.log('Im watching');
});

gulp.task('default', ['watch']);
